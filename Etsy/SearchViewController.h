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

@interface SearchViewController : UIViewController <SearchViewProtocol>

@property (nonatomic, strong) id <SearchPresenterProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> presenter;

- (void)refreshTable;
- (void)animateIndicator:(BOOL)isStart;

@end
