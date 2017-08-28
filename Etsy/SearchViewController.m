//
//  SearchViewController.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchViewController.h"
#import "Utility.h"

@implementation SearchViewController {
    __weak IBOutlet UISearchBar *productSearchBar;
    __weak IBOutlet UITableView *resultTableView;
    UIActivityIndicatorView *bottomActivityIndicator;
}

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [resultTableView registerNib:[UINib nibWithNibName:@"ResultTableViewCell" bundle:nil] forCellReuseIdentifier:@"ResultTableViewCell"];
    resultTableView.delegate = self.presenter;
    resultTableView.dataSource = self.presenter;
    productSearchBar.delegate = self.presenter;
    [self configureBottomRefreshControl];
    [self addTapToDismissKeyboard];
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

- (void)addTapToDismissKeyboard {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)searchResultsListReturned:(NSArray *)searchResults withErrorMessage:(NSString *)errorMessage {
    [bottomActivityIndicator stopAnimating];
   
    if (!errorMessage) {
        if ([searchResults count] > 0) {
            [resultTableView reloadData];
        }
    } else {
        [Utility showErrorMessage:errorMessage onViewController:self];
    }
}

- (void)dismissKeyboard {
    [productSearchBar resignFirstResponder];
}

- (void)refreshTable {
    [resultTableView reloadData];
}

- (void)animateIndicator:(BOOL)isStart {
    if (isStart) {
        [bottomActivityIndicator startAnimating];
    } else {
        [bottomActivityIndicator stopAnimating];
    }
}

@end
