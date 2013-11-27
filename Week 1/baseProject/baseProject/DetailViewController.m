//
//  DetailViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 11/26/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//returns user to previous view
-(IBAction)onClick:(id)sender
{
    [self dismissModalViewControllerAnimated:true];
}

@end
