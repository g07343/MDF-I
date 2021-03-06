//
//  SelectedCell.h
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
@interface SelectedCell : UIViewController <DetailDelegate>
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UIImageView *charImage;
    IBOutlet UITextView *charBio;
}

-(IBAction)onClick:(id)sender;

@property NSString *titleString;

@end
