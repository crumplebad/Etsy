//
//  ResultTableViewCell.h
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "Result.h"

@interface ResultTableViewCell : UITableViewCell

- (void)setCellWith:(Result *)result;

@end
