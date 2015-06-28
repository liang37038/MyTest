//
//  FunnyTableViewCell1.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+CCCustom_Hex.h"
#import "StyledPageControl.h"

@interface FunnyTableViewCell1 : UITableViewCell<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong,nonatomic) NSArray *picArray;

@property (weak, nonatomic) IBOutlet UIView *picFlagView;

@end
