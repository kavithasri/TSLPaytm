//
//  SignUpViewController.m
//  
//
//  Created by SakethReddy on 04/02/16.
//
//

#import "SignUpViewController.h"
#import "ViewController.h"
#import <AFNetworking.h>
#import "LoginViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController{
    
    UITextField     *firstName,*lastName,*password,*reEnterPassword,*emailId,*mobileNumber;
    UIButton        *signUp;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor       =   [UIColor whiteColor];
    
    UIImageView *paytmImage         =   [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VFsaWo_G-4.jpeg"]];
    paytmImage.frame                =   CGRectMake(130, 100, self.view.frame.size.width-260, 100);
    [self.view addSubview:paytmImage];
    
    firstName                       =   [[UITextField alloc]init];
    firstName.textColor             =   [UIColor blackColor];
    firstName.frame                 =   CGRectMake(30, 200, self.view.frame.size.width-60, 25);
    firstName.placeholder           =   @"First Name";
    [self.view addSubview:firstName];
    firstName.borderStyle           =   UITextBorderStyleRoundedRect;
    
    lastName                        =   [[UITextField alloc]init];
    lastName.textColor              =   [UIColor blackColor];
    lastName.frame                  =   CGRectMake(30, 250, self.view.frame.size.width-60, 25);
    lastName.placeholder            =   @"Last Name";
    [self.view addSubview:lastName];
    lastName.borderStyle            =   UITextBorderStyleRoundedRect;
    
    password                        =   [[UITextField alloc]init];
    password.textColor              =   [UIColor blackColor];
    password.frame                  =   CGRectMake(30, 300, self.view.frame.size.width-60, 25);
    password.placeholder            =   @"Password";
    password.secureTextEntry        =   YES;
    [self.view addSubview:password];
    password.delegate               =   self;
    password.borderStyle            =   UITextBorderStyleRoundedRect;
    
    reEnterPassword                 =   [[UITextField alloc]init];
    reEnterPassword.textColor       =   [UIColor blackColor];
    reEnterPassword.frame           =   CGRectMake(30, 350, self.view.frame.size.width-60, 25);
    reEnterPassword.placeholder     =   @"reEnterPassword";
    reEnterPassword.secureTextEntry =   YES;
    [self.view addSubview:reEnterPassword];
    reEnterPassword.borderStyle     =   UITextBorderStyleRoundedRect;
    
    emailId                         =   [[UITextField alloc]init];
    emailId.textColor               =   [UIColor blackColor];
    emailId.frame                   =   CGRectMake(30, 400, self.view.frame.size.width-60, 25);
    emailId.placeholder             =   @"emailID";
    [self.view addSubview:emailId];
    emailId.borderStyle             =   UITextBorderStyleRoundedRect;
    
    mobileNumber                    =   [[UITextField alloc]init];
    mobileNumber.textColor          =   [UIColor blackColor];
    mobileNumber.frame              =   CGRectMake(30, 450, self.view.frame.size.width-60, 25);
    mobileNumber.placeholder        =   @"Mobile Number";
    [mobileNumber setKeyboardType: UIKeyboardTypeNumberPad];
    [self.view addSubview:mobileNumber];
    mobileNumber.borderStyle        =   UITextBorderStyleRoundedRect;
    mobileNumber.delegate           =   self;
    
    signUp                          =   [[UIButton alloc]init];
    signUp.frame                    =   CGRectMake(50, 500, 80, 40);
    signUp.backgroundColor          =   [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    [signUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signUp setTitle:@"Register" forState:UIControlStateNormal];
    signUp.layer.cornerRadius       =   10;
    [signUp addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUp];
   
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }

    if (mobileNumber.text.length>=10){
        UIAlertView *alert          =   [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Mobile Number Length Exceeded" delegate:self cancelButtonTitle:@"dismiss" otherButtonTitles: nil];
        [alert show];
        return NO;
    }else{
        return YES;
    }
    
}

-(void)registerClick{
    
    AFHTTPRequestOperationManager *manager  =   [AFHTTPRequestOperationManager manager];
    manager.responseSerializer              =   [AFJSONResponseSerializer serializer];
    manager.requestSerializer               =   [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:@"XMawrbkbVIUbCdkcbSpvTzQkjP1nC7PeNm15dS6S" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [manager.requestSerializer setValue:@"IPF0fVMPySrqPTCvBgoWai7wcWQqrf0qJZDXfm7M" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    
    [manager GET:@"https://api.parse.com/1/classes/PayTM"
      parameters:@{}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
     
             NSMutableArray *details        =   [NSMutableArray new];
             details                        =   [responseObject objectForKey:@"results"];
             
             NSArray *filtered              =   [details filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(MobileNumber == %@) OR (emailID == %@) ", [NSString stringWithFormat:@"%@",mobileNumber.text],[NSString stringWithFormat:@"%@",emailId.text]]];
             
             if(filtered.count != 0) {
                 
                 UIAlertView *alert         =   [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"User with Mobile Number or EmailID is already Registered" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                 [alert show];
                 
                 
             } else {
                 [manager POST:@"https://api.parse.com/1/classes/PayTM" parameters:@{@"FirstName":firstName.text,@"LastName":lastName.text,@"Password":password.text, @"emailID":emailId.text,@"MobileNumber":mobileNumber.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        
                     UIAlertView *alert1     =      [[UIAlertView alloc]initWithTitle:@"Congratulations" message:@"Your Successfully Registered" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                     [alert1 show];
                     
                     
                     LoginViewController *lvc = [[LoginViewController alloc]init];
                     [self.navigationController pushViewController:lvc animated:YES];
                     
                 } failure:^(AFHTTPRequestOperation *operation, id responseObject){
                     
                 }];
             }
             
         }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



