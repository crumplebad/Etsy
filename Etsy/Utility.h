//
//  Utility.h
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSString *)getAPIKey;
+ (void)showErrorMessage:(NSString *)errorMessage onViewController:(UIViewController *)viewController;

@end

