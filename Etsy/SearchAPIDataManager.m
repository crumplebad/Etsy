//
//  SearchAPIDataManager.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchAPIDataManager.h"
#import "Constants.h"
#import "Utility.h"

@implementation SearchAPIDataManager


- (void)getSearchResultsFromServerFor:(NSString *)searchString pageNumber:(int)pageNumber {
    
    NSString *formattedString = [searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSDictionary *paramDictionary = @{@"api_key": [Utility getAPIKey], @"includes":@"MainImage", @"limit": @kPageSize, @"keywords" : formattedString, @"page" : [NSString stringWithFormat:@"%i", pageNumber]};
    
    [[RestServiceManager sharedClient] GET:@"v2/listings/active" parameters:paramDictionary progress:nil success:^(NSURLSessionDataTask *__unused task, id JSON) {
        NSArray *resultsResponse = [JSON valueForKeyPath:@"results"];
        Results *results = [[Results alloc] initWithArray:resultsResponse];

        if (self.interactor) {
            [self.interactor searchResultsFromServerReturned:results.value];
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
    }];
}

@end
