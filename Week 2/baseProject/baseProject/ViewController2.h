//
//  ViewController2.h
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailDelegate <NSObject>



@end

@interface ViewController2 : UIViewController
{
    NSMutableArray *detailArray;
    IBOutlet UITableView *tableView;
}

@property (strong, nonatomic) id<DetailDelegate> delegate;

@end
