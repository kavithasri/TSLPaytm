//
//  ContactViewController.m
//  
//
//  Created by SakethReddy on 11/02/16.
//
//

#import "ContactViewController.h"
#import "ViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController{
    NSArray             *table;
    UITableViewCell     *cell1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor       =   [UIColor grayColor];
    
    table                           =   [[NSArray alloc]initWithObjects:@"Arun(8500684804)",@"Sreekar(9908516311)",@"Saketh(9985888688)",@"Kavitha(9000064166)",@"Manmohan(8978443990)",@"Rajinikanth(8297745531)", nil];
    
    UITableView *tableview          =   [[UITableView alloc]init];
    tableview.frame                 =   CGRectMake(0, 15, self.view.frame.size.width, 400);
    tableview.delegate              =   self;
    tableview.dataSource            =   self;
    tableview.backgroundColor       =   [UIColor grayColor];
    //tableview.separatorColor=[UIColor blueColor];
    [self.view addSubview:tableview];
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return table.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier        =   [table objectAtIndex:indexPath.row];
    cell1                           =   [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell1                       ==  nil) {
        cell1                       =   [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    //    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell1.textLabel.text            =   [table objectAtIndex:indexPath.row];
    self.label                      =   [[UILabel alloc]init];
    self.label.text                 =   [table objectAtIndex:indexPath.row];
    [cell1 addSubview:self.label];
    
    return cell1;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor            =   [UIColor grayColor];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *object                =   [table objectAtIndex:indexPath.row];
    ViewController *vc              =   [[ViewController alloc]init];
    vc.contactData                  =   object;
    cell1.tag                       =   indexPath.row;
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
