//
//  WebViewController.m
//  
//
//  Created by SakethReddy on 12/02/16.
//
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController{
    
    NSURLRequest    *urlRequest;
    UIWebView       *web;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    urlRequest = [NSURLRequest requestWithURL:self.webUrl];
    web = [[UIWebView alloc]init];
    web.frame = self.view.frame;
    [web loadRequest:urlRequest];
    [self.view addSubview:web];
//    [self.tabBarController.tabBar setHidden:YES];
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
