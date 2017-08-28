//
//  SearchProtocols.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SearchInteractorOutputProtocol;
@protocol SearchInteractorInputProtocol;
@protocol SearchViewProtocol;
@protocol SearchPresenterProtocol;
@protocol SearchAPIDataManagerInputProtocol;

@class SearchWireFrame;


@protocol SearchWireFrameProtocol
@required
+ (UIViewController<SearchViewProtocol> *)getSearchModuleView;

@end

@protocol SearchViewProtocol
- (void)searchResultsListReturned:(NSArray *)searchResults;
@required
@property (nonatomic, strong) id <SearchPresenterProtocol> presenter;

@end

@protocol SearchPresenterProtocol
- (void)getSearchResultsListFor:(NSString *)searchString pageNumber:(int)pageNumber;
@required
@property (nonatomic, weak) id <SearchViewProtocol> view;
@property (nonatomic, strong) id <SearchInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <SearchWireFrameProtocol> wireFrame;

@end

@protocol SearchInteractorOutputProtocol
- (void)searchResultsReturned:(NSArray *)searchResults;

@end

@protocol SearchInteractorInputProtocol
- (void)getSearchResultsFor:(NSString *)searchString pageNumber:(int)pageNumber;
@required
@property (nonatomic, weak) id <SearchInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <SearchAPIDataManagerInputProtocol> APIDataManager;

@end

@protocol SearchAPIDataManagerOutputProtocol
- (void)searchResultsFromServerReturned:(NSArray *)searchResults;

@end

@protocol SearchAPIDataManagerInputProtocol
- (void)getSearchResultsFromServerFor:(NSString *)searchString pageNumber:(int)pageNumber;
@required
@property (nonatomic, weak) id <SearchAPIDataManagerOutputProtocol> interactor;

@end
