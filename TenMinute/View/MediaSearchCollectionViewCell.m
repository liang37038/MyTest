//
//  MediaSearchCollectionViewCell.m
//  TenMinute
//
//  Created by sasukiliang on 15/6/2.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "MediaSearchCollectionViewCell.h"

@implementation MediaSearchCollectionViewCell

- (void)awakeFromNib {
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [leftImage setImage:[UIImage imageNamed:@"search_leftview.png"]];
    [_tfSearch setLeftView:leftImage];
    _tfSearch.leftViewMode = UITextFieldViewModeAlways;
}


@end
