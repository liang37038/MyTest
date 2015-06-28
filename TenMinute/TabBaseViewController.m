//
//  TabBaseViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "TabBaseViewController.h"

@interface TabBaseViewController ()

@end

@implementation TabBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(UINavigationController *)navigationController{
    if (_mainViewController) {
        return _mainViewController.navigationController;
    }
    return [super navigationController];
}

@end
