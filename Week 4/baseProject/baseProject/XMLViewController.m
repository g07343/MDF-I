//
//  XMLViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 12/15/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "XMLViewController.h"
#import "NewsObject.h"
@interface XMLViewController ()

@end

@implementation XMLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"XML", @"XML");
        self.tabBarItem.image = [UIImage imageNamed:@"xmlIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //retrieve the complete xml text from the NewsObject class upon load and set to textView
    xmlString = [[NewsObject GetInstance] returnAll];
    textView.text = xmlString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
