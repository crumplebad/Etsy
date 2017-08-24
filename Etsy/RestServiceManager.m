//
//  RestServiceManager.m
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "RestServiceManager.h"

static NSString * const EtsyAPIBaseURLString = @"https://api.etsy.com/v2/listings/active";

@implementation RestServiceManager

+ (instancetype)sharedClient {
    static RestServiceManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[RestServiceManager alloc] initWithBaseURL:[NSURL URLWithString:EtsyAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
