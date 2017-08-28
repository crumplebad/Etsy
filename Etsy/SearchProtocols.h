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
@required
@property (nonatomic, strong) id <SearchPresenterProtocol> presenter;

- (void)searchResultsListReturned:(NSArray *)searchResults withErrorMessage:(NSString *)errorMessage;

@end

@protocol SearchPresenterProtocol
@required
@property (nonatomic, weak) id <SearchViewProtocol> view;
@property (nonatomic, strong) id <SearchInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <SearchWireFrameProtocol> wireFrame;

- (void)getSearchResultsListFor:(NSString *)searchString pageNumber:(int)pageNumber;

@end

@protocol SearchInteractorOutputProtocol

- (void)searchResultsReturned:(NSArray *)searchResults withErrorMessage:(NSString *)errorMessage;;

@end

@protocol SearchInteractorInputProtocol

@required
@property (nonatomic, weak) id <SearchInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <SearchAPIDataManagerInputProtocol> APIDataManager;

- (void)getSearchResultsFor:(NSString *)searchString pageNumber:(int)pageNumber;

@end

@protocol SearchAPIDataManagerOutputProtocol

- (void)searchResultsFromServerReturned:(NSArray *)searchResults;

@end

@protocol SearchAPIDataManagerInputProtocol

@required
@property (nonatomic, weak) id <SearchAPIDataManagerOutputProtocol> interactor;

- (void)getSearchResultsFromServerFor:(NSString *)searchString pageNumber:(int)pageNumber;

@end
