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
    
    streamURL = [NSURL URLWithString:@"http://new.livestream.com/accounts/3796876/events/2136694/player?width=425&height=240&autoPlay=true&mute=false%22%20width=%22425%22%20height=%22240%22%20frameborder=%220%22%20scrolling=%22no%22"];
    
    
    webView.allowsInlineMediaPlayback=YES;
    requestURL = [NSURLRequest requestWithURL:streamURL];
    [webView loadRequest:requestURL];
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

- (void)initNetworkCommunication{
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    inputStream = (__bridge_transfer NSInputStream *)readStream;
    outputStream = (__bridge_transfer NSOutputStream *)writeStream;
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [outputStream open];
    
    // Flip bytes for network order prior to transmission
    //    uint32_t length = (uint32_t)htonl([_rawZombie length]);
    uint32_t messageType = (uint32_t)htonl(1);
    
    // Keeping track of bytes written for debug purposes...
    NSInteger bytesWritten;
    //    bytesWritten = [outputStream write:(uint8_t *)&length maxLength:4];
    NSLog(@"Wrote %ld bytes to the stream", (long)bytesWritten);
    bytesWritten = [outputStream write:(uint8_t *)&messageType maxLength:4];
    NSLog(@"Wrote %ld bytes to the stream", bytesWritten);
    
    // Write contents of protobuf object serialized as string, loaded into NSData pointer
    //  bytesWritten = [outputStream write:(uint8_t *)[_rawZombie bytes] maxLength:[_rawZombie length]];
    NSLog(@"Wrote %ld bytes to the stream", bytesWritten);
    
    [outputStream close];

    
}
- (void) goForward {
    
	NSString *response  = [NSString stringWithFormat:@"Forward"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}

- (void) goleft {
    
	NSString *response  = [NSString stringWithFormat:@"Forward"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}
- (void) goRight {
    
	NSString *response  = [NSString stringWithFormat:@"Forward"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}
- (void) goReverse {
    
	NSString *response  = [NSString stringWithFormat:@"Forward"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}

- (void)sendSocket{
    NSString * response = @"forward";
    NSData * data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];
    
}
- (void)connect{
    NSString *url = @"https://example.com:9999/";
    NSURL * URL = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:URL];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection self];
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
