//
//  UserDefaultHandler.m
//  Qwykr
//
//  Created by Gorav Grover on 12/9/16.
//  Copyright © 2016 Gorav. All rights reserved.

#import "UserDefaultHandler.h"
#import "Constant.h"

#define kUserAccessToken @"access_token"
#define kRefreshToken    @"refresh_token"
#define kDeviceToken     @"Device_token"


@implementation UserDefaultHandler

#pragma mark-
#pragma mark: User Access Token

+(void)setUserAccessToken:(NSString*)accessToken
{
    [KUserDefault removeObjectForKey:kUserAccessToken];
    [KUserDefault setObject:accessToken forKey:kUserAccessToken];
    [KUserDefault synchronize];
}

+(NSString*)getUserAccessToken{
    return [KUserDefault objectForKey:kUserAccessToken];
}

+(void)removeAccessToken
{
    [KUserDefault removeObjectForKey:kUserAccessToken];
}


#pragma mark: Refresh Access Token

+(void)setRefreshToken:(NSString*)refreshToken
{
    [KUserDefault removeObjectForKey:kRefreshToken];
    [KUserDefault setObject:refreshToken forKey:kRefreshToken];
    [KUserDefault synchronize];
}
+(NSString*)getRefreshToken
{
   return [KUserDefault objectForKey:kRefreshToken];
}

+(void)removeRefreshToken{
    
    [KUserDefault removeObjectForKey:kRefreshToken];
}



#pragma mark-
#pragma mark: Device Token

+(void)setDeviceToken:(NSString*)deviceToken
{
    [KUserDefault removeObjectForKey:kDeviceToken];
    [KUserDefault setObject:deviceToken forKey:kDeviceToken];
    [KUserDefault synchronize];
}

+(NSString*)getDeviceToken
{
   return [KUserDefault objectForKey:kDeviceToken];
}

+(void)removeDeviceToken
{
    [KUserDefault removeObjectForKey:kDeviceToken];
}


@end
