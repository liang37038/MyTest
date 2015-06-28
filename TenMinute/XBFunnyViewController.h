//
//  XBFunnyViewController.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TabBaseViewController.h"
#import "FunnyTableViewCell1.h"
#import "FunnyTableViewCell2.h"
#import "FunnyObject.h"

#import "XBTableView.h"
@interface XBFunnyViewController : TabBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) XBTableView *tableView;


@end
