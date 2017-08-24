//
//  ResultTableViewCell.m
//  Etsy
//
//  Created by Jay Gaonkar on 8/23/17.
//  Copyright © 2017 iJay. All rights reserved.
//

#import "ResultTableViewCell.h"

@implementation ResultTableViewCell {
    
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UIImageView *resultImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellWith:(Result *)result {
    titleLabel.text = result.resultTitle;
    descriptionLabel.text = result.resultDescription;
    [resultImageView setImageWithURL:[NSURL URLWithString:[result resultImage]]];
}

@end
