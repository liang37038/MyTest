//
//  FunnyTableViewCell2.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "FunnyTableViewCell2.h"

@implementation FunnyTableViewCell2

- (void)awakeFromNib {
    
    [_lb1 setTextColor:[UIColor ccColorWithHex:0x808080]];
    [_lb2 setTextColor:[UIColor ccColorWithHex:0x333333]];
    [_lb3 setTextColor:[UIColor ccColorWithHex:0x808080]];
    [_lb4 setTextColor:[UIColor ccColorWithHex:0x808080]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
