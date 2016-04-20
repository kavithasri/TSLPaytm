//
//  ViewController.h
//  TSLPaytm
//
//  Created by SakethReddy on 03/02/16.
//  Copyright (c) 2016 Trusted Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"



@interface ViewController : UIViewController<UITextFieldDelegate,SlideNavigationControllerDelegate>
{
    NSTimer *scrollImage;
}
@property (nonatomic, strong)NSString *userName;
@property(nonatomic,strong)UITextField *operator;
@property(nonatomic,strong)NSString *passedData;
@property(nonatomic,strong)NSString *contactData;


@end

