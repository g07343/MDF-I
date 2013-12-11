//
//  MyMapAnnotation.m
//  baseProject
//
//  Created by Matthew Lewis on 12/10/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation
@synthesize title, coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord
{
    if ((self = [super init]))
    {
        title = text;
        coordinate = coord;
    }
    return self;
}

@end
