//
//  MoreInfo1.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "MoreInfo1.h"
#import "MoreInfo2.h"
@interface MoreInfo1 ()

@end

@implementation MoreInfo1

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

-(IBAction)onClick:(id)sender
{
    MoreInfo2 *moreInfo2 = [[MoreInfo2 alloc]initWithNibName:@"MoreInfo2" bundle:nil];
    if (moreInfo2 != nil)
    {
        [self.navigationController pushViewController:moreInfo2 animated:true];
    }
}

@end
