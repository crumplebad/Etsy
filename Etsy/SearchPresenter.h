//
//  SearchPresenter.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"

@class SearchWireFrame;

@interface SearchPresenter : NSObject <SearchPresenterProtocol, SearchInteractorOutputProtocol>

@property (nonatomic, weak) id <SearchViewProtocol> view;
@property (nonatomic, strong) id <SearchInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <SearchWireFrameProtocol> wireFrame;

@end
