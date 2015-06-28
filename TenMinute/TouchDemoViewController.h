//
//  TouchDemoViewController.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchDemoView.h"
#import "FunnyTableViewCell2.h"
#import "FunnyTableViewCell3.h"
#import "FunnyObject.h"

@interface TouchDemoViewController : UIViewController

@property(strong,nonatomic) NSString *myTitle;
@property(strong,nonatomic) NSString *myDesc;
@property(strong,nonatomic) NSString *myPic;

@property(strong,nonatomic) NSMutableArray *funnyItems;

@property(strong,nonatomic) TouchDemoView *touchView;

-(UIScrollView *)scrollView;

@end
