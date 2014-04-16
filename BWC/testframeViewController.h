//
//  testframeViewController.h
//  BWC
//
//  Created by Johan Hermansson on 2014-04-02.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface testframeViewController : UIViewController<UITextFieldDelegate>{
    
    IBOutlet UILabel * LabelLogin;
    IBOutlet UITextField * UsernameTF1;
    IBOutlet UITextField * PasswordTF1;
    NSString * username1;
    NSString * password1;
    IBOutlet UILabel * usernameL;
    IBOutlet UILabel * passwordL;


    
}
@property (weak, nonatomic) IBOutlet UITextField *PasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *UsernameTF;
- (IBAction)login:(UIButton *)sender;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;


@end
