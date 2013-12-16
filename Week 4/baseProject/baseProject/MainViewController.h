//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    IBOutlet UITableView *tableView;
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *requestData;
}
@end
