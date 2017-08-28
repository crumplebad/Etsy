//
//  SearchViewController.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController {
    NSMutableArray *resultsDataSource;

    __weak IBOutlet UISearchBar *productSearchBar;
    __weak IBOutlet UITableView *resultTableView;
    int pageNumberToRequest;
    UIActivityIndicatorView *bottomActivityIndicator;
    BOOL isWaitingForResponse;
    int lastResponseCount;
    NSString *searchString;
}

- (NSMutableArray *)resultsDataSource {
    if (!resultsDataSource) {
        resultsDataSource = [NSMutableArray new];
    }

    return resultsDataSource;
}

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNumberToRequest = 1;
    searchString = @"";
    [resultTableView registerNib:[UINib nibWithNibName:@"ResultTableViewCell" bundle:nil] forCellReuseIdentifier:@"ResultTableViewCell"];
    [self configureBottomRefreshControl];
    [self addTapToDismissKeyboar];
}

#pragma mark - Utility

- (void)configureBottomRefreshControl {
    bottomActivityIndicator = [UIActivityIndicatorView new];
    [bottomActivityIndicator setHidesWhenStopped:YES];
    [bottomActivityIndicator setColor:[UIColor darkGrayColor]];
    CGRect footerRect = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 30);
    UIView *wrapperView = [[UIView alloc] initWithFrame:footerRect];
    wrapperView.backgroundColor = resultTableView.backgroundColor;
    wrapperView.opaque = YES;
    [bottomActivityIndicator setFrame:footerRect];
    [wrapperView addSubview:bottomActivityIndicator];
    resultTableView.tableFooterView = wrapperView;
    [bottomActivityIndicator stopAnimating];
}

- (void)addTapToDismissKeyboar {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)getSearchResultsListForPageNumber:(int)pageNumber {
    [bottomActivityIndicator startAnimating];
    isWaitingForResponse = YES;
    [self.presenter getSearchResultsListFor:searchString pageNumber:pageNumber];
}

- (void)searchResultsListReturned:(NSArray *)searchResults {
    [bottomActivityIndicator stopAnimating];
    isWaitingForResponse = NO;
   
    if ([searchResults count] > 0) {
        [[self resultsDataSource] addObjectsFromArray:searchResults];
        [resultTableView reloadData];
    }
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
        if (!isWaitingForResponse && ![searchString isEqualToString:@""]) {
            pageNumberToRequest += 1;
            [self getSearchResultsListForPageNumber:pageNumberToRequest];
        }
    }
}

#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    pageNumberToRequest = 1;
    [resultsDataSource removeAllObjects];
    [resultTableView reloadData];
    [bottomActivityIndicator startAnimating];
    searchString = productSearchBar.text;
    [self getSearchResultsListForPageNumber:pageNumberToRequest];
}

- (void)dismissKeyboard {
    [productSearchBar resignFirstResponder];
}

@end
