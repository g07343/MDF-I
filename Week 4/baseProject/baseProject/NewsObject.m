//
//  NewsObject.m
//  baseProject
//
//  Created by Matthew Lewis on 12/15/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "NewsObject.h"

@implementation NewsObject

static NewsObject *_instance = nil;

+(NewsObject*)GetInstance
{
    if (_instance == nil)
    {
        _instance = [[self alloc] init];
    }
    return _instance;
}

+(id)alloc
{
    _instance = [super alloc];
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        nameArray = [[NSMutableArray alloc] init];
    }
    return self;
}

//this function starts the process of retrieving articles
-(void)getArticles
{
    NSLog(@"getArticles runs");
    //create url
    url = [[NSURL alloc] initWithString:@"http://api.usatoday.com/open/breaking?expired=true&api_key=95z8paqfq8vg32gud2gs8g5t"];
    //create request
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {   NSLog(@"request not nil");
        //create actual connection now that we have a url to pass it
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //create mutableData object that holds data retrieved from connection
        requestData = [NSMutableData data];
    }

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
        //get path to documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        if (documentsDirectory != nil)
        {
            fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"index.xml"];
            if (fullPath != nil)
            {
                [requestData writeToFile:fullPath atomically:true];
            }
        }
        //NSLog(@"%@", requestString);
    }
    xmlData = [self GetFileDataFromFile:fullPath];
    if (xmlData != nil)
    {
        NSString *requestString = [[NSString alloc] initWithData:xmlData encoding:NSASCIIStringEncoding];
        if (requestString != nil)
        {
            //NSLog(@"%@", requestString);
            xmlString = requestString;
        }
        //create parser for data now that it has been fully retrieved
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
        if (parser != nil)
        {
            [parser setDelegate:self];
            [parser parse];
        }
    } else {
        NSLog(@"File not found!");
    }
    
}

//now that the retrieved data is saved, retrieve for parsing
-(NSData*)GetFileDataFromFile:(NSString*)filename
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:fullPath])
    {
        //return data from file
        return [NSData dataWithContentsOfFile:fullPath];
    }
    return nil;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    //NSLog(@"Element Name is: %@", elementName);
    
    if ([elementName isEqualToString:@"title"])
    {
        isTitle = true;
    } else {
        isTitle = false;
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *tempString = string;
    if (isTitle == true)
    {   //get rid of extra titles not needed that USATODAY sends
        if ([string isEqual: @"USATODAY.com RSS Feed"])
        {
            return;
        } else if ([string isEqual:@"USATODAY.com"])
        {
            return;
        } else {
            [self addStory:tempString];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    isTitle = false;
}

-(NSMutableArray*)returnNames
{
    NSLog(@"NameArray contains %i objects BEFORE being passed!", [nameArray count]);
    return nameArray;
}

-(NSString*)returnAll
{
    return xmlString;
}

-(void)addStory:(NSString*)name
{
    [nameArray addObject:name];
    NSLog(@"item added to array!");
}

@end
