//
//  ViewController2.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController2.h"
#import "SelectedCell.h"
@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"Second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up array to hold objects for number or cells/title
    detailArray = [[NSMutableArray alloc]initWithObjects:@"detail1", @"detail2", @"detail3", @"detail4", @"detail5", nil];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = (NSString*)[detailArray objectAtIndex:indexPath.row];
    
    return cell;
}

//default method provided by the delegate for handling cell selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //capture which is selected as a string
    NSString *temp = [detailArray objectAtIndex:indexPath.row];
    
    //open detail view
    SelectedCell *selectedCell = [[SelectedCell alloc]initWithNibName:@"SelectedCell" bundle:nil];
    if (selectedCell != nil)
    {   //this passes which manufacturer is passed to the detailViewController
        [selectedCell setTitleString:temp];
        [self presentModalViewController:selectedCell animated:TRUE];
    }
}

@end
