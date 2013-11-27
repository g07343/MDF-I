//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set BOOL for editing to "false"
    editing = false;
    
	// set up array to hold names of manufacturers
    nameArray = [[NSMutableArray alloc]initWithObjects:@"Audi", @"BMW", @"Cadillac", @"Chevrolet", @"Chrysler", @"Dodge", @"Ford", @"Honda", @"Hyundai", @"Infiniti", @"Kia", @"Lexus", @"Mazda", @"Mitsubishi", @"Nissan", @"Porsche", @"Subaru", @"Toyota", @"Volvo", @"VW", nil];
    
    //array to hold all of the maker's logos
    picArray = [[NSMutableArray alloc]initWithObjects:@"audi.jpg", @"bmw.jpg", @"cadillac.jpg", @"chevrolet.jpg", @"chrysler.jpg", @"dodge.jpg", @"ford.jpg", @"honda.jpg", @"hyundai.jpg", @"infiniti.jpg", @"kia.jpg", @"lexus.jpg", @"mazda.jpg", @"mitsubishi.jpg", @"nissan.jpg", @"porsche.jpg", @"subaru.jpg", @"toyota.jpg", @"volvo.jpg", @"vw.jpg", nil];
    
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.rowHeight = 125;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    if (editing == false)
    {
        editing = true;
        [sender setTitle:@"Back" forState:UIControlStateNormal];
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
        //actually remove the object from the tableview displayed to the user
        [tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
        
    }
    
}

@end
