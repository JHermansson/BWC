//
//  DriveFrame.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-04.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SRWebSocket.h"

@interface DriveFrame : UIViewController <NSStreamDelegate, SRWebSocketDelegate>{
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    IBOutlet UILabel * label;
    IBOutlet UIWebView * webView;
    NSURL * streamURL;
    NSURLRequest * requestURL;
    CLLocationManager *lm;
    CLLocation *location;
    int locationtaps;
    IBOutlet UIButton * music;
    NSTimer * forwardTimer;
    NSTimer * leftTimer;
    NSTimer * rightTimer;
    NSTimer * reverseTimer;
    SRWebSocket * webSocket;
    
}

@property (strong, nonatomic) NSString *userLatitude;
@property (strong, nonatomic) NSString *userLongitude;


- (IBAction)forwardOn:(UIButton *)sender;

- (IBAction)forwardRelease:(UIButton *)sender;

- (void)forwardGo;

- (IBAction)leftOn:(UIButton *)sender;

- (IBAction)leftRelease:(UIButton *)sender;

- (void)leftGo;

- (IBAction)rightOn:(UIButton *)sender;

- (IBAction)rightRelease:(UIButton *)sender;

- (void)rightGo;

- (IBAction)reverseOn:(UIButton *)sender;

- (IBAction)reverseRelease:(UIButton *)sender;

- (void)reverseGo;

- (IBAction)honk:(UIButton *)sender;
- (IBAction)musicOnOff:(UIButton *)sender;






@end
