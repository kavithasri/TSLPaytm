//
//  FirstViewController.m
//  
//
//  Created by SakethReddy on 04/02/16.
//
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController{
    
    UIImage *image;
    UIImageView *imageView;
    NSMutableArray *mainArray;
    int index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *paytmImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VFsaWo_G-4.jpeg"]];
    paytmImage.frame=CGRectMake(130, 40, self.view.frame.size.width-260, 100);
    [self.view addSubview:paytmImage];
    
    UILabel *helloLabel             = [[UILabel alloc]init];
    helloLabel.frame                = CGRectMake(15, self.view.frame.origin.y+125,self.view.frame.size.width-300, 40);
    helloLabel.textColor            = [UIColor blackColor];
    helloLabel.text                 = @"Hello";
    [self.view addSubview:helloLabel];
    
    UILabel *userNameDisplay             = [[UILabel alloc]init];
    userNameDisplay.frame                = CGRectMake(65, self.view.frame.origin.y+125,self.view.frame.size.width-150, 40);
    userNameDisplay.textColor            = [UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    userNameDisplay.text                 = self.userName;
    [self.view addSubview:userNameDisplay];
    
    UILabel *paytmOffers                 = [[UILabel alloc]init];
    paytmOffers.frame                    = CGRectMake(75, self.view.frame.origin.y+150,self.view.frame.size.width-150, 60);
    paytmOffers.textColor                = [UIColor blackColor];
    paytmOffers.text                     = @"Paytm Offers Recharges for";
    [self.view addSubview:paytmOffers];
    
    index =0;
    
    mainArray = [[NSMutableArray alloc]initWithObjects:@"aircel.png",@"airtel.png",@"BSNL.jpg",@"idea.png",@"mts.png",@"Reliance.jpg",@"TataDocomo",@"Uninor.png",@"vodafone",@"aircel.png",nil];
    
    UIImage *pic = [UIImage imageNamed:@"aircel.png"];
    imageView = [[UIImageView alloc]initWithImage:pic];
    imageView.frame = CGRectMake(65, 240, self.view.frame.size.width-130, 100);
    [imageView setImage:[UIImage imageNamed:[mainArray objectAtIndex:index]]];
    [self.view addSubview:imageView];
    
    scrollImage = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                   target:self
                                                 selector:@selector(tap)
                                                 userInfo:nil
                                                  repeats:YES];
    
    UIButton *recharge      =   [[UIButton alloc]init];
    recharge.frame          =   CGRectMake(110, 400, self.view.frame.size.width-140, 30);
    [recharge setTitle:@"Continue for Recharge" forState:UIControlStateNormal];
    [recharge setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    recharge.backgroundColor=[UIColor colorWithRed:65/255.0 green:178/255.0 blue:251/255.0 alpha:1.0];
    recharge.layer.cornerRadius = 5;
    [self.view addSubview:recharge];
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
