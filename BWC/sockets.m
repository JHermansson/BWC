//
//  sockets.m
//  BWC
//
//  Created by Johan Hermansson on 2014-04-13.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import "sockets.h"

@interface sockets ()

@end

@implementation sockets

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
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
}

- (void)sendSocket{
    NSString * response = @"forward";
    NSData * data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];
    
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
