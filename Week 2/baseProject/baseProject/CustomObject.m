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
        monsterArray = [[NSArray alloc] initWithObjects:@"hardscrabble.png", @"worthington.png", @"randall.png", @"mike.png", @"sulley.png", nil];
    }
    return self;
}



-(NSArray*) getpictures
{
    return monsterArray;
}

-(void) selectedPerson:(NSString*)name
{//save image
    selectedImage = name;
    if ([selectedImage  isEqual: @"hardscrabble"])
    {
        actorName = @"Helen Mirren";
        actorImage = @"mirren.jpg";
    } else if ([selectedImage  isEqual: @"worthington"])
    {
        actorName = @"Nathan Fillion";
        actorImage = @"fillion.jpg";
    } else if ([selectedImage  isEqual: @"randall"])
    {
        actorName = @"Steve Buscemi";
        actorImage = @"buscemi.jpg";
    } else if ([selectedImage  isEqual: @"mike"])
    {
        actorName = @"Billy Crystal";
        actorImage = @"crystal.png";
    } else if ([selectedImage  isEqual: @"sulley"])
    {
        actorName = @"John Goodman";
        actorImage = @"goodman.jpg";
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

@end
