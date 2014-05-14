//
//  testSocketRocket.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-24.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRWebSocket.h"

@interface testSocketRocket : UIViewController<SRWebSocketDelegate>{
    SRWebSocket * webSocket;
}


@end
