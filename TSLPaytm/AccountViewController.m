//
//  AccountViewController.m
//  PaytmTabbar
//
//  Created by Admin1 on 03/02/16.
//  Copyright (c) 2016 Admin1. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController
{
    
    NSArray *table;
    NSArray *mainarray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Account";
    
    UILabel*account;
    account =[[UILabel alloc]initWithFrame:CGRectMake(120, 0, 100, 100)];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
//    account.text=@"ACCOUNT";
//    account.backgroundColor=[UIColor lightTextColor];
//    [self.view addSubview:account];
    
    
    UITextField*username=[[UITextField alloc]initWithFrame:CGRectMake(120, 40, 200, 150)];
    username.backgroundColor=[UIColor lightTextColor];
    username.placeholder=@"GMAILID";
    [self.view addSubview:username];
    
    UILabel *roundcircle = [[UILabel alloc]initWithFrame:CGRectMake(40, 75, 70, 70)];
    roundcircle.textColor=[UIColor whiteColor];
    roundcircle.backgroundColor=[UIColor lightGrayColor];
    roundcircle.layer.cornerRadius=35;
    roundcircle.layer.masksToBounds=YES;
    [self.view addSubview:roundcircle];
    
    UILabel*roundcircle1=[[UILabel alloc]initWithFrame:CGRectMake(60, 75, 70, 70)];
     UIFont *size1= roundcircle1.font;
    roundcircle1.font=[size1 fontWithSize:30];
     roundcircle1.text=@"GI";
    [self.view addSubview:roundcircle1];

    
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(100, 460, 250, 50)];
    label.text=@"Contact us";
    label.backgroundColor=[UIColor lightTextColor];
    [self.view addSubview:label];
    UILabel*label1=[[UILabel alloc]initWithFrame:CGRectMake(100, 500, 250, 40)];
    label1.text=@"We are here 24*7";
    label1.backgroundColor=[UIColor lightTextColor];
    [self.view addSubview:label1];
    
    
    
    
    
    table=[[NSArray alloc]initWithObjects:@"YourOrders",@"WishList",@"Favourites",@"Help&FAQ",nil];
    
    
    UITableView*tableview=[[UITableView alloc]init];
    tableview.frame=CGRectMake(100, 150, 250, 200);
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    // Do any additional setup after loading the view.
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"";
        
    }
    else
        return @"";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [table count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array=[self->mainarray objectAtIndex:indexPath.section];    NSString *value= [array objectAtIndex:indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:value];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:value];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text=[table objectAtIndex:indexPath.row];
    
    UILabel*label=[[UILabel alloc]init];
    label.text=[array objectAtIndex:indexPath.row];
    [cell addSubview:label];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    NSArray *array=[self.mainarray objectAtIndex:indexPath.section];
    //    NSString *value=[array objectAtIndex:indexPath.row];
    //
    //
    //    DetailViewController *dvc=[[DetailViewController alloc]init];
    //    dvc.value=value;
    // [self.navigationController pushViewController:dvc animated:YES];
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
