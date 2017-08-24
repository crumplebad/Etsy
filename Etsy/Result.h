//
//  Result.h
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (nonatomic, strong) NSString *resultTitle;
@property (nonatomic, strong) NSString *resultDescription;
@property (nonatomic, strong) NSString *resultImage;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
