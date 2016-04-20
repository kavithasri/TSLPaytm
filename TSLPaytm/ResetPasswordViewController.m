//
//  ResetPasswordViewController.m
//  
//
//  Created by SakethReddy on 09/02/16.
//
//

#import "ResetPasswordViewController.h"
#import <AFNetworking.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController{
    
    UITextField *emailId;
    UIButton    *submit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   =   [UIColor whiteColor];
    
    emailId                     =   [[UITextField alloc]init];
    emailId.textColor           =   [UIColor blackColor];
    emailId.frame               =   CGRectMake(30, 150, self.view.frame.size.width-60, 25);
    emailId.placeholder         =   @"emailID";
    [self.view addSubview:emailId];
    emailId.borderStyle         =   UITextBorderStyleRoundedRect;
    
    submit                      =   [[UIButton alloc]init];
    submit.frame                =   CGRectMake(100, 200, self.view.frame.size.width-200, 30);
    submit.backgroundColor      =   [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(performSubmit) forControlEvents:UIControlEventTouchUpInside];
    submit.layer.cornerRadius   =   10;
    [self.view addSubview:submit];
    
}
-(void)performSubmit{
    
    if ([MFMailComposeViewController canSendMail])
    {
        
        MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
        NSString *mailBody = @"your Message";
        
        
        [mailComposeViewController setMessageBody:mailBody isHTML:NO];
        mailComposeViewController.mailComposeDelegate = self;
        [self presentViewController:mailComposeViewController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"e-Mail Sending Alert"
                                                        message:@"You can't send a mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }    }



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
