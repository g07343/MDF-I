//
//  DetailViewController.m
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "DetailViewController.h"
#import "BusinessClass.h"
#import "MyMapAnnotation.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up MapView with proper coords and zoom
    MKCoordinateSpan span;
    span.latitudeDelta = 0.05f;
    span.longitudeDelta = 0.05f;
    
    CLLocationCoordinate2D location;
    location.latitude = [[BusinessClass GetInstance]returnLat];
    location.longitude = [[BusinessClass GetInstance] returnLon];
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    //get location 'pin' from custom class
    NSString *nameString = [[BusinessClass GetInstance] returnName];
    MyMapAnnotation *annotation = [[MyMapAnnotation alloc] initWithTitle:nameString coord:location];
    if (annotation != nil)
    {
        [mapView addAnnotation:annotation];
    }
    
    //get Name of selected location from custom class to both labels
    nameLabel.text = [[BusinessClass GetInstance] returnName];
    nameLabelSmall.text = [[BusinessClass GetInstance]returnName];
    
    //get latitude of selected location from custom class
    latLabel.text = [NSString stringWithFormat:@"%.4f",[[BusinessClass GetInstance] returnLat]];
    lonLabel.text = [NSString stringWithFormat:@"%.4f",[[BusinessClass GetInstance] returnLon]];
    
    //get longitude of selected location from custom class
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
