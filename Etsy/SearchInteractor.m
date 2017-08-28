//
//  SearchInteractor.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchInteractor.h"
#import "Constants.h"

@implementation SearchInteractor {
    NSUInteger lastResultSize;
    NSString *lastSearchText;
}

- (instancetype)init {
    if (self = [super init])    {
        lastResultSize = kPageSize;
        lastSearchText = @"";
    }
    
    return self;
}

- (void)getSearchResultsFor:(NSString *)searchString pageNumber:(int)pageNumber {
    if (![lastSearchText isEqualToString:searchString]) {
        lastSearchText = searchString;
        lastResultSize = kPageSize;
    }
    
    if (lastResultSize == kPageSize) {
        [self.APIDataManager getSearchResultsFromServerFor:searchString pageNumber:pageNumber];
    } else {
       [self.presenter searchResultsReturned:[NSArray new] withErrorMessage:nil];
    }
}

- (void)searchResultsFromServerReturned:(NSArray *)searchResults {
    if (searchResults) {
        lastResultSize = [searchResults count];
        [self.presenter searchResultsReturned:searchResults withErrorMessage:nil];
    } else {
        [self.presenter searchResultsReturned:[NSArray new] withErrorMessage:@"Something went wrong.\n Please try again later"];//Fetch the user understandable  error text and pass it here.
    }
}

@end
