//
//  ViewController3.h
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController
{
    NSString *string1;
    NSString *string2;
    NSString *string3;
    IBOutlet UIImageView *monster1;
    IBOutlet UIImageView *monster2;
    IBOutlet UIImageView *monster3;
    IBOutlet UIImageView *monster4;
    IBOutlet UIImageView *monster5;
    NSMutableArray *imgArray;
}

-(IBAction)onClick:(id)sender;

@end
