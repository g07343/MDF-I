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
        names = [[NSMutableArray alloc] initWithObjects:@"Creve Coeur", @"Kirkwood", @"Oakville", @"Hazelwood", @"St.Charles", @"Chesterfield", @"Fenton", @"Webster Groves", @"Brentwood", @"St. Peters", nil];
        latitudes = [[NSMutableArray alloc] initWithObjects:@"38.6672", @"38.5806", @"38.4586", @"38.7787", @"38.4719", @"38.6533", @"38.5281", @"38.5878", @"38.6191", @"38.7788", nil];
        longitudes = [[NSMutableArray alloc] initWithObjects:@"-90.4425", @"-90.4142", @"-90.3193", @"-90.3664", @"-90.3042", @"-90.5524", @"-90.4442", @"-90.3544", @"-90.3487", @"-90.6031", nil];
        //set defaults for variables
        latitude = 2.2f;
        longitude = 0.0f;
        selectedName = @"";
    }
    return self;
}
//returns nameArray
-(NSArray*)returnNameArray
{
    return names;
}
//returnes latitudes to caller
-(NSArray*)returnLatitudes
{
    return latitudes;
}
//returns longitudes to caller
-(NSArray*)returnLongitudes
{
    return longitudes;
}

-(NSString*)returnName
{
    return selectedName;
}

-(float)returnLat
{
    return latitude;
}

-(float)returnLon
{
    return longitude;
}
//sets variables according to what location the user chooses
-(void)selectedLocation:(int)location
{
    selectedName = names[location];
    //create temporary NSStrings to convert to float
    NSString *latTemp = latitudes[location];
    latitude = [latTemp floatValue];
    
    NSString *lonTemp = longitudes[location];
    longitude = [lonTemp floatValue];
    
}
//removes objects from arrays since arrays are reused for mapView
-(void)removeLocation:(int)cell
{
    [names removeObjectAtIndex:cell];
    [latitudes removeObjectAtIndex:cell];
    [longitudes removeObjectAtIndex:cell];
}

@end
