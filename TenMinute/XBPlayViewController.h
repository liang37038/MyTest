//
//  XBPlayViewController.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XBTouchCollectionViewController.h"
#import "TabBaseViewController.h"
#import "PlayItemTableViewCell.h"
#import "PlayObject.h"

@interface XBPlayViewController : TabBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) UITableView *playTableView;

@end
