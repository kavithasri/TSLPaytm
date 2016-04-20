//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "DetailedViewController.h"
#import "WebViewController.h"
#import <AFNetworking.h>

@implementation LeftMenuViewController{
    
    UITableView     *tableView1;
    NSMutableArray  *array,*mainArray;
    NSString        *value1;
    UILabel         *backgroundColor, *categories;
    NSURL           *url;
    
}

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor lightGrayColor];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
    self.tableView.backgroundView = imageView;
    
    backgroundColor = [[UILabel alloc]init];
    backgroundColor.backgroundColor = [UIColor colorWithRed:236/255 green:236/255 blue:236/255 alpha:0.1];
    backgroundColor.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-600);
    [self.view addSubview:backgroundColor];
    
    
    categories = [[UILabel alloc]init];
    [categories setTextColor:[UIColor blackColor]];
    [categories setText:@"Categories"];
    categories.frame = CGRectMake(110,30,self.view.frame.size.width-220,30);
    [self.view addSubview:categories];
    
    array = [[NSMutableArray alloc]initWithObjects:@"Mobile & Accessories",@"Electronics",@"Men's Fashion",@"Women's Fashion", @"Baby,Kids & Toys",@"Home & Kitchen",@"Sports & Health", @"Automotive" ,nil];
    
    
    tableView1 = [[UITableView alloc]init];
    tableView1.frame = CGRectMake(0, self.view.frame.origin.y+75, self.view.frame.size.width-70, self.view.frame.size.height-20);
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [self.view addSubview:tableView1];
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  array.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *value=[array objectAtIndex:indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:value];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:value];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    UILabel *label=[[UILabel alloc]init];
    label.text = [array objectAtIndex:indexPath.row];
    [cell addSubview:label];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    UIViewController *vc ;
    
    switch (indexPath.row)
    {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
            break;
            
        case 1:
            [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
            return;
            
    }
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
    
    
}
    
//    
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
//                                                             bundle: nil];
//    UIViewController *vc;
//
//     DetailedViewController *dvc = [[DetailedViewController alloc]init];
//    if (indexPath.row==0) {
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/electronics/mobile-accessories"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//    }
//    if (indexPath.row==1){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/electronics"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//        
//    }
//    if (indexPath.row==2){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/men"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//
//    }
//    if (indexPath.row==3){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/women"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//    }
//    if (indexPath.row==4){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/baby-kids-toys"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//    }
//    if (indexPath.row==5){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/home-and-kitchen"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//    }
//    if (indexPath.row==6){
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/sports-and-health"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//
//    }
//    if (indexPath.row==7) {
//        url = [NSURL URLWithString:@"https://paytm.com/shop/h/automotive"];
//        vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailedViewController"];
//    }
//    dvc.webUrl = url;
//    [self.navigationController pushViewController:vc animated:YES];
//    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc withSlideOutAnimation:self.slideOutAnimationEnabled
//                                                                     andCompletion:nil];
//

    
//               case 8:
//            [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
//            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
//            return;
//            break;
//    }
   
    
//    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
//                                                                     andCompletion:nil];




@end
