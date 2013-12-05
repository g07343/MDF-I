//
//  CreatedMonster.h
//  baseProject
//
//  Created by Matthew Lewis on 12/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatedMonster : UIViewController
{
    IBOutlet UIImageView *savedImage;
    IBOutlet UILabel *savedName;
    IBOutlet UILabel *savedDate;
}

-(IBAction)onClick:(id)sender;

@end
