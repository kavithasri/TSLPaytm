//
//  WalletViewController.m
//  PaytmTabbar
//
//  Created by Admin1 on 03/02/16.
//  Copyright (c) 2016 Admin1. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()

@end

@implementation WalletViewController{
    UIButton*button;
    UIButton*button1;
    UIButton*button2;
    UIButton*button3;
    UILabel*label;
    UILabel*label1;
    UILabel*label2;
    UILabel*label3;
    UILabel*label4;
    UILabel*label5;
    UILabel*label6;
    UILabel*label7;
    UILabel*label8;
    UILabel*label9;
    UILabel*background;
    UITextField *password;
     UIScrollView *scrollView;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Wallet";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 300, 350, 80)];
    scrollView.contentSize=CGSizeMake(900, 80);
    [self.view addSubview:scrollView];
    
    button=[[UIButton alloc]init];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Send Money" forState:UIControlStateNormal];
    button.frame=CGRectMake(10, 20, 130, 80);
    [scrollView addSubview:button];
    
    button1=[[UIButton alloc]init];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"Request Money" forState:UIControlStateNormal];
    button1.frame=CGRectMake(135, 20, 130, 80);
    [scrollView addSubview:button1];
    
    button3=[[UIButton alloc]init];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 setTitle:@"INSTALL" forState:UIControlStateNormal];
    button3.frame=CGRectMake(260, 145, 130, 80);
    [self.view addSubview:button3];
    
    button2=[[UIButton alloc]init];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"Add Money" forState:UIControlStateNormal];
    button2.frame=CGRectMake(260, 20, 130, 80);
    [scrollView addSubview:button2];
    
    label=[[UILabel alloc]init];
    label.frame=CGRectMake(0,220,self.view.frame.size.width,100);
    label.backgroundColor=[UIColor colorWithRed:65/255.0f green:178/255.0f blue:251/255.0f alpha:1.0f];
    [self.view addSubview:label];
    
    UILabel *txt= [[UILabel alloc]initWithFrame:CGRectMake(5, 200, self.view.frame.size.width,100)];
    txt.text=@"Wallet Balance";
    txt.textColor=[UIColor whiteColor];
    [self.view addSubview:txt];
    
    UILabel *txt1= [[UILabel alloc]initWithFrame:CGRectMake(15, 240, self.view.frame.size.width,100)];
    txt1.text=@"Rs.0";
    txt1.textColor=[UIColor whiteColor];
    [self.view addSubview:txt1];
    
    UILabel *txt2= [[UILabel alloc]initWithFrame:CGRectMake(260, 220, self.view.frame.size.width,100)];
    txt2.text=@"Transaction >";
    txt2.textColor=[UIColor whiteColor];
    [self.view addSubview:txt2];

    
    
//    label1=[[UILabel alloc]init];
//    label1.text=@"pay";
//    label1.frame=CGRectMake(80, 70, 120, 50);
//    label1.font=[UIFont systemFontOfSize:45];
//    label1.textColor=[UIColor blackColor];
//    [self.view addSubview:label1];
//    
//    label2=[[UILabel alloc]init];
//    label2.text=@"tm";
//    label2.textColor=[UIColor colorWithRed:65/255.0f green:178/255.0f blue:251/255.0f alpha:1.0f];
//    label2.frame=CGRectMake(149, 70, 120, 50);
//    label2.font=[UIFont systemFontOfSize:45];
//    [self.view addSubview:label2];
//    
//    label3=[[UILabel alloc]init];
//    label3.text=@"Wallet";
//    label3.frame=CGRectMake(200, 70, 120, 50);
//    label3.font=[UIFont systemFontOfSize:45];
//    [self.view addSubview:label3];
    
    label4=[[UILabel alloc]init];
    label4.text=@"Paytm Wallet on ios";
    label4.frame=CGRectMake(100, 60, 200, 70);
    //label4.font=[UIFont systemFontOfSize:45];
    [self.view addSubview:label4];
    
    label5=[[UILabel alloc]init];
    label5.text=@"checkout the wallet paytm";
    label5.frame=CGRectMake(100, 90, 230, 50);
    //label4.font=[UIFont systemFontOfSize:45];
    [self.view addSubview:label5];
    
    label6=[[UILabel alloc]init];
    label6.text=@"wallet app on APP";
    label6.frame=CGRectMake(100, 110, 200, 50);
    //label4.font=[UIFont systemFontOfSize:45];
    [self.view addSubview:label6];
    
    label7=[[UILabel alloc]init];
    label7.text=@"store";
    label7.frame=CGRectMake(100, 130, 200, 50);
    //label4.font=[UIFont systemFontOfSize:45];
    [self.view addSubview:label7];
    
    password=[[UITextField alloc]init];
    password.textColor=[UIColor blackColor];
    password.frame=CGRectMake(50, 400, 350, 60);
    // password.backgroundColor=[UIColor lightTextColor];
    password.secureTextEntry=YES;
    [password setKeyboardType:UIKeyboardTypeNumberPad];
    // password.borderStyle=UITextBorderStyleRoundedRect;
    password.placeholder=@"Mobile Number";
    [self.view addSubview:password];
    
    label8=[[UILabel alloc]init];
    //label8.text=@"--";
    label8.frame=CGRectMake(0, 460, self.view.frame.size.width, 2);
    label8.backgroundColor=[UIColor lightGrayColor];
    
    [self.view addSubview:label8];
    
    label9=[[UILabel alloc]init];
    //label8.text=@"--";
    label9.frame=CGRectMake(0, 530, self.view.frame.size.width, 2);
    label9.backgroundColor=[UIColor lightGrayColor];
    
    [self.view addSubview:label9];
    
    UITextField *password1=[[UITextField alloc]init];
    password1.textColor=[UIColor blackColor];
    password1.frame=CGRectMake(30, 470, 350, 60);
    // password1.backgroundColor=[UIColor lightTextColor];
    password1.secureTextEntry=YES;
    // password1.borderStyle=UITextBorderStyleRoundedRect;
    password1.placeholder=@"Amount(RS)";
    [password1 setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:password1];
    //    background=[[UILabel alloc]init];
    //    background.frame=CGRectMake(0 ,0,self.view.frame.size.width,self.view.frame.size.height-550);
    //   background .backgroundColor=[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f];
    //    [self.view addSubview:background];
    
    UIImage *pic1 = [UIImage imageNamed:@"wallet.png"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:pic1];
    imageView1.frame = CGRectMake(5, 70, 80,80);
    [self.view addSubview:imageView1];
    
    
    
    
    UIImage *pic = [UIImage imageNamed:@"ic_loyalty_2x.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:pic];
    imageView.frame = CGRectMake(330, 80, 40,30);
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
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
