//
//  testframeViewController.m
//  BWC
//
//  Created by Johan Hermansson on 2014-04-02.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import "testframeViewController.h"

@interface testframeViewController ()

@end

@implementation testframeViewController
@synthesize username;
@synthesize password;


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
    self.UsernameTF.delegate = self;
    self.PasswordTF.delegate = self;
    usernameL.text = @"Username";
    passwordL.text = @"Password";
    
    LabelLogin.text = @"Login";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)login:(UIButton *)sender {
    username = UsernameTF1.text;
    password = PasswordTF1.text;
    NSUserDefaults *savedUsername= [NSUserDefaults standardUserDefaults];
    [savedUsername setObject:self.username forKey:@"username"];
    NSUserDefaults *savedPassword= [NSUserDefaults standardUserDefaults];
    [savedPassword setObject:self.password forKey:@"password"];
}

@end
