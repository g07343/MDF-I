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
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Breaking News", @"Breaking News");
    self.tabBarItem.image = [UIImage imageNamed:@"newsIcon"];
}

-(void)viewWillAppear:(BOOL)animateds
{
    titleArray = [[NSMutableArray alloc] init];
    titleArray = [[NewsObject GetInstance] returnNames];
    NSLog(@"Count of titleArray is: %i", [titleArray count]);
    tableView.rowHeight = 100.0f;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedString = [titleArray objectAtIndex:indexPath.row];
    NSLog(@"You selected: %@", selectedString);
    [[NewsObject GetInstance] setStory:indexPath.row];
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    [self presentViewController:detailView animated:true completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
