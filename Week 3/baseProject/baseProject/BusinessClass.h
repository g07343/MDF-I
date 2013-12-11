//
//  BusinessClass.h
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessClass : NSObject
{
    NSMutableArray *names;
    NSMutableArray *latitudes;
    NSMutableArray *longitudes;
    NSString *selectedName;
    float latitude;
    float longitude;
}

+(BusinessClass*)GetInstance;

-(NSArray*)returnNameArray;

-(NSString*)returnName;

-(float)returnLat;

-(float)returnLon;

-(void)selectedLocation:(int)location;

-(void)removeLocation:(int)cell;

@end
