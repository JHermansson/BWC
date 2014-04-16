//
//  DriveFrame.m
//  BWC
//
//  Created by Johan Hermansson on 2014-04-04.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import "DriveFrame.h"

@interface DriveFrame ()

@end

@implementation DriveFrame

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
    
    label.text = @"Drive View";
    streamURL = [NSURL URLWithString:@"http://new.livestream.com/accounts/3796876/events/2136694/player?width=425&height=240&autoPlay=true&mute=false%22%20width=%22425%22%20height=%22240%22%20frameborder=%220%22%20scrolling=%22no%22"];

    
    requestURL = [NSURLRequest requestWithURL:streamURL];
    [webView loadRequest:requestURL];
    
    locationtaps = 0;
    
    
    [self initNetworkCommunication];
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 50007, &readStream, &writeStream);
    inputStream = (NSInputStream *)CFBridgingRelease(readStream);
    outputStream = (NSOutputStream *)CFBridgingRelease(writeStream);
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
}






- (IBAction)forwardOn:(UIButton *)sender {
    forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    if (forwardTimer == nil) {
        forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)forwardRelease:(UIButton *)sender {
    [forwardTimer invalidate];
    forwardTimer = nil;
}

- (void)forwardGo{
    NSLog(@"Forward");
    [outputStream open];
    NSString *response  = [NSString stringWithFormat:@"forward"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSUTF32StringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    [outputStream close];
}

- (IBAction)leftOn:(UIButton *)sender {
    leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    if (leftTimer == nil) {
        leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)leftRelease:(UIButton *)sender {
    [leftTimer invalidate];
    leftTimer = nil;
}

- (void)leftGo{
    NSLog(@"Left");
    NSString *response  = [NSString stringWithFormat:@"left"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}

- (IBAction)rightOn:(UIButton *)sender {
    rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    if (rightTimer == nil) {
        rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)rightRelease:(UIButton *)sender {
    [rightTimer invalidate];
    rightTimer = nil;
}

- (void)rightGo{
    NSLog(@"Right");
    NSString *response  = [NSString stringWithFormat:@"right"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}

- (IBAction)reverseOn:(UIButton *)sender {
    reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    if (reverseTimer == nil) {
        reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)reverseRelease:(UIButton *)sender {
    [reverseTimer invalidate];
    reverseTimer = nil;
}

- (void)reverseGo{
    NSLog(@"Reverse");
    NSString *response  = [NSString stringWithFormat:@"reverse"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}

- (IBAction)honk:(UIButton *)sender {
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




@end
