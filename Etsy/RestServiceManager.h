//
//  RestServiceManager.h
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AFNetworking;

@interface RestServiceManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
