//
//  SearchPresenter.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchPresenter.h"
#import "SearchWireFrame.h"

@implementation SearchPresenter {
    NSMutableArray *resultsDataSource;
    BOOL isWaitingForResponse;
    int pageNumberToRequest;
    NSString *iSearchString;
}

- (instancetype)init {
    if (self = [super init])    {
        pageNumberToRequest = 1;
        iSearchString = @"";
    }
    
    return self;
}

- (NSMutableArray *)resultsDataSource {
    if (!resultsDataSource) {
        resultsDataSource = [NSMutableArray new];
    }
    
    return resultsDataSource;
}

- (void)getSearchResultsListFor:(NSString *)searchString pageNumber:(int)pageNumber {
    isWaitingForResponse = YES;
    [self.view animateIndicator:YES];
    [self.interactor getSearchResultsFor:searchString pageNumber:pageNumber];
}

- (void)searchResultsReturned:(NSArray *)searchResults withErrorMessage:(NSString *)errorMessage {
    isWaitingForResponse = NO;
    
    if (!errorMessage && [searchResults count] > 0) {
        [[self resultsDataSource] addObjectsFromArray:searchResults];
    }
    [self.view searchResultsListReturned:searchResults withErrorMessage:errorMessage];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [resultsDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"ResultTableViewCell";
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ResultTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Result *result = [resultsDataSource objectAtIndex:indexPath.row];
    [cell setCellWith:result];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height;
    
    if (offsetY + 200 > contentHeight - scrollView.frame.size.height) {
        if (!isWaitingForResponse && ![[iSearchString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
            pageNumberToRequest += 1;
            [self getSearchResultsListFor:iSearchString pageNumber:pageNumberToRequest];
        }
    }
}

#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    pageNumberToRequest = 1;
    [resultsDataSource removeAllObjects];
    [self.view refreshTable];
    [self.view animateIndicator:YES];
    iSearchString = searchBar.text;
    [self getSearchResultsListFor:iSearchString pageNumber:pageNumberToRequest];
}

@end
