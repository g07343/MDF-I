//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController
{
    IBOutlet UITableView *tableView;
    BOOL editing;
    NSMutableArray *nameArray;
}

-(IBAction)onClick:(id)sender;

@end
