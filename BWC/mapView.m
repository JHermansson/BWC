//
//  mapView.m
//  BWC
//
//  Created by Johan Hermansson on 2014-04-11.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.


//  UNUSED CODE

#import "mapView.h"

@interface mapView ()

@end

@implementation mapView

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
    // Do any additional setup after loading the view.
    
    _mapView.delegate = self;
    label.text = @"Map View";
    _mapView.showsUserLocation = YES;
    
    MKCoordinateRegion region;
    region.center = self.mapView.userLocation.coordinate;

    
    MKCoordinateSpan span;
    span.latitudeDelta  = 10;
    span.longitudeDelta = 10;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    
    

    

}
- (void)viewDidAppear:(BOOL)animated{
    CLLocationCoordinate2D anyLocation;
    anyLocation.latitude = 51.49795;
    anyLocation.longitude = -0.174056;
    
    
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = anyLocation;
    point.title = @"Hej!";
    point.subtitle = @"Här kan man va!";
    
    [_mapView addAnnotation:point];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
