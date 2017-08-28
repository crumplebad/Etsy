//
//  SearchInteractor.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"

@interface SearchInteractor : NSObject <SearchInteractorInputProtocol, SearchAPIDataManagerOutputProtocol>

@property (nonatomic, weak) id <SearchInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <SearchAPIDataManagerInputProtocol> APIDataManager;

@end
