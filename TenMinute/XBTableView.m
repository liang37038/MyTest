//
//  XBTableView.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBTableView.h"



@implementation XBTableView
{

}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        [self configDefault];
    }
    
    return self;
}

-(void)configDefault{
    
    __weak typeof(self) weakSelf = self;
    
    [self addLegendHeaderWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 拿到当前的下拉刷新控件，结束刷新状态
            [weakSelf.header endRefreshing];
        });
    }];
    
    [self setDelegate:self];
}



@end
