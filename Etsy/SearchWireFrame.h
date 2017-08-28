//
//  SearchWireFrame.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SearchProtocols.h"
#import "SearchViewController.h"
#import "SearchAPIDataManager.h"
#import "SearchInteractor.h"
#import "SearchPresenter.h"
#import "SearchWireFrame.h"

@interface SearchWireFrame : NSObject <SearchWireFrameProtocol>

+ (UIViewController<SearchViewProtocol> *)getSearchModuleView;

@end
