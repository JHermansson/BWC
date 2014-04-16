//
//  forum.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-14.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forum : UIViewController{
    IBOutlet UIWebView * webView;
    NSURL * streamURL;
    NSURLRequest * requestURL;
}


@end
