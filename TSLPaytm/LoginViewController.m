//
//  ViewController.m
//  TSLPaytm
//
//  Created by SakethReddy on 03/02/16.
//  Copyright (c) 2016 Trusted Software Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "FirstViewController.h"
#import "ResetViewController.h"
#import "WebViewController.h"
#import "AccountViewController.h"
#import <AFNetworking.h>
@interface LoginViewController ()

@end

@implementation LoginViewController{
    
    
    UITextField *mobileNumber, *firstName;
    UITextField *password;
    UIButton    *login, *signUp, *forgot;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *paytmImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VFsaWo_G-4.jpeg"]];
    paytmImage.frame=CGRectMake(130, 100, self.view.frame.size.width-260, 100);
    [self.view addSubview:paytmImage];
    
    mobileNumber                = [[UITextField alloc]init];
    mobileNumber.textColor      = [UIColor blackColor];
    mobileNumber.frame          = CGRectMake(30, 250, self.view.frame.size.width-60, 25);
    mobileNumber.placeholder    = @"Mobile Number (Username)";
    [mobileNumber setKeyboardType: UIKeyboardTypeNumberPad];
    [self.view addSubview:mobileNumber];
    mobileNumber.borderStyle    = UITextBorderStyleRoundedRect;
    mobileNumber.delegate = self;
    
    password                    = [[UITextField alloc]init];
    password.textColor          = [UIColor blackColor];
    password.frame              = CGRectMake(30, 300, self.view.frame.size.width-60, 25);
    password.placeholder        = @"Password";
    password.secureTextEntry    = YES;
    [self.view addSubview:password];
    password.borderStyle = UITextBorderStyleRoundedRect;
    
    login                       = [[UIButton alloc]init];
    login.frame=CGRectMake(30, 350, self.view.frame.size.width-60, 30);
    login.backgroundColor       = [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [login setTitle:@"Login" forState:UIControlStateNormal];
    login.layer.cornerRadius    = 10;
    [login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login];
    
    forgot                      = [[UIButton alloc]init];
    forgot.frame=CGRectMake(50, 400, self.view.frame.size.width-100, 30);
    [forgot setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [forgot setTitle:@"Forgot Password ?" forState:UIControlStateNormal];
    [forgot addTarget:self action:@selector(forgotPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgot];
    
    
    signUp                      =   [[UIButton alloc]initWithFrame:CGRectMake(30, 450, self.view.frame.size.width-60, 30)];
    [signUp setTitle:@"Don't have an account ? Create" forState:UIControlStateNormal];
    [signUp setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [signUp addTarget:self action:@selector(signUpClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUp];
    
    }



-(void)loginClick{
    
    
       
    AFHTTPRequestOperationManager *manager  = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer              = [AFJSONResponseSerializer serializer];
    manager.requestSerializer               = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"XMawrbkbVIUbCdkcbSpvTzQkjP1nC7PeNm15dS6S" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [manager.requestSerializer setValue:@"IPF0fVMPySrqPTCvBgoWai7wcWQqrf0qJZDXfm7M" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    
    
    [manager GET:@"https://api.parse.com/1/classes/PayTM"
      parameters:@{}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"%@",responseObject);
             NSMutableArray *details        = [NSMutableArray new];
             details                        = [responseObject objectForKey:@"results"];
             
             NSArray *filtered              = [details filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(MobileNumber == %@) AND (Password == %@)", [NSString stringWithFormat:@"%@",mobileNumber.text],[NSString stringWithFormat:@"%@",password.text]]];
             
    
             if(filtered.count != 0)
             {

                 WebViewController *wvc = [[WebViewController alloc]init];
                 wvc.webUrl = self.webUrl1;
                 [self.navigationController pushViewController:wvc animated:YES];
                 
                 
                        }
             else
             {
                 
                 UIAlertView *alert         = [[UIAlertView alloc]initWithTitle:@"ooops" message:@"Invalid Credentials" delegate:self cancelButtonTitle:@"dismiss" otherButtonTitles: nil];
                 [alert show];
             }

         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}
-(void)forgotPassword{
    
    ResetViewController *rvc                = [[ResetViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    
    
}

-(void)signUpClick{
    
        SignUpViewController *suvc          = [[SignUpViewController alloc]init];
        [self.navigationController pushViewController:suvc animated:YES];
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
