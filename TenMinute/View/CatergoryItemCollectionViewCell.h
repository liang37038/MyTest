//
//  CatergoryItemCollectionViewCell.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/23.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatergoryItemCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellType;
@property (weak, nonatomic) IBOutlet UILabel *cellDesc;
@property (weak, nonatomic) IBOutlet UIImageView *cellPic;

@end
