//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"
#import "NewsObject.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Breaking News", @"Breaking News");
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
}

-(void)viewWillAppear:(BOOL)animateds
{
    titleArray = [[NSMutableArray alloc] init];
    titleArray = [[NewsObject GetInstance] returnNames];
    NSLog(@"Count of titleArray is: %i", [titleArray count]);
    tableView.rowHeight = 150.0f;
}



//set number of rows for tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArray count];
}

//init cells for tableView
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomCell class]])
            {
                cell = (CustomCell*)view;
            }
        }
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 2;
    [cell setFont:[UIFont systemFontOfSize:16]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedString = [titleArray objectAtIndex:indexPath.row];
    NSLog(@"You selected: %@", selectedString);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
