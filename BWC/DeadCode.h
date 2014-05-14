//
//  DeadCode.h
//  BWC
//
//  Created by Johan Hermansson on 2014-05-14.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DeadCode : UIViewController{
    CLLocationManager *lm;
    CLLocation *location;
    int locationtaps;
}

@property (strong, nonatomic) NSString *userLatitude;
@property (strong, nonatomic) NSString *userLongitude;

- (IBAction)saveLocation:(UIButton *)sender;

@end
