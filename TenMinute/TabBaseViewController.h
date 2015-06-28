//
//  TabBaseViewController.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBaseViewController : UIViewController

@property(strong,nonatomic) UIViewController *mainViewController;

-(UIScrollView *)scrollView;

@end
