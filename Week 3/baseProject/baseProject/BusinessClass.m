//
//  BusinessClass.m
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "BusinessClass.h"

@implementation BusinessClass

static BusinessClass *_instance = nil;

+(BusinessClass*)GetInstance
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
    if(self = [super init])
    {
        names = [[NSArray alloc] initWithObjects:@"Location1", @"Location2", @"Location3", @"Location4", @"Location5", @"Location6", @"Location7", @"Location8", @"Location9", @"Location10", nil];
    }
    return self;
}

-(NSArray*)returnNameArray
{
    return names;
}

@end
