//
//  ViewController2.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController2.h"
#import "SelectedCell.h"
#import "AlternateView.h"
#import "CustomTableCell.h"

@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Characters", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"charIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up array to hold objects for number or cells/title
    detailArray = [[NSMutableArray alloc]initWithObjects:@"Mike", @"Sulley", @"Randall", @"Dean Hardscrabble", @"Johnny J. Worthington", @"Other Characters", nil];
    //set up picture array to pull thumbnails from
    picArray = [[NSMutableArray alloc]initWithObjects:@"mike.png", @"sulley.png", @"randall.png", @"hardscrabble.png", @"worthington.png", @"mike.png", nil];
    
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.rowHeight = 200;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [detailArray count];
}
//create reuseable cells for tableView
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomTableCell class]])
            {
                cell = (CustomTableCell*)view;
            }
        }
    }
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(210.0f, 60.0f, 75.0f, 75.0f)];
    NSString *tempImage = [picArray objectAtIndex:indexPath.row];
    image.image = [UIImage imageNamed:tempImage];
    [cell addSubview:image];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 110.0f, 200.0f, 20.0f)];
    name.textAlignment = NSTextAlignmentCenter;
    name.backgroundColor = [UIColor clearColor];
    name.text = (NSString*)[detailArray objectAtIndex:indexPath.row];
    [cell addSubview:name];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

//default method provided by the delegate for handling cell selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //capture which is selected as a string
    NSString *temp = [detailArray objectAtIndex:indexPath.row];
    //open alternate detail view to show library descriptions of other monsters
    if ([temp  isEqual: @"Other Characters"])
    {
        AlternateView *alternateView = [[AlternateView alloc]initWithNibName:@"AlternateView" bundle:nil];
        if (alternateView != nil)
        {
            [self presentModalViewController:alternateView animated:true];
        }
    } else {
        //open detail view
        SelectedCell *selectedCell = [[SelectedCell alloc]initWithNibName:@"SelectedCell" bundle:nil];
        if (selectedCell != nil)
        {   //this passes which monster is passed to the detailViewController
            [selectedCell setTitleString:temp];
            [self presentModalViewController:selectedCell animated:TRUE];
        }
    }
}

@end
