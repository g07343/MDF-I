//
//  DetailViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/26/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController <MainViewDelegate>
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *carLabel;
    IBOutlet UILabel *urlLabel;
    IBOutlet UIImageView *logo;
    //dynamic string variables to be overriden when user chooses something
    NSString *titleString;
    NSString *dateString;
    NSString *carString;
    NSString *urlString;
    NSString *imgSrc;
    
}
@property NSString *titleString;


-(IBAction)onClick:(id)sender;

@end
