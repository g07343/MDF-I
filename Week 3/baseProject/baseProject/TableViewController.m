//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import "BusinessClass.h"
#import "DetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"Locations", @"Second");
    self.tabBarItem.image = [UIImage imageNamed:@"magnify"];
    editing = false;
    
    tableView.rowHeight = 100;
    //set local mutable array to array of location names held in the custom class
    nameArray = [[NSMutableArray alloc] initWithArray:[[BusinessClass GetInstance] returnNameArray]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArray count];
}
//create reuseable cells for tableView
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
            cell.textLabel.text = (NSString*)[nameArray objectAtIndex:indexPath.row];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.imageView.image = [UIImage imageNamed:@"tableView"];
        }
    }
    
    
    
    //turn off the default 'highlighting' effect of ios when cell is selected (UGLY!)
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//handles setting the default 'delete' functionality
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//handles actually commiting the delete functionality
- (void)tableView:(UITableView *)tableView2 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {   //remove instance of location from mutable 'name' array
        [nameArray removeObjectAtIndex:indexPath.row];
        //remove object from BusinessClass mutable array so it is removed from the MapView as well
        [[BusinessClass GetInstance] removeLocation:indexPath.row];
        //actually remove the object from the tableview displayed to the user
        [tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //alert BusinessClass as to which cell is selected by passing its number
    [[BusinessClass GetInstance] selectedLocation:indexPath.row];
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    if (detailView != nil)
    {   //display the detailView page
        [self presentViewController:detailView animated:true completion:nil];
    }
}

-(IBAction)onClick:(id)sender
{   //sets and resets the editing mode, depending on the 'BOOL' named editing
    if (editing == false)
    {
        editing = true;
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [tableView setEditing:true];
    } else
    {
        editing = false;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [tableView setEditing:false];
    }
}

@end
