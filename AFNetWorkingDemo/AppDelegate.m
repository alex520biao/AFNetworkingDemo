//
//  AppDelegate.m
//  AFNetWorkingDemo
//
//  Created by Marshal Wu on 14-9-16.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <AFHTTPSessionManager.h>

#import "AppDelegate.h"
#import "AppDelegate+TMCacheDemo.h"
#import "HttpMock.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //AFNetworking监听网络状态变化
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];

    //设置OHHTTPStubs
    [HttpMock initMock];
    
    //测试TMCache
    [self testTMCache];

    return YES;
}


@end
