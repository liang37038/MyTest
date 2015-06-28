//
//  XBNavigationViewController.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBNavigationViewController.h"
#import "UIColor+CCCustom_Hex.h"

@interface XBNavigationViewController ()

@end

@implementation XBNavigationViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self changeBarWhite];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeBarWhite];
}

-(void)changeBarWhite{
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                [UIColor whiteColor], NSForegroundColorAttributeName,                                                                             nil]];

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationBar.barTintColor = [UIColor ccColorWithHex:0x333333];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
