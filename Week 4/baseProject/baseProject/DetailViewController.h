//
//  DetailViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 12/15/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSString *name;
    NSString *url;
    UIWebView *webView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextView *textView;
    bool webOpen;
}

-(IBAction)onClick:(id)sender;
@end
