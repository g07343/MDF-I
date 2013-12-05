//
//  CreatedMonster.m
//  baseProject
//
//  Created by Matthew Lewis on 12/5/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "CreatedMonster.h"
#import "CustomObject.h"
@interface CreatedMonster ()

@end

@implementation CreatedMonster

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //set name text from saved defaults using custom class
    savedName.text = [[CustomObject GetInstance]savedName];
    
    //set image from saved defaults using custom class
    NSString *picture = [[CustomObject GetInstance]savedPic];
    savedImage.image = [UIImage imageNamed:picture];
    
    //set date string from saved defaults using custom class
    savedDate.text = [[CustomObject GetInstance]savedDate];
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

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

@end
