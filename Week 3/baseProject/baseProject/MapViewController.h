//
//  MapViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController
{
    IBOutlet MKMapView *mapView;
    NSArray *locations;
    NSArray *latitudes;
    NSArray *longitudes;
    NSMutableArray *annotations;
}
@end
