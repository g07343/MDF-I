//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set BOOL for editing to "false"
    editing = false;
    
	// set up array to hold names of manufacturers
    nameArray = [[NSMutableArray alloc]initWithObjects:@"Audi", @"BMW", @"Cadillac", @"Chevrolet", @"Chrysler", @"Dodge", @"Ford", @"Honda", @"Hyundai", @"Infiniti", @"Kia", @"Lexus", @"Mazda", @"Mitsubishi", @"Nissan", @"Porsche", @"Subaru", @"Toyota", @"Volvo", @"VW", nil];
    
    //array to hold all of the maker's logos
    picArray = [[NSMutableArray alloc]initWithObjects:@"audi.png", @"bmw.png", @"cadillac.png", @"chevrolet.png", @"chrysler.png", @"dodge.png", @"ford.png", @"honda.png", @"hyundai.png", @"infiniti.png", @"kia.png", @"lexus.png", @"mazda.png", @"mitsubishi.png", @"nissan.png", @"porsche.png", @"subaru.png", @"toyota.png", @"volvo.png", @"vw.png", nil];
    
    //array to hold the various countries of the manufacturers
    originArray = [[NSMutableArray alloc]initWithObjects:@"Germany", @"Germany", @"United States", @"United States", @"United States", @"United States", @"United States", @"Japan", @"South Korea", @"Japan", @"South Korea", @"Japan", @"Japan", @"Japan", @"Japan", @"Germany", @"Japan", @"Japan", @"Sweden", @"Germany", nil];
    
    //set background of tableView to invisible to let custom bg show through
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    //manually set the rowHeight to make elements more tappable and easier to see
    tableView.rowHeight = 125;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{   //check bool value to determine if editing is currently taking place
    if (editing == false)
    {
        editing = true;
        //override default button text to guide user
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [tableView setEditing:true];
    } else {
        editing = false;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [tableView setEditing:false];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomCell class]])
            {
                cell = (CustomCell*)view;
            }
        }
    }
    //create string to be contantly overwritten and read from (holds image src)
    NSString *temp = (NSString*)[picArray objectAtIndex:indexPath.row];
    //set text from nameArray
    cell.textLabel.text = (NSString*)[nameArray objectAtIndex:indexPath.row];
    //center text
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    NSString *origin = (NSString*)[originArray objectAtIndex:indexPath.row];
    cell.originLabel.text = [[NSString alloc] initWithFormat:@"Country of origin: %@", origin];
    //set text bg color to transparent
    cell.textLabel.backgroundColor = [UIColor clearColor];
    //set the imageView src to the temporary string
    cell.imageView.image = [UIImage imageNamed:temp];
    //clear out default coloring
    cell.contentView.backgroundColor = [UIColor clearColor];
    //use custom background image
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transparent.png"]];
    
    //create a custom 'view' to override the default when the user selects an object
    UIView *backView = [[UIView alloc] initWithFrame:cell.frame];
    backView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"selected.png"]];
    cell.selectedBackgroundView = backView;
    
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
    {   //remove instance of car company from mutable 'name' array
        [nameArray removeObjectAtIndex:indexPath.row];
        //remove instance of the corresponding company logo from mutable picture array
        [picArray removeObjectAtIndex:indexPath.row];
        //remove instance of the corresponding country of origin from the mutable origin array
        [originArray removeObjectAtIndex:indexPath.row];
        //actually remove the object from the tableview displayed to the user
        [tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}
//default method provided by the delegate for handling cell selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //capture which is selected as a string
    NSString *temp = [nameArray objectAtIndex:indexPath.row];
    
    //open detail view
     DetailViewController *detailView = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    if (detailView != nil)
    {   //this passes which manufacturer is passed to the detailViewController
        [detailView setTitleString:temp];
        [self presentModalViewController:detailView animated:TRUE];
    }
}

@end
