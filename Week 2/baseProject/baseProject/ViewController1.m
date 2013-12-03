//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController1.h"
#import "MoreInfo1.h"
#import "MoreInfo2.h"
@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"First"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    {//push first view
        MoreInfo1 *moreInfo1 = [[MoreInfo1 alloc]initWithNibName:@"MoreInfo1" bundle:nil];
        if (moreInfo1 != nil)
        {
            [self.navigationController pushViewController:moreInfo1 animated:true];
        }
    } else if (button.tag == 1)
    {
        MoreInfo2 *moreInfo2 = [[MoreInfo2 alloc]initWithNibName:@"MoreInfo2" bundle:nil];
        if (moreInfo2 != nil)
        {
            [self.navigationController pushViewController:moreInfo2 animated:true];
        }
    }
    
}

@end
