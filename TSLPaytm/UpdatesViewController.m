//
//  UpdatesViewController.m
//  PaytmTabbar
//
//  Created by Admin1 on 03/02/16.
//  Copyright (c) 2016 Admin1. All rights reserved.
//

#import "UpdatesViewController.h"

@interface UpdatesViewController ()

@end

@implementation UpdatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"Update";
    
    UIImage*logoimage=[UIImage imageNamed:@"ic_format_list_bulleted_3x.png"];
    UIImageView*imageview=[[UIImageView alloc]initWithFrame:CGRectMake(30,100, 60, 30)];
    imageview.image=logoimage;
    [self.view addSubview:imageview];
    
    
    UIImage*logoimage1=[UIImage imageNamed:@"ic_system_update_alt_2x.png"];
    UIImageView*imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(150,300, 100, 50)];
    imageview1.image=logoimage1;
    [self.view addSubview:imageview1];
    
    
    UIImage*logoimage2=[UIImage imageNamed:@"ic_navigate_next_2x.png"];
    UIImageView*imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(280,95, 80, 40)];
    imageview2.image=logoimage2;
    [self.view addSubview:imageview2];
    
    
    
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(150, 40, 200, 20)];
    label.text=@"Updates";
    [self.view addSubview:label];
    
    UILabel*label1=[[UILabel alloc]initWithFrame:CGRectMake(120, 100, 350, 30)];
    label1.text=@"Notification Settings";
    [self.view addSubview:label1];
    
    UILabel*label2=[[UILabel alloc]initWithFrame:CGRectMake(140, 350, 180, 50)];
    label2.text=@"No New Updates!";
    [self.view addSubview:label2];
    
    UISegmentedControl *segmentedcontroller=[[UISegmentedControl alloc]initWithItems:@[@"Notifications",@"Messages",]];
    segmentedcontroller.frame=CGRectMake(70, 160, 250, 50);
    [self.view addSubview:segmentedcontroller];
    [segmentedcontroller addTarget:self action:@selector(segmentedvaluechanged:) forControlEvents:UIControlEventValueChanged];
    segmentedcontroller.backgroundColor=[UIColor lightGrayColor];
    segmentedcontroller.selectedSegmentIndex=1;
}


-(void)segmentedvaluechanged:(UISegmentedControl *)segmented{
    NSInteger selectedIndex=segmented.selectedSegmentIndex;
    if(selectedIndex==0){
        NSLog(@"Notifications");
        
        
    }
    else (selectedIndex=1);{
        
        NSLog(@"Messages");
        
    }
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
