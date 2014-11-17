//
//  Map.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Home.h"

@class Home;
@interface Map : UIViewController
{
    MKMapView *mapView;
    Home *homeObj;
    IBOutlet UILabel *PhoneLabel;
}

-(IBAction)BackButton:(id)sender;

@end
