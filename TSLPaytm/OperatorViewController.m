//
//  OperatorViewController.m
//  
//
//  Created by SakethReddy on 11/02/16.
//
//

#import "OperatorViewController.h"
#import "ViewController.h"

@interface OperatorViewController ()

@end

@implementation OperatorViewController{
    NSArray             *table;
    UITableViewCell     *tableViewCell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor       =   [UIColor grayColor];
    
    table                           =   [[NSArray alloc]initWithObjects:@"Aircel",@"Airtel",@"BSNL",@"Idea",@"Reliance",@"TataDocomo",@"Telenor",@"Vodafone", nil];
    
    UITableView *tableview          =    [[UITableView alloc]init];
    tableview.frame                 =   CGRectMake(0, 15, self.view.frame.size.width, 400);
    tableview.delegate              =   self;
    tableview.dataSource            =   self;
    tableview.backgroundColor       =   [UIColor grayColor];
    [self.view addSubview:tableview];
    //tableview.separatorColor=[UIColor blueColor];

    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return table.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier        =   [table objectAtIndex:indexPath.row];
    tableViewCell                   =   [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (tableViewCell               ==  nil) {
        tableViewCell               =   [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    //    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //    cell.accessoryType = UITableViewCellAccessoryNone;
    
    tableViewCell.textLabel.text    =   [table objectAtIndex:indexPath.row];
    self.label                      =   [[UILabel alloc]init];
    self.label.text                 =   [table objectAtIndex:indexPath.row];
    [tableViewCell addSubview:self.label];
    
    return tableViewCell;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor            =   [UIColor grayColor];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *object                =   [table objectAtIndex:indexPath.row];
    ViewController *vc              =   [[ViewController alloc]init];
    vc.passedData                   =   object;
    tableViewCell.tag               =   indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
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
