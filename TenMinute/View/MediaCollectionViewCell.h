//
//  MediaCollectionViewCell.h
//  TenMinute
//
//  Created by sasukiliang on 15/6/2.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivBackground;
@property (weak, nonatomic) IBOutlet UILabel *lbHot;
@property (weak, nonatomic) IBOutlet UILabel *lbDesc;

@end
