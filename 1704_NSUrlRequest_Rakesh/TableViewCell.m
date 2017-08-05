//
//  TableViewCell.m
//  1704_NSUrlRequest_Rakesh
//
//  Created by student on 8/2/17.
//  Copyright © 2017 Rakesh. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.appIcon.layer.cornerRadius=16;
    self.appIcon.clipsToBounds=YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
