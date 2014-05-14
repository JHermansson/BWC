//
//  DeadCode.m
//  BWC
//
//  Created by Johan Hermansson on 2014-05-14.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import "DeadCode.h"

@interface DeadCode ()

@end

@implementation DeadCode

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveLocation:(UIButton *)sender {
    
    
    lm = [[CLLocationManager alloc] init];
    lm.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
    
    location = [lm location];
    
    CLLocationCoordinate2D coordinate;
    coordinate.longitude = location.coordinate.longitude;
    coordinate.latitude = location.coordinate.latitude;
    
    coordinate = [location coordinate];
    
    
    if((location.coordinate.longitude== 0.0 ) && (location.coordinate.latitude==0.0))
    {
        
        UIAlertView *alert2 = [[UIAlertView alloc ] initWithTitle:(@"Server Error:")message:(@"Internet Problem. Try Later !!!") delegate:nil cancelButtonTitle:nil otherButtonTitles:(@"OK"), nil];
        [alert2 show];
        
    }
    
    else
    {
        
        
        coordinate = [location coordinate];
        UIAlertView *alert2 = [[UIAlertView alloc ] initWithTitle:(@"Location saved:")message:(@"You have saved the location") delegate:nil cancelButtonTitle:nil otherButtonTitles:(@"OK"), nil];
        [alert2 show];
        _userLongitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
        _userLatitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
        
        NSLog(@"%@",_userLongitude);
        NSLog(@"%@",_userLatitude);
        
        
    }
    
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
