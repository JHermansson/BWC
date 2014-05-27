//
//  mapView.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-11.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.


//  UNUSED CODE

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapView : UIViewController <MKMapViewDelegate>{
    IBOutlet UILabel * label;

}

@property (strong, nonatomic) IBOutlet MKMapView * mapView;

@end
