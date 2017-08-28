//
//  SearchPresenter.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"
#import "SearchViewController.h"

@class SearchWireFrame;

@interface SearchPresenter : NSObject <SearchPresenterProtocol, SearchInteractorOutputProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) SearchViewController <SearchViewProtocol> *view;
@property (nonatomic, strong) id <SearchInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <SearchWireFrameProtocol> wireFrame;

@end
