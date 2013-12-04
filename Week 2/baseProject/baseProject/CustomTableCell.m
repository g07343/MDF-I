//
//  CustomTableCell.m
//  baseProject
//
//  Created by Matthew Lewis on 12/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
