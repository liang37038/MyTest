//
//  FunnyObject.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    TYPE1,
    TYPE2,
    TYPE3
}FunnyType;

@interface FunnyObject : NSObject

@property(assign,nonatomic) FunnyType funnyType;

@property(strong,nonatomic) NSArray *images;

@property(strong,nonatomic) NSString *userPic;
@property(strong,nonatomic) NSString *pic;
@property(strong,nonatomic) NSString *category;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *desc;
@property(assign,nonatomic) NSInteger hot;

@property(strong,nonatomic) NSDate *pubDate;

@end
