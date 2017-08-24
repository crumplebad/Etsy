//
//  SearchViewController.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchProtocols.h"
#import "ResultTableViewCell.h"

@interface SearchViewController : UIViewController <SearchViewProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) id <SearchPresenterProtocol> presenter;

- (void)getSearchResultsListForPageNumber:(int)pageNumber;

@end
