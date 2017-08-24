//
//  SearchAPIDataManager.h
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"
#import "RestServiceManager.h"
#import "SearchProtocols.h"
#import "Results.h"

@interface SearchAPIDataManager : NSObject <SearchAPIDataManagerInputProtocol>

@property (nonatomic, weak) id <SearchAPIDataManagerOutputProtocol> interactor;

- (void)getSearchResultsFromServerFor:(NSString *)searchString pageNumber:(int)pageNumber;

@end
