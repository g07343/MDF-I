//
//  SelectedCell.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "SelectedCell.h"

@interface SelectedCell ()

@end

@implementation SelectedCell

@synthesize titleString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    titleLabel.text = titleString;
    
    if ([titleString  isEqual: @"Sulley"])
    {
        titleLabel.text = titleString;
        charImage.image = [UIImage imageNamed:@"sulley.png"];
        charBio.text = @"Sully comes from a long line of prestigious monsters and because of this, he has a bit of an ego.  By the end of the film, Sullivan learns who his true friends are, and what it means to be a real scarer.";
    } else if ([titleString  isEqual: @"Mike"])
    {
        titleLabel.text = titleString;
        charImage.image = [UIImage imageNamed:@"mike.png"];
        charBio.text = @"Mike is quite possibly the least physically scary looking monster in the scaring program.  Despite this, he becomes the heart and soul of the Oozma Kappa fraternity, and teaches the entire school a very important lesson:  there is more to being a great scarer than looks and appearances.";
    } else if ([titleString  isEqual: @"Randall"])
    {
        titleLabel.text = titleString;
        charImage.image = [UIImage imageNamed:@"randall.png"];
        charBio.text = @"Randall is a fellow scare program student and Mike's roomate.  After joining the fraternity Omega Roar, he developes a deep-seated hatred towards Sulley and Mike.";
    } else if ([titleString  isEqual: @"Dean Hardscrabble"])
    {
        titleLabel.text = titleString;
        charImage.image = [UIImage imageNamed:@"hardscrabble.png"];
        charBio.text = @"Dean Hardscrabble is considered a legendary scarer, and is the Dean of the scaring program at Monster University.  She claims to know what scary is and what it looks like, and as such, believes she knows what makes a good scarer.";
    } else if ([titleString  isEqual: @"Johnny J. Worthington"])
    {
        titleLabel.text = titleString;
        charImage.image = [UIImage imageNamed:@"worthington.png"];
        charBio.text = @"Johnny Worthington III is the head of the Omega Roar fraternity and like Sulley, has an enormous ego.  His fraternity is considered the best on campus, but by the end, Johnny and his fellow Roar members learn the hard way to never underestimate others based on their appearances.";
    }
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
    [self dismissModalViewControllerAnimated:true];
}

@end
