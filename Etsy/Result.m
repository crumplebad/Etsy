//
//  Result.m
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "Result.h"

@implementation Result

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        self.resultTitle = [dictionary objectForKey:@"title"];
        self.resultDescription = [dictionary objectForKey:@"description"];
        self.resultImage = [[dictionary objectForKey:@"MainImage"] objectForKey:@"url_170x135"];
    }
    
    return self;
}

@end
