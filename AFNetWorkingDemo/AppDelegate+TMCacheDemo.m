//
//  AppDelegate+TMCacheDemo.m
//  AFNetWorkingDemo
//
//  Created by liubiao on 15/3/12.
//  Copyright (c) 2015年 Marshal Wu. All rights reserved.
//

#import "AppDelegate+TMCacheDemo.h"
#import "TMCache.h"

@implementation AppDelegate (TMCacheDemo)

-(void)testTMCache{
    //TMCache使用专题
    [[TMCache sharedCache] setObject:@"1234567890"
                              forKey:@"kTestKey"
                               block:^(TMCache *cache, NSString *key, id object) {
                                   //初始状态
                                   NSString* value = (NSString*)[[TMCache sharedCache] objectForKey:@"kTestKey"];
                                   
                                   //在内存中删除
                                   [[TMMemoryCache sharedCache] removeObjectForKey:@"kTestKey"];
                                   //value1为nil，说明内存中kTestKey已经被销毁
                                   NSString* value1 = (NSString*)[[TMMemoryCache sharedCache] objectForKey:@"kTestKey"];
                                   
                                   //再次获取kTestKey数据: 内存有则从内存取,没有则从本地取
                                   NSString* value2 = (NSString*)[[TMCache sharedCache] objectForKey:@"kTestKey"];
                                   
                                   //彻底删除kTestKey: 内存和本地一起删除
                                   [[TMCache sharedCache]removeObjectForKey:@"kTestKey"];
                                   //value3为nil，说明已经彻底删除
                                   NSString* value3 = (NSString*)[[TMCache sharedCache] objectForKey:@"kTestKey"];
                                   NSLog(@"1111");
                               }];
}

@end
