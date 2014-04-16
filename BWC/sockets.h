//
//  sockets.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-13.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sockets : UIViewController <NSStreamDelegate>{
    NSInputStream * inputStream;
    NSOutputStream * outputStream;
}

@end
