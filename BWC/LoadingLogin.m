//
//  LoadingLogin.m
//  BWC
//
//  Created by Johan Hermansson on 2014-04-03.
//  Copyright (c) 2014 ___NULLPOINTEREXEPTION___. All rights reserved.
//

#import "LoadingLogin.h"
#import "testframeViewController.h"

@interface LoadingLogin ()

@end

@implementation LoadingLogin




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view.
    
    
    //get the saved username and password and checks if it is correct or not, and sends the user to the right page.
    NSString *username=[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    NSString *password=[[NSUserDefaults standardUserDefaults] valueForKey:@"password"];

    if ([username isEqualToString:@"admin"] && [password isEqualToString:@"admin"]){
        [rl sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else{
        [wl sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    

    
    
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

@end
