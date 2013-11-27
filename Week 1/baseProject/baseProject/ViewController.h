//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewDelegate <NSObject>

-(void)DidSelect:(NSString*)nameString;

@end

@interface ViewController : UIViewController <UITableViewDelegate>
{
    NSMutableArray *nameArray;
    NSArray *originArray;
    NSMutableArray *picArray;
    BOOL editing;
    IBOutlet UITableView *tableView;
    IBOutlet UIButton *editButton;
}

-(IBAction)onClick:(id)sender;

@property (strong) id<MainViewDelegate> delegate;

@end


