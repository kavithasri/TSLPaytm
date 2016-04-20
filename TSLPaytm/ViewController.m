//
//  ViewController.m
//  TSLPaytm
//
//  Created by SakethReddy on 03/02/16.
//  Copyright (c) 2016 Trusted Software Labs. All rights reserved.
//

#import "ViewController.h"
#import "ContactViewController.h"
#import "OperatorViewController.h"
#import "SearchViewController.h"
#import "WebViewController.h"
#import "HomeViewController.h"
#import "WalletViewController.h"
#import "AccountViewController.h"
#import "UpdatesViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    UILabel         *prepaidLabel,*postpaidLabel,*plans;
    
    UITextField     *mobileNumber,*amount;
    
    BOOL            flag;
    
    NSString        *copy;
    
    UIScrollView    *scrollView;
    
    UIButton        *searchButton,*rechargeButton,*mobileButton,*electronics,*mens,*kids,*womens,*submit,*arrow,*prepaidButton,*postpaidButton;
    
    NSURL           *url;
    
    NSURLRequest    *urlRequest;
    
    UIWebView       *web;
    
    UIImage         *image;
    
    UIImageView     *imageView;
    
    NSMutableArray  *mainArray;
    
    int index;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor       =   [UIColor whiteColor];
    
    UIImageView *paytmImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VFsaWo_G-4.jpeg"]];
    paytmImage.frame=CGRectMake(130, 40, self.view.frame.size.width-260, 100);
    [self.view addSubview:paytmImage];
    
    
    UIImageView *searchImage        =   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search_2x.png"]];
    searchImage.frame               =   CGRectMake(300, 75, 25, 25);
    [self.view addSubview:searchImage];
    
    UIImageView *cart               =   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_local_mall_2x.png"]];
    cart.frame                      =   CGRectMake(340, 70, 30, 30);
    [self.view addSubview:cart];
    
    
    searchButton                    =   [[UIButton alloc]initWithFrame:CGRectMake(300, 65, 25, 25)];
    [searchButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    scrollView                      =   [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 350, 150)];
    scrollView.contentSize          =   CGSizeMake(900, 80);
    [self.view addSubview:scrollView];
    
    
    
    rechargeButton                  =   [[UIButton alloc]initWithFrame:CGRectMake(10, 125, 85, 15)];
    [rechargeButton setTitle:@"Recharge" forState:UIControlStateNormal];
    [rechargeButton setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [rechargeButton addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:rechargeButton];
    
    
    mobileButton                    =   [[UIButton alloc]initWithFrame:CGRectMake(120, 125, 200, 15)];
    [mobileButton setTitle:@"Mobile & Accessories" forState:UIControlStateNormal];
    [mobileButton setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [mobileButton addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:mobileButton];
    
    
    
    electronics                     =   [[UIButton alloc]initWithFrame:CGRectMake(280, 125, 200, 15)];
    [electronics setTitle:@"Electronics" forState:UIControlStateNormal];
    [electronics setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [electronics addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:electronics];
    
    mens                            =   [[UIButton alloc]initWithFrame:CGRectMake(420, 125, 200, 15)];
    [mens setTitle:@"Men's Fashion" forState:UIControlStateNormal];
    [mens setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [mens addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:mens];
    
    womens                          =   [[UIButton alloc]initWithFrame:CGRectMake(570, 125, 200, 15)];
    [womens setTitle:@"Women's Fashion" forState:UIControlStateNormal];
    [womens setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [womens addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:womens];
    
    kids                            =   [[UIButton alloc]initWithFrame:CGRectMake(720, 125, 200, 15)];
    [kids setTitle:@"Kid's Fashion" forState:UIControlStateNormal];
    [kids setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    [kids addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:kids];
    
    
    UILabel *circle                 =   [[UILabel alloc]initWithFrame:CGRectMake(45, 195, 20, 20)];
    circle.backgroundColor          =   [UIColor grayColor];
    circle.layer.cornerRadius       =   10;
    circle.layer.masksToBounds      =   YES;
    [self.view addSubview:circle];
    
    UILabel *circle1                =   [[UILabel alloc]initWithFrame:CGRectMake(46, 196, 18, 18)];
    circle1.backgroundColor         =   [UIColor whiteColor];
    circle1.layer.cornerRadius      =   9;
    circle1.layer.masksToBounds     =   YES;
    [self.view addSubview:circle1];
    
    
    prepaidButton =[[UIButton alloc]initWithFrame:CGRectMake(46, 196, 18, 18)];
    //contact.backgroundColor=[UIColor blueColor];
    [prepaidButton addTarget:self action:@selector(prepaidAction) forControlEvents:UIControlEventTouchUpInside];
    prepaidButton.layer.cornerRadius=9;
    prepaidButton.layer.masksToBounds=YES;
    [self.view addSubview:prepaidButton];
    
    prepaidLabel                    =   [[UILabel alloc]initWithFrame:CGRectMake(70, 180, 120, 50)];
    prepaidLabel.text               =   @"Prepaid";
    prepaidLabel.textColor          =   [UIColor blackColor];
    [self.view addSubview:prepaidLabel];
    
    UILabel *circle3                =   [[UILabel alloc]initWithFrame:CGRectMake(178, 195, 20, 20)];
    circle3.backgroundColor         =   [UIColor grayColor];
    circle3.layer.cornerRadius      =   10;
    circle3.layer.masksToBounds     =   YES;
    [self.view addSubview:circle3];
    
    UILabel *circle4                =   [[UILabel alloc]initWithFrame:CGRectMake(179, 196, 18, 18)];
    circle4.backgroundColor         =   [UIColor whiteColor];
    circle4.layer.cornerRadius      =   9;
    circle4.layer.masksToBounds     =   YES;
    [self.view addSubview:circle4];
    
    
    postpaidButton =[[UIButton alloc]initWithFrame:CGRectMake(179, 196, 18, 18)];
    //contact.backgroundColor=[UIColor blueColor];
    [postpaidButton addTarget:self action:@selector(postpaidAction) forControlEvents:UIControlEventTouchUpInside];
    postpaidButton.layer.cornerRadius=9;
    postpaidButton.layer.masksToBounds=YES;
    [self.view addSubview:postpaidButton];
    
    
    
    postpaidLabel                   =   [[UILabel alloc]initWithFrame:CGRectMake(200, 180, 120, 50)];
    postpaidLabel.text              =   @"Postpaid";
    postpaidLabel.textColor         =   [UIColor blackColor];
    [self.view addSubview:postpaidLabel];
    
    
    
    UIImageView *phoneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_contact_phone.png"]];
    phoneImage.frame=CGRectMake(310, 240, 30, 30);
    [self.view addSubview:phoneImage];
    
    UIButton *contact               =   [[UIButton alloc]initWithFrame:CGRectMake(310, 240, 30, 30)];
    //    contact.backgroundColor         =   [UIColor blueColor];
    [contact addTarget:self action:@selector(contactAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:contact];
    
    mobileNumber                    =   [[UITextField alloc]initWithFrame:CGRectMake(20,230,self.view.frame.size.width-40, 50)];
    mobileNumber.textColor          =   [UIColor blackColor];
    mobileNumber.backgroundColor    =   [UIColor lightTextColor];
    mobileNumber.borderStyle        =   UITextBorderStyleRoundedRect;
    //mobileNumber.secureTextEntry=YES;
    mobileNumber.placeholder        =   @"Mobile Number";
    [self.view addSubview:mobileNumber];
    
    
    
    self.operator                   =   [[UITextField alloc]initWithFrame:CGRectMake(20,300,self.view.frame.size.width-40 , 50)];
    self.operator.textColor=[UIColor blackColor];
    self.operator.backgroundColor=[UIColor lightTextColor];
    self.operator.borderStyle=UITextBorderStyleRoundedRect;
    //operator.secureTextEntry=YES;
    self.operator.placeholder       =   @"Operator";
    [self.view addSubview:self.operator];
    self.operator.delegate          =   self;
    self.operator.text              =   self.passedData;
    //self.operator.text=self.label;
    
    UIImageView *arrowImage         =   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_keyboard_arrow_down_2x.png"]];
    arrowImage.frame                =   CGRectMake(310, 310, 30, 30);
    [self.view addSubview:arrowImage];
    
    
    arrow                           =   [[UIButton alloc]initWithFrame:CGRectMake(310, 310,30, 30)];
//        [arrow addTarget:self action:@selector(arrowAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrow];
    
    
    
    amount                          =   [[UITextField alloc]initWithFrame:CGRectMake(20,370,self.view.frame.size.width-40, 50)];
    amount.textColor                =   [UIColor blackColor];
    amount.backgroundColor          =   [UIColor lightTextColor];
    amount.borderStyle              =   UITextBorderStyleRoundedRect;
    //amount.secureTextEntry=YES;
    amount.placeholder              =   @"Amount";
    [self.view addSubview:amount];
    
    plans                           =   [[UILabel alloc]initWithFrame:CGRectMake(250, 370, 120, 50)];
    plans.text                      =   @"Browse Plans";
    plans.textColor                 =   [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    // payLabel.font=[UIFont fontWithName:@"HelveticaNeue-Bold " size:100];
    UIFont *size                    =  plans.font;
    plans.font                      =   [size fontWithSize:15];
    [self.view addSubview:plans];
    
    
    
    
    submit                          =   [[UIButton alloc]initWithFrame:CGRectMake(40, 450, self.view.frame.size.width-80, 30)];
    [submit setTitle:@"Proceed To Recharge" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submit.layer.cornerRadius       =   10;
    submit.layer.masksToBounds      =   YES;
    submit.backgroundColor          =   [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    [submit addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    
    
    index =0;
    
    mainArray = [[NSMutableArray alloc]initWithObjects:@"aircel.png",@"airtel.png",@"BSNL.jpg",@"idea.png",@"mts.png",@"Reliance.jpg",@"TataDocomo",@"Uninor.png",@"vodafone",@"aircel.png",nil];
    
    UIImage *pic = [UIImage imageNamed:@"aircel.png"];
    imageView = [[UIImageView alloc]initWithImage:pic];
    imageView.frame = CGRectMake(80, 500, self.view.frame.size.width-160, 65);
    [imageView setImage:[UIImage imageNamed:[mainArray objectAtIndex:index]]];
    [self.view addSubview:imageView];
    
    scrollImage = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                   target:self
                                                 selector:@selector(tap)
                                                 userInfo:nil
                                                  repeats:YES];
    
}

-(void)tap{
    
    if (index == mainArray.count-1)
    {
        index = 0 ;
        
    }
    index++;
    [imageView setImage:[UIImage imageNamed:[mainArray objectAtIndex:index]]];
    [imageView setNeedsDisplay];
}

-(void)prepaidAction{
    prepaidButton.backgroundColor=[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    UIImageView *prepaid = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_check_circle_white_2x.png"]];
    prepaid.frame=CGRectMake(45, 195, 20, 20);
    [self.view addSubview:prepaid];
    
    postpaidButton.backgroundColor=[UIColor whiteColor];
    
}

-(void)postpaidAction{
    postpaidButton.backgroundColor=[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    UIImageView *postpaid = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_check_circle_white_2x.png"]];
    postpaid.frame=CGRectMake(178, 195, 20, 20);
    [self.view addSubview:postpaid];
    
    prepaidButton.backgroundColor=[UIColor whiteColor];
}

-(void)contactAction{
    ContactViewController *cvc=[[ContactViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    OperatorViewController *ovc=[[OperatorViewController alloc]init];
    [self.navigationController pushViewController:ovc animated:YES];
}

-(void)Action:(UIButton *)sender{
    
    [rechargeButton setTitleColor:[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0]
                         forState:UIControlStateNormal];
    
}

-(void)submitAction:(UIButton *)sender{
    
    
        if ([self.operator.text isEqual: @"Aircel"]) {
            
            url = [NSURL URLWithString:@"https://epayment.aircel.com/aircelonlinerecharge/"];
            
            
        }else if ([self.operator.text isEqual: @"Airtel"]){
            
            url = [NSURL URLWithString:@"https://www.airtel.in/personal/mobile/prepaid/easy-recharge-enter-number"];
            
        }else if ([self.operator.text isEqual: @"BSNL"]){
            
            url = [NSURL URLWithString:@"http://portal2.bsnl.in/myportal/quickrecharge.do"];
            
            
        }else if ([self.operator.text isEqual: @"Idea"]){
            
            url = [NSURL URLWithString:@"https://care.ideacellular.com/wps/portal/account/online-recharge?gclid=CjwKEAiA__C1BRDqyJOQ8_Tq230SJABWBSxnSIIxpypYjWj3bS5OFCr1qHnmDGT74rr6dmdThz27GxoCu77w_wcB"];
            
            
        }else if ([self.operator.text isEqual: @"Reliance"]){
            
            url = [NSURL URLWithString:@"http://myservices.relianceada.com/captureInstantRecharge.do"];
          
        }else if ([self.operator.text isEqual: @"TataDocomo"]){
            
            url = [NSURL URLWithString:@"https://recharge.tatadocomo.com/ORPortal/bannerHome?mainCategory=YourBestPicks&bannerCode=SaS|Data&utm_source=Google&utm_medium=PaidSearch&utm_content=Recharge&utm_campaign=OR-Search-Brand-OR-Exact-RLSA-Rx&gclid=CjwKEAiA__C1BRDqyJOQ8_Tq230SJABWBSxnG_-aZvnRYE5kWDUFXwz2aK05Vz4_MCLp4at39SPLjRoCzZvw_wcB"];
                       
        }else if ([self.operator.text isEqual: @"Telenor"]){
            
            url = [NSURL URLWithString:@"https://www.telenor.in/recharge"];
            
            
        }else if ([self.operator.text isEqual: @"Vodafone"]){
            
            url = [NSURL URLWithString:@"https://shop.vodafone.in/shop/prepaid/recharge-online.jsp"];

        
        }else {
            
            UIAlertView *alert         = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Enter all the fields" delegate:self cancelButtonTitle:@"dismiss" otherButtonTitles: nil];
            [alert show];
           
        }
    
    LoginViewController *lvc = [[LoginViewController alloc]init];
    lvc.webUrl1 = url;
    
    [self.navigationController pushViewController:lvc animated:YES];
    
    
}

-(void)buttonAction:(UIButton *)sender{
    SearchViewController *svc=[[SearchViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

-(BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
