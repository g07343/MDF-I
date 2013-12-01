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
    //set webOpen boolean to false initially
    webOpen = false;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{//check titleString and populate dynamic labels accordingly
    if ([titleString  isEqual: @"Audi"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1909";
        carLabel.text = @"A3";
        urlLabel.text = @"http://audi.com";
        logo.image = [UIImage imageNamed:@"audi.png"];
    } else if ([titleString  isEqual: @"BMW"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1916";
        carLabel.text = @"335i";
        urlLabel.text = @"http://bmw.com";
        logo.image = [UIImage imageNamed:@"bmw.png"];
    } else if ([titleString  isEqual: @"Cadillac"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1902";
        carLabel.text = @"CTS";
        urlLabel.text = @"http://cadillac.com";
        logo.image = [UIImage imageNamed:@"cadillac.png"];
    } else if ([titleString  isEqual: @"Chevrolet"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1911";
        carLabel.text = @"Cruze";
        urlLabel.text = @"http://chevrolet.com";
        logo.image = [UIImage imageNamed:@"chevrolet.png"];
    } else if ([titleString  isEqual: @"Chrysler"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1925";
        carLabel.text = @"200";
        urlLabel.text = @"http://chrysler.com";
        logo.image = [UIImage imageNamed:@"chrysler.png"];
    } else if ([titleString  isEqual: @"Dodge"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1914";
        carLabel.text = @"Durango";
        urlLabel.text = @"http://dodge.com";
        logo.image = [UIImage imageNamed:@"dodge.png"];
    } else if ([titleString  isEqual: @"Ford"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1903";
        carLabel.text = @"Focus";
        urlLabel.text = @"http://ford.com";
        logo.image = [UIImage imageNamed:@"ford.png"];
    } else if ([titleString  isEqual: @"Honda"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1948";
        carLabel.text = @"Civic";
        urlLabel.text = @"http://honda.com";
        logo.image = [UIImage imageNamed:@"honda.png"];
    } else if ([titleString  isEqual: @"Hyundai"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1967";
        carLabel.text = @"Elantra";
        urlLabel.text = @"http://hyundaiusa.com";
        logo.image = [UIImage imageNamed:@"hyundai.png"];
    } else if ([titleString  isEqual: @"Infiniti"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1989";
        carLabel.text = @"Q50";
        urlLabel.text = @"http://infiniti.com";
        logo.image = [UIImage imageNamed:@"infiniti.png"];
    } else if ([titleString  isEqual: @"Kia"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1944";
        carLabel.text = @"Optima";
        urlLabel.text = @"http://kia.com";
        logo.image = [UIImage imageNamed:@"kia.png"];
    } else if ([titleString  isEqual: @"Lexus"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1989";
        carLabel.text = @"ES250";
        urlLabel.text = @"http://lexus.com";
        logo.image = [UIImage imageNamed:@"lexus.png"];
    } else if ([titleString  isEqual: @"Mazda"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1920";
        carLabel.text = @"CX-5";
        urlLabel.text = @"http://mazdausa.com";
        logo.image = [UIImage imageNamed:@"mazda.png"];
    } else if ([titleString  isEqual: @"Mitsubishi"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1870 (parent company)";
        carLabel.text = @"Outlander";
        urlLabel.text = @"http://mitsubishicars.com";
        logo.image = [UIImage imageNamed:@"mitsubishi.png"];
    } else if ([titleString  isEqual: @"Nissan"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1933";
        carLabel.text = @"Altima";
        urlLabel.text = @"http://nissanusa.com";
        logo.image = [UIImage imageNamed:@"nissan.png"];
    } else if ([titleString  isEqual: @"Porsche"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1931";
        carLabel.text = @"Panamera";
        urlLabel.text = @"http://porsche.com";
        logo.image = [UIImage imageNamed:@"porsche.png"];
    } else if ([titleString  isEqual: @"Subaru"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1954";
        carLabel.text = @"Forester";
        urlLabel.text = @"http://subaru.com";
        logo.image = [UIImage imageNamed:@"subaru.png"];
    } else if ([titleString  isEqual: @"Toyota"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1937";
        carLabel.text = @"Camry";
        urlLabel.text = @"http://toyota.com";
        logo.image = [UIImage imageNamed:@"toyota.png"];
    } else if ([titleString  isEqual: @"Volvo"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1927";
        carLabel.text = @"XC90";
        urlLabel.text = @"http://volvocars.com";
        logo.image = [UIImage imageNamed:@"volvo.png"];
    } else if ([titleString  isEqual: @"VW"])
    {
        nameLabel.text = titleString;
        dateLabel.text = @"1937";
        carLabel.text = @"Jetta";
        urlLabel.text = @"http://vw.com";
        logo.image = [UIImage imageNamed:@"vw.png"];
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
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag == 0)
        {
            [self dismissModalViewControllerAnimated:true];
        } else if (button.tag == 1)
        {
            webView = [[UIWebView alloc] init];
            if (webView != nil)
            {   //create webView frame
                [webView setFrame:CGRectMake(0, 20.0f, 320.0f, 420.0f)];
                //load website from the urlLabel's string
                [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlLabel.text]]];
                //set initial scale of loaded webpage to fit screen
                webView.scalesPageToFit = YES;
                //give the webView a tag that can be referenced later to close it
                webView.tag = 12;
            }
            //check webOpen bool to 'toggle' opening and closing the webView
            if (webOpen == false)
            {
                webOpen = true;
                [sender setTitle:@"Close" forState:UIControlStateNormal];
                [[self view] addSubview:webView];
            } else if (webOpen == true)
            {   //reference webView's tag in order to close it
                [[self.view viewWithTag:12] removeFromSuperview];
                webOpen = false;
                [sender setTitle:@"Open?" forState:UIControlStateNormal];
            }
            
        }
    }
}

//delegate function that basically just identifies which choice the user made
-(void)DidSelect:(NSString*)nameString
{
    
}

@end
