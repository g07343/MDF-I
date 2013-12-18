//
//  NewsObject.h
//  baseProject
//
//  Created by Matthew Lewis on 12/15/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsObject : NSObject <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    NSMutableArray *nameArray;
    NSMutableArray *linkArray;
    NSString *nameString;
    NSString *linkString;
    ///////////////////////////////
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *requestData;
    NSString *xmlString;
    NSString *fullPath;
    NSData *xmlData;
    BOOL isTitle;
}

+(NewsObject*)GetInstance;
-(void)getArticles;
-(NSString*)returnAll;
-(NSMutableArray*)returnNames;
@end
