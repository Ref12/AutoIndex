function Get-CacheConfig {
    param();
    $localCache = @{
        Assembly                   = "BuildXL.Cache.MemoizationStoreAdapter";
        Type                       = "BuildXL.Cache.MemoizationStoreAdapter.MemoizationStoreCacheFactory";
        CacheId                    = "SelfhostCS2L1";
        MaxCacheSizeInMB           = 40480;
        CacheRootPath              = $env:BUILDXL_LOCAL_CACHE_DIRECTORY;
        CacheLogPath               = "[BuildXLSelectedLogPath]";
        UseStreamCAS               = $true;
        UseRocksDbMemoizationStore = $true;
    };

    if (!($env:BUILDXL_REMOTE_CACHE_DIRECTORY)) {
        return $localCache;
    }

    if (!(Test-Path $env:BUILDXL_REMOTE_CACHE_DIRECTORY)) {
        New-Item -Path $env:BUILDXL_REMOTE_CACHE_DIRECTORY -ItemType Directory
    }

    $remoteCache = @{
        Assembly                   = "BuildXL.Cache.MemoizationStoreAdapter";
        Type                       = "BuildXL.Cache.MemoizationStoreAdapter.MemoizationStoreCacheFactory";
        CacheId                    = "SelfhostCS2L2";
        MaxCacheSizeInMB           = 40480;
        CacheRootPath              = $env:BUILDXL_REMOTE_CACHE_DIRECTORY;
        CacheLogPath               = "[BuildXLSelectedLogPath].remote.log";
        UseStreamCAS               = $true;
        UseRocksDbMemoizationStore = $true;
    };

    $resultCache = @{
        Assembly                              = "BuildXL.Cache.VerticalAggregator";
        Type                                  = "BuildXL.Cache.VerticalAggregator.VerticalCacheAggregatorFactory";
        RemoteIsReadOnly                      = $false;
        RemoteContentIsReadOnly               = $false;
        WriteThroughCasData                   = $true;
        LocalCache                            = $localCache;
        RemoteCache                           = $remoteCache;
        RemoteConstructionTimeoutMilliseconds = 36000;
        SkipDeterminismRecovery               = $true;
        FailIfRemoteFails                     = $true;
    };

    return $resultCache;
}

$configOptions = Get-CacheConfig;

if (!(Test-Path $env:BUILDXL_LOCAL_CACHE_DIRECTORY)) {
    New-Item -Path $env:BUILDXL_LOCAL_CACHE_DIRECTORY -ItemType Directory
}

Set-Content -Path "$env:BUILDXL_LOCAL_CACHE_DIRECTORY/cacheconfig.json" -Value (ConvertTo-Json $configOptions)