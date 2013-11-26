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
	// set up array to hold names of manufacturers
    nameArray = [[NSArray alloc]initWithObjects:@"Audi", @"BMW", @"Cadillac", @"Chevrolet", @"Chrysler", @"Dodge", @"Ford", @"Honda", @"Hyundai", @"Infiniti", @"Kia", @"Lexus", @"Mazda", @"Mitsubishi", @"Nissan", @"Porsche", @"Subaru", @"Toyota", @"Volvo", @"VW", nil];
    
    //array to hold all of the maker's logos
    picArray = [[NSArray alloc]initWithObjects:@"audi.jpg", @"bmw.jpg", @"cadillac.jpg", @"chevrolet.jpg", @"chrysler.jpg", @"dodge.jpg", @"ford.jpg", @"honda.jpg", @"hyundai.jpg", @"infiniti.jpg", @"kia.jpg", @"lexus.jpg", @"mazda.jpg", @"mitsubishi.jpg", @"nissan.jpg", @"porsche.jpg", @"subaru.jpg", @"toyota.jpg", @"volvo.jpg", @"vw.jpg", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
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
    
    NSString *temp = (NSString*)[picArray objectAtIndex:indexPath.row];
    cell.textLabel.text = (NSString*)[nameArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.imageView.image = [UIImage imageNamed:temp];
    return cell;
}

@end
