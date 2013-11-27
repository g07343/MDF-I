//
//  DetailViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 11/26/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *carLabel;
    IBOutlet UILabel *urlLabel;
    IBOutlet UIImageView *logo;
}

-(IBAction)onClick:(id)sender;

@end
