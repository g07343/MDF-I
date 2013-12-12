//
//  MapViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "MapViewController.h"
#import "BusinessClass.h"
#import "MyMapAnnotation.h"
@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Map", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
        
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [mapView removeAnnotations:annotations];
}

- (void)viewWillAppear:(BOOL)animated
{
    //get all locations from mutable array in BusinessClass
    locations = [NSArray arrayWithArray:[[BusinessClass GetInstance] returnNameArray]];
    //get latitudes from mutable array in BusinessClass
    latitudes = [NSArray arrayWithArray:[[BusinessClass GetInstance] returnLatitudes]];
    //get longitudes from mutable array in BusinessClass
    longitudes = [NSArray arrayWithArray:[[BusinessClass GetInstance] returnLongitudes]];
    
    int numberOfItems = [locations count];
    
    annotations = [[NSMutableArray alloc] initWithCapacity: numberOfItems];
    
    
    //set up MapView with proper coords and zoom
    MKCoordinateSpan span;
    span.latitudeDelta = 0.7f;
    span.longitudeDelta = 0.7f;
    
    CLLocationCoordinate2D location;
    location.latitude = 38.6272f;
    location.longitude = -90.3487f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    //create all pins contained in the returned nameArray from BusinessClass (since all arrays SHOULD be the same length)
    for (int i = 0; i < [locations count]; i++)
    {
        CLLocationCoordinate2D location;
        NSString *name = locations[i];
        NSString *latitude = latitudes[i];
        //set latitude after converting to float
        location.latitude = [latitude floatValue];
        //set longitude after converting to float
        NSString *longitude = longitudes[i];
        location.longitude = [longitude floatValue];
        MyMapAnnotation *annotation = [[MyMapAnnotation alloc] initWithTitle:name coord:location];
        if (annotation != nil)
        {
            [mapView addAnnotation:annotation];
            [annotations addObject:annotation];
        }
    }
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
