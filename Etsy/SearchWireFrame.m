//
//  SearchWireFrame.m
//  Etsy
//
//  Created by Jay Gaonkar on 08/23/2017.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "SearchWireFrame.h"

@implementation SearchWireFrame

+ (UIViewController<SearchViewProtocol> *)getSearchModuleView {
    // Generating module components
    SearchViewController <SearchViewProtocol> *view = [[SearchViewController alloc] init];
    id <SearchPresenterProtocol, SearchInteractorOutputProtocol> presenter = [SearchPresenter new];
    id <SearchInteractorInputProtocol, SearchAPIDataManagerOutputProtocol> interactor = [SearchInteractor new];
    id <SearchAPIDataManagerInputProtocol> APIDataManager = [SearchAPIDataManager new];
    id <SearchWireFrameProtocol> wireFrame = [SearchWireFrame new];

    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    APIDataManager.interactor = interactor;
    //TODO: ViewController presentation
    
    return view;
}

@end
