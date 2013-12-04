//
//  AlternateView.h
//  baseProject
//
//  Created by Matthew Lewis on 12/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlternateView : UIViewController
{
    IBOutlet UITextView *charBio;
    IBOutlet UIImageView *donSelected;
    IBOutlet UIImageView *artSelected;
    IBOutlet UIImageView *squishySelected;
    IBOutlet UIImageView *terrySelected;
}

-(IBAction)onClick:(id)sender;
@end
