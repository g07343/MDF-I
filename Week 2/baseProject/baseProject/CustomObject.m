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
    {   //hold pictures that will initially be loaded by the third viewController using the getPictures method
        monsterArray = [[NSArray alloc] initWithObjects:@"hardscrabble.png", @"worthington.png", @"randall.png", @"mike.png", @"sulley.png", nil];
    }
    return self;
}



-(NSArray*) getpictures
{
    return monsterArray;
}

-(void) selectedPerson:(NSString*)name
{  //check passed string and set local variables to proper values.  This data will be access almost immediately by the popUp view class by the getName, returnPicture, and getFilms methods
    
    selectedImage = name;
    if ([selectedImage  isEqual: @"hardscrabble"])
    {
        actorName = @"Helen Mirren";
        actorImage = @"mirren.jpg";
        otherFilms = @"Red (2010), The Queen (2006), The Prince of Egypt (1998)";
    } else if ([selectedImage  isEqual: @"worthington"])
    {
        actorName = @"Nathan Fillion";
        actorImage = @"fillion.jpg";
        otherFilms = @"Firefly (2002-2003), Saving Private Ryan (1998), Castle (2009-2013)";
    } else if ([selectedImage  isEqual: @"randall"])
    {
        actorName = @"Steve Buscemi";
        actorImage = @"buscemi.jpg";
        otherFilms = @"Fargo (1996), The Big Lebowshi (1998), Big Fish (2003)";
    } else if ([selectedImage  isEqual: @"mike"])
    {
        actorName = @"Billy Crystal";
        actorImage = @"crystal.png";
        otherFilms = @"When Harry met Sally (1989), City Slickers (1991), Analyze This (1999)";
    } else if ([selectedImage  isEqual: @"sulley"])
    {
        actorName = @"John Goodman";
        actorImage = @"goodman.jpg";
        otherFilms = @"Roseanne (1988-1997), Argo (2012), The Emperor's New Groove (2000)";
    }
}

-(NSString*) getName
{
    return actorName;
}
-(NSString*) returnPicture
{
    return actorImage;
}
-(NSString*) getFilms
{
    return otherFilms;
}
@end
