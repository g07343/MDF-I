//
//  DetailViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 12/15/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "DetailViewController.h"
#import "NewsObject.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{   //get the name of the selected story from the NewsObject custom class
    name = [[NewsObject GetInstance] returnSelected];
    
    //get the url of the selected story from the NewsObject custom class
    url = [[NewsObject GetInstance] returnUrl];
    
    //set the titleLabel and textView text to the retrieved strings
    titleLabel.text = name;
    textView.text = url;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webOpen = false;
    // Do any additional setup after loading the view from its nib.
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
    {   //go back to the previous view
        [self dismissViewControllerAnimated:true completion:nil];
    } else if (button.tag == 1)
    {   //open a webview using the already retrieved url, or close if the webView is already open
        if (webOpen == false)
        {
            webOpen = true;
            [sender setTitle:@"Close" forState:UIControlStateNormal];
            webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 475.0f)];
            webView.scalesPageToFit = YES;
            webView.tag = 50;
            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
            [self.view addSubview:webView];
        } else if (webOpen == true)
        {
            [[self.view viewWithTag:50] removeFromSuperview];
            [sender setTitle:@"Show Story?" forState:UIControlStateNormal];
            webOpen = false;
        }
        
    }
}

@end
