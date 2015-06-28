//
//  MineItemTableViewCell.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/23.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mineIcon;
@property (weak, nonatomic) IBOutlet UILabel *mineTitle;
@property (weak, nonatomic) IBOutlet UISwitch *mineSwitch;

@end
