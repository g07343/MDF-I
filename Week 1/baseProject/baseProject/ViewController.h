//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSArray *nameArray;
    NSArray *originArray;
     NSArray *picArray;
    IBOutlet UITableView *tableView;
}

-(IBAction)onClick:(id)sender;

@end
