//
//  Results.m
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "Results.h"
#import "Result.h"

@implementation Results

- (id)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        NSMutableArray *anArray = [NSMutableArray new];
        
        for (id object in array) {
            [anArray addObject:[[Result alloc] initWithDictionary:object]];
        }
        
        self.value = anArray;
    }
    
    return self;
}

@end
