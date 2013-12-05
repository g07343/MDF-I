//
//  ViewController4.h
//  baseProject
//
//  Created by Matthew Lewis on 12/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController4 : UIViewController
{
    IBOutlet UITextField *nameField;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIButton *closeKeyboard;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *viewButton;
    //set up variables needed for collection purposes
    BOOL pictureChosen;
    NSString *nameString;
    NSString *dateString;
    NSString *chosenMonster;
}

-(IBAction)onClick:(id)sender;

-(IBAction)onChange:(id)sender;

@end
