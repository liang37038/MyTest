//
//  PlayItemTableViewCell.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/23.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *playPic;
@property (weak, nonatomic) IBOutlet UILabel *playTitle;
@property (weak, nonatomic) IBOutlet UILabel *playDesc;

@end
