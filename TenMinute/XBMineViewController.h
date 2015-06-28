//
//  XBMineViewController.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBaseViewController.h"
#import "MineItemTableViewCell.h"
#import "MineObject.h"

@interface XBMineViewController : TabBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) UITableView *mineTableView;

@end
