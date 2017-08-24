//
//  Results.h
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Result.h"

@interface Results : NSObject

@property (nonatomic, strong) NSArray *value;

- (id)initWithArray:(NSArray *)array;

@end
