//
//  CustomObject.m
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "CustomObject.h"

@implementation CustomObject

static CustomObject *_instance = nil;

+(CustomObject*)GetInstance
{
    if (_instance == nil)
    {
        _instance = [[self alloc]init];
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
    if(self = [super init])
    {   //store all data that will be retrieved from the ViewController3 class
        string1 = @"This is stored data 1";
        string2 = @"This is stored data 2";
        string3 = @"This is stored data 3";
    }
    return self;
}

-(NSString*) getString1
{
    return string1;
}

-(NSString*) getString2
{
    return string2;
}

-(NSString*) getString3
{
    return string3;
}

@end
