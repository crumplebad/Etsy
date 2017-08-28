//
//  Utility.m
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "Utility.h"

@interface Utility ()

@end

@implementation Utility

+ (NSString *)getAPIKey {
    //813nal68fngdw77h8ezeo9tt
    char fixed[] = { '8', '1', '3', 'n', 'a', 'l', '6', '8', 'f', 'n', 'g', 'd', 'w', '7', '7', 'h', '8', 'e', 'z', 'e', 'o', '9', 't', 't', '\0'};
    
    return [NSString stringWithCString:fixed encoding:NSASCIIStringEncoding];
}

+ (void)showErrorMessage:(NSString *)errorMessage onViewController:(UIViewController *)viewController {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:errorMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];
    [alert addAction:defaultAction];
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
