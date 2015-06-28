//
//  TouchDemoView.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBTableView.h"
#import "Constants.h"
#import "UIScrollView+UITouch.h"

@interface TouchDemoView : UIView<UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *xbScrollView;

@property(strong,nonatomic) UIView *headerView;

@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *desc;
@property(strong,nonatomic) NSString *headerPic;

@property(assign,nonatomic) CGFloat headerHeight;

-(void)moveUpWithOffset:(CGFloat)contentOffset;

@end
