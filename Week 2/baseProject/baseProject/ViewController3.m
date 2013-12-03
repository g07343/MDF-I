//
//  ViewController3.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController3.h"
#import "CustomObject.h"
@interface ViewController3 ()

@end

@implementation ViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Third", @"Third");
        self.tabBarItem.image = [UIImage imageNamed:@"First"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //call private methods by calling static instance of class and retrieve stored data
    string1 = [[CustomObject GetInstance] getString1];
    string2 = [[CustomObject GetInstance] getString2];
    string3 = [[CustomObject GetInstance] getString3];
    NSLog(@"String1 is: %@", string1);
    NSLog(@"String2 is: %@", string2);
    NSLog(@"String3 is: %@", string3);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
