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
    
    //sets the labels and start the tempreature-Timer
    
    label.text = @"Drive View";
    seeTemp = 0;
    
    tempLabel.text = @"Temperature";
    tempLabel2.text = @"- degrees Celsius";
    tempTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(getTemp) userInfo:nil repeats:YES];
    
    
    
    
    [self connectWebSocket];
    

    
    
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

- (void)startTempTimer{
    
}

//get the temperature
- (void)getTemp{
    NSLog(@"Temp");
    NSString * response = @"GetTemp";
    [webSocket send:response];
    seeTemp = 1;
    
}

//start the forward-timer the the forwardbutton is pressed
- (IBAction)forwardOn:(UIButton *)sender {
    forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    if (forwardTimer == nil) {
        forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    }
}

//stops the forward-timer when the forwardbutton is not longer pressed down
- (IBAction)forwardRelease:(UIButton *)sender {
    [forwardTimer invalidate];
    forwardTimer = nil;
}

//sends the forward message to the server
- (void)forwardGo{
    NSLog(@"Forward");
    NSString * response = @"forward";
    [webSocket send:response];
}

//start the left-timer the the forwardbutton is pressed
- (IBAction)leftOn:(UIButton *)sender {
    leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    if (leftTimer == nil) {
        leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    }
}

//stops the left-timer when the forwardbutton is not longer pressed down
- (IBAction)leftRelease:(UIButton *)sender {
    [leftTimer invalidate];
    leftTimer = nil;
}

//sends the left message to the server
- (void)leftGo{
    NSLog(@"Left");
    NSString * response = @"left";
    [webSocket send:response];
    
}

//start the right-timer the the forwardbutton is pressed
- (IBAction)rightOn:(UIButton *)sender {
    rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    if (rightTimer == nil) {
        rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    }
}

//stops the right-timer when the forwardbutton is not longer pressed down
- (IBAction)rightRelease:(UIButton *)sender {
    [rightTimer invalidate];
    rightTimer = nil;
}

//sends the right message to the server
- (void)rightGo{
    NSLog(@"Right");
    NSString * response = @"right";
    [webSocket send:response];
    
}

//start the reverse-timer the the forwardbutton is pressed
- (IBAction)reverseOn:(UIButton *)sender {
    reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    if (reverseTimer == nil) {
        reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    }
}

//stops the reverse-timer when the forwardbutton is not longer pressed down
- (IBAction)reverseRelease:(UIButton *)sender {
    [reverseTimer invalidate];
    reverseTimer = nil;
}

//sends the back message to the server
- (void)reverseGo{
    NSLog(@"Back");
    NSString * response = @"back";
    [webSocket send:response];
    
}

//sends the honk message to the server
- (IBAction)honk:(UIButton *)sender {
    NSLog(@"Honk");
    NSString * response = @"honk";
    [webSocket send:response];
}

//sends the music message to the server
- (IBAction)musicOnOff:(UIButton *)sender {
    NSLog(@"Music");
    NSString * response = @"music";
    [webSocket send:response];
}

//connect to the server with websocket
- (void)connectWebSocket {
    webSocket.delegate = nil;
    webSocket = nil;
    Ip = [[NSUserDefaults standardUserDefaults] valueForKey:@"IP"];
    
    NSLog(@"%@",Ip);
    
    NSString *urlString = [NSString stringWithFormat: @"ws://%@:50007",Ip];
    SRWebSocket *newWebSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:urlString]];
    newWebSocket.delegate = self;
    
    [newWebSocket open];
    NSLog(@"Connected");
    NSLog(@"%@", urlString);
}

// when the websocket opens it says that you are connected
- (void)webSocketDidOpen:(SRWebSocket *)newWebSocket {
    webSocket = newWebSocket;
    //[webSocket send:[NSString stringWithFormat:@"Hello from %@", [UIDevice currentDevice].name]];
    NSLog(@"Connected");
}

//if the websocket get any error it tries to connect again
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    [self connectWebSocket];
}

//if the websocket get closed it tries to connect again
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    [self connectWebSocket];
}

//print the message from the server when it receive any message
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"Message recived: %@",message);
    
    if (seeTemp == 1) {
        tempLabel2.text = [NSString stringWithFormat: @"%@ degrees Celsius", message];
        seeTemp = 0;
    }
}




@end
