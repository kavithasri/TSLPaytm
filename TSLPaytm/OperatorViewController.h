//
//  OperatorViewController.h
//  
//
//  Created by SakethReddy on 11/02/16.
//
//

#import <UIKit/UIKit.h>

@protocol senddataProtocol <NSObject>

-(void)sendDataToA:(NSArray *)array; //I am thinking my data is NSArray, you can use another object for store your information.

@end


@interface OperatorViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UILabel *label;
@property(strong,nonatomic)NSString *passedData;
@property(strong,nonatomic)NSString *tag;@end
