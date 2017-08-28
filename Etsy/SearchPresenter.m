//
//  SearchPresenter.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchPresenter.h"
#import "SearchWireFrame.h"

@implementation SearchPresenter


- (void)getSearchResultsListFor:(NSString *)searchString pageNumber:(int)pageNumber {
    [self.interactor getSearchResultsFor:searchString pageNumber:pageNumber];
}

- (void)searchResultsReturned:(NSArray *)searchResults withErrorMessage:(NSString *)errorMessage {
    [self.view searchResultsListReturned:searchResults withErrorMessage:errorMessage];
}

@end
