//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Breaking News", @"Breaking News");
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
    //create url
    url = [[NSURL alloc] initWithString:@"http://api.usatoday.com/open/breaking?expired=true&api_key=95z8paqfq8vg32gud2gs8g5t"];
    //create request
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {   //create actual connection now that we have a url to pass it
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //create mutableData object that holds data retrieved from connection
        requestData = [NSMutableData data];
    }
}

//set number of rows for tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//init cells for tableView
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomCell class]])
            {
                cell = (CustomCell*)view;
            }
        }
    }
    return cell;
}

//default method from delegate to handle the connection
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {   //add data if not nil to our mutableData object
        [requestData appendData:data];
    }
}

//default method from delegate that handles when the connection is done (all data is retrieved)
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        NSLog(@"%@", requestString);
    }
    //create parser for data now that it has been fully retrieved
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:requestData];
    if (parser != nil)
    {
        [parser setDelegate:self];
        [parser parse];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
