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
    //retrieve image source from custom class and set to local string
    NSString *image = [[CustomObject GetInstance] returnPicture];
    
    //retrieve name string from custom class and set to label
    nameLabel.text = [[CustomObject GetInstance] getName];
    
    //set imageView using captured string above
    actorImage.image = [UIImage imageNamed:image];
    
    //retrieve information for textView from custom class
    infoField.text = [[CustomObject GetInstance] getFilms];
    
    //override textColor of the textView to stand out from background
    infoField.textColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{   //close view when 'close' button is clicked
    [self dismissModalViewControllerAnimated:true];
}

@end
