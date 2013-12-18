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
    {   //init the two mutableArrays to receive and hold data
        nameArray = [[NSMutableArray alloc] init];
        linkArray = [[NSMutableArray alloc] init];
    }
    return self;
}

//this function starts the process of retrieving articles
-(void)getArticles
{
    //create url
    url = [[NSURL alloc] initWithString:@"http://api.usatoday.com/open/breaking?expired=true&api_key=95z8paqfq8vg32gud2gs8g5t"];
    //create request
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {
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
            {   //store xml file locally to pull data from
                [requestData writeToFile:fullPath atomically:true];
            }
        }
    }
    //pull data from file stored locally via the GetFileDataFromFile method
    xmlData = [self GetFileDataFromFile:fullPath];
    if (xmlData != nil)
    {   //convert data object into string
        NSString *requestString = [[NSString alloc] initWithData:xmlData encoding:NSASCIIStringEncoding];
        if (requestString != nil)
        {
            //set the requestString to the xmlString, which is passed to the XMLViewController
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
{   //if elementName is a title, set the 'isTitle' boolean to true
    if ([elementName isEqualToString:@"title"])
    {
        isTitle = true;
    } else {
        isTitle = false;
    }
    //if the elementName is a link, set the 'isLink' boolean to true
    if ([elementName isEqualToString:@"link"])
    {
        isLink = true;
    } else {
        isLink = false;
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{   //create reuseable string to add to arrays, whether it is a title or link
    NSString *tempString = string;
    //if the parser detected the evaluated object is a title...
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
    //if the parser detected that the evaluated object is a link...
    if (isLink == true)
    {   //since the first two links returned in the xml are not articles, check an int and ignore if less than 2
        if (currentLink < 2)
        {
            currentLink ++;
            return;
        } else {
            [self addLink:tempString];
            currentLink ++;
        }
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //reset bools to false after parser finishes evaluating
    isTitle = false;
    isLink = false;
}
//returns array of downloaded article titles for the UITableView
-(NSMutableArray*)returnNames
{
    return nameArray;
}
//returns the entire XML file as a string for the XMLViewController's textView
-(NSString*)returnAll
{
    return xmlString;
}
//adds the name of an article to the nameArray
-(void)addStory:(NSString*)name
{
    [nameArray addObject:name];
}
//adds the url in string format to the linkArray
-(void)addLink:(NSString*)link
{
    [linkArray addObject:link];
}
//takes an int argument and 'sets' internal variables to supply to the detail view
-(void)setStory:(int)number
{
    current = number;
}

//returns the name of the selected story in the tableView
-(NSString*)returnSelected
{
    NSString *selected = nameArray[current];
    return selected;
}
//returns the url of the selected story in the tableView
-(NSString*)returnUrl
{
    NSString *selectedUrl = linkArray[current];
    return selectedUrl;
}
@end
