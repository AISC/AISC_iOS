//
//  Map.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Map.h"

@interface Map ()

@end

@implementation Map

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)shouldAutorotate{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait);
}
- (void)viewDidLoad
{
    UITapGestureRecognizer* phoneLblGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PhoneLblTapped:)];
    // if labelView is not set userInteractionEnabled, you must do so
    [PhoneLabel setUserInteractionEnabled:YES];
    [PhoneLabel addGestureRecognizer:phoneLblGesture];
    
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 170, 320, 420)];
    mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D coord = {.latitude =  12.982186, .longitude =  80.246433};
    MKCoordinateSpan span = {.latitudeDelta =  0.01, .longitudeDelta =  0.01};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region]; 
    [self.view addSubview:mapView];
    
    double lon = 80.246433;
    double lat = 12.982186;
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lon;
    [point setCoordinate:(location)];
    [point setTitle:@"American International School"];
    [point setSubtitle:@"Taramani, Chennai, India"];
    [mapView addAnnotation:point];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)PhoneLblTapped:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://04422549000"]];
}


-(IBAction)BackButton:(id)sender
{
    if ([[UIScreen mainScreen]bounds].size.height==568) {
        homeObj = [[Home alloc] initWithNibName:@"Home" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }else{
        
        homeObj = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
