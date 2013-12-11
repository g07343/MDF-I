//
//  DetailViewController.h
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *nameLabelSmall;
    IBOutlet UILabel *latLabel;
    IBOutlet UILabel *lonLabel;
    IBOutlet MKMapView *mapView;
}

-(IBAction)onClick:(id)sender;

@end
