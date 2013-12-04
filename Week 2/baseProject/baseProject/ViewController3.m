//
//  ViewController3.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController3.h"
#import "CustomObject.h"
#import "ViewController.h"
@interface ViewController3 ()

@end

@implementation ViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Cast", @"Third");
        self.tabBarItem.image = [UIImage imageNamed:@"mic"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up imgArray from custom class;
    NSArray *temp = [[CustomObject GetInstance] getpictures];
    imgArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    //set up UIImageViews into array for looping
   // NSArray *imgViews = [[NSArray alloc] initWithObjects:monster1, monster2, monster3, monster4, monster5, nil];
    
    //append retrieved items to local array
    for ( int i = 0; i < temp.count; i++)
    {
        [imgArray addObject:temp[i]];
        NSLog(@"Image added was: %@", temp[i]);
        NSLog(@"%i", [imgArray count]);
    }
    
    //loop through imgArray to set images to objects in imgViews array
    for (int i = 0; i < imgArray.count; i++)
    {
        NSString *pic = [imgArray objectAtIndex:i];
        if (i == 0)
        {
            monster1.image = [UIImage imageNamed:pic];
            
        } else if (i == 1)
        {
            monster2.image = [UIImage imageNamed:pic];
            
        } else if (i == 2)
        {
            monster3.image = [UIImage imageNamed:pic];
            
        } else if (i == 3)
        {
            monster4.image = [UIImage imageNamed:pic];
            
        } else if (i == 4)
        {
            monster5.image = [UIImage imageNamed:pic];
            
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
       if (button.tag == 0)
       {
           NSString *temp = @"hardscrabble";
           [[CustomObject GetInstance] selectedPerson:temp];
           
       } else if (button.tag == 1)
       {
           NSLog(@"Monster is worthington");
           NSString *temp = @"worthington";
           [[CustomObject GetInstance] selectedPerson:temp];
       } else if (button.tag == 2)
       {
           NSLog(@"Monster is randall");
           NSString *temp = @"randall";
           [[CustomObject GetInstance] selectedPerson:temp];
       } else if (button.tag == 3)
       {
           NSLog(@"Monster is mike");
           NSString *temp = @"mike";
           [[CustomObject GetInstance] selectedPerson:temp];
       } else if (button.tag == 4)
       {
           NSLog(@"Monster is sulley");
           NSString *temp = @"sulley";
           [[CustomObject GetInstance] selectedPerson:temp];
       }
        ViewController *actorView =[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        if (actorView != nil)
        {
            [self presentModalViewController:actorView animated:true];
        }
    }
}


@end
