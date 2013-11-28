//
//  CustomCell.h
//  baseProject
//
//  Created by Matthew Lewis on 11/26/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *makerLabel;
    IBOutlet UILabel *originLabel;
}

@property UILabel *originLabel;

@end
