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

- (void)getTemp{
    NSLog(@"Temp");
    NSString * response = @"GetTemp";
    [webSocket send:response];
    seeTemp = 1;
    
}

- (IBAction)forwardOn:(UIButton *)sender {
    forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    if (forwardTimer == nil) {
        forwardTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(forwardGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)forwardRelease:(UIButton *)sender {
    [forwardTimer invalidate];
    forwardTimer = nil;
}

- (void)forwardGo{
    NSLog(@"Forward");
    NSString * response = @"forward";
    [webSocket send:response];
}

- (IBAction)leftOn:(UIButton *)sender {
    leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    if (leftTimer == nil) {
        leftTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(leftGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)leftRelease:(UIButton *)sender {
    [leftTimer invalidate];
    leftTimer = nil;
}

- (void)leftGo{
    NSLog(@"Left");
    NSString * response = @"left";
    [webSocket send:response];
    
}

- (IBAction)rightOn:(UIButton *)sender {
    rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    if (rightTimer == nil) {
        rightTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(rightGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)rightRelease:(UIButton *)sender {
    [rightTimer invalidate];
    rightTimer = nil;
}

- (void)rightGo{
    NSLog(@"Right");
    NSString * response = @"right";
    [webSocket send:response];
    
}

- (IBAction)reverseOn:(UIButton *)sender {
    reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    if (reverseTimer == nil) {
        reverseTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(reverseGo) userInfo:nil repeats:YES];
    }
}

- (IBAction)reverseRelease:(UIButton *)sender {
    [reverseTimer invalidate];
    reverseTimer = nil;
}

- (void)reverseGo{
    NSLog(@"Back");
    NSString * response = @"back";
    [webSocket send:response];
    
}

- (IBAction)honk:(UIButton *)sender {
    NSLog(@"Honk");
    NSString * response = @"honk";
    [webSocket send:response];
}

- (IBAction)musicOnOff:(UIButton *)sender {
    NSLog(@"Music");
    NSString * response = @"music";
    [webSocket send:response];
}

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

- (void)webSocketDidOpen:(SRWebSocket *)newWebSocket {
    webSocket = newWebSocket;
    //[webSocket send:[NSString stringWithFormat:@"Hello from %@", [UIDevice currentDevice].name]];
    NSLog(@"Connected");
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    [self connectWebSocket];
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    [self connectWebSocket];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"Message recived: %@",message);
    
    if (seeTemp == 1) {
        tempLabel2.text = [NSString stringWithFormat: @"%@ degrees Celsius", message];
        seeTemp = 0;
    }
}




@end
