//
//  DetailViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 11/26/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "Delegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize titleString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        ViewController *mainView = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        if (mainView != nil)
        {
            mainView.delegate = self;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@", titleString);
    if ([titleString  isEqual: @"Audi"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1909";
        carLabel.text = @"A3";
        urlLabel.text = @"http://audi.com";
        logo.image = [UIImage imageNamed:@"audi.jpg"];
    } else if ([titleString  isEqual: @"BMW"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1916";
        carLabel.text = @"335i";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"bmw.jpg"];
    } else if ([titleString  isEqual: @"Cadillac"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1902";
        carLabel.text = @"CTS";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"cadillac.jpg"];
    } else if ([titleString  isEqual: @"Chevrolet"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1911";
        carLabel.text = @"Cruze";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"chevrolet.jpg"];
    } else if ([titleString  isEqual: @"Chrysler"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1925";
        carLabel.text = @"200";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"chrysler.jpg"];
    } else if ([titleString  isEqual: @"Dodge"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1914";
        carLabel.text = @"Durango";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"dodge.jpg"];
    } else if ([titleString  isEqual: @"Ford"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1903";
        carLabel.text = @"Focus";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"ford.jpg"];
    } else if ([titleString  isEqual: @"Honda"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1948";
        carLabel.text = @"Civic";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"honda.jpg"];
    } else if ([titleString  isEqual: @"Hyundai"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1967";
        carLabel.text = @"Elantra";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"hyundai.jpg"];
    } else if ([titleString  isEqual: @"Infiniti"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1989";
        carLabel.text = @"Q50";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"infiniti.jpg"];
    } else if ([titleString  isEqual: @"Kia"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1944";
        carLabel.text = @"Optima";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"kia.jpg"];
    } else if ([titleString  isEqual: @"Lexus"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1989";
        carLabel.text = @"ES250";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"lexus.jpg"];
    } else if ([titleString  isEqual: @"Mazda"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1920";
        carLabel.text = @"CX-5";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"mazda.jpg"];
    } else if ([titleString  isEqual: @"Mitsubishi"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1870 (parent company)";
        carLabel.text = @"Outlander";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"mitsubishi.jpg"];
    } else if ([titleString  isEqual: @"Nissan"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1933";
        carLabel.text = @"Altima";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"nissan.jpg"];
    } else if ([titleString  isEqual: @"Porsche"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1931";
        carLabel.text = @"Panamera";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"porsche.jpg"];
    } else if ([titleString  isEqual: @"Subaru"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1954";
        carLabel.text = @"Forester";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"subaru.jpg"];
    } else if ([titleString  isEqual: @"Toyota"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1937";
        carLabel.text = @"Camry";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"toyota.jpg"];
    } else if ([titleString  isEqual: @"Volvo"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1927";
        carLabel.text = @"XC90";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"volvo.jpg"];
    } else if ([titleString  isEqual: @"VW"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1937";
        carLabel.text = @"Jetta";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"vw.jpg"];
    }
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

//delegate function that basically just identifies which choice the user made
-(void)DidSelect:(NSString*)nameString
{
    //begin gratuitous list of if else statements.  Yaayy!
    if ([nameString  isEqual: @"Audi"])
    {
        titleString = @"Audi";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";
        
    } else if ([nameString  isEqual: @"BMW"])
    {
        titleString = @"BMW";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Cadillac"])
    {
        titleString = @"Cadillac";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Chevrolet"])
    {
        titleString = @"Chevrolet";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Chrysler"])
    {
        titleString = @"Chrysler";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Dodge"])
    {
        titleString = @"Dodge";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Ford"])
    {
        titleString = @"Ford";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Honda"])
    {
        titleString = @"Honda";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Hyundai"])
    {
        titleString = @"Hyundai";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Infiniti"])
    {
        titleString = @"Infiniti";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Kia"])
    {
        titleString = @"Kia";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Lexus"])
    {
        titleString = @"Lexus";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Mazda"])
    {
        titleString = @"Mazda";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Mitsubishi"])
    {
        titleString = @"Mitsubishi";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Nissan"])
    {
        titleString = @"Nissan";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Porsche"])
    {
        titleString = @"Porsche";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Subaru"])
    {
        titleString = @"Subaru";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Toyota"])
    {
        titleString = @"Toyota";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"Volvo"])
    {
        titleString = @"Volvo";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else if ([nameString  isEqual: @"VW"])
    {
        titleString = @"VW";
        dateString = @"1972";
        carString = @"A5";
        urlString = @"http://Audi.com";
        imgSrc = @"audi.jpg";

    } else{
    
    }
}

@end
