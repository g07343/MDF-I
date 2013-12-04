//
//  ViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 12/3/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "CustomObject.h"
@interface ViewController ()

@end

@implementation ViewController

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
    NSString *image = [[CustomObject GetInstance] returnPicture];
    nameLabel.text = [[CustomObject GetInstance] getName];
    actorImage.image = [UIImage imageNamed:image];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    [self dismissModalViewControllerAnimated:true];
}

@end
