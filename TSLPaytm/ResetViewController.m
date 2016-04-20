//
//  ResetViewController.m
//  
//
//  Created by SakethReddy on 10/02/16.
//
//

#import "ResetViewController.h"

@interface ResetViewController ()

@end

@implementation ResetViewController{
    
    UITextField     *emailId;
    UIButton        *submit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
  
    emailId = [[UITextField alloc]init];
    emailId.textColor = [UIColor blackColor];
    emailId.frame = CGRectMake(30, 250, self.view.frame.size.width-60, 25);
    emailId.placeholder = @"emailID";
    [self.view addSubview:emailId];
    emailId.borderStyle = UITextBorderStyleRoundedRect;
    
    submit = [[UIButton alloc]init];
    submit.frame=CGRectMake(110, 300, self.view.frame.size.width-220, 30);
    submit.backgroundColor = [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.layer.cornerRadius = 10;
    [submit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];

    

}

-(void)submit{
    
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
