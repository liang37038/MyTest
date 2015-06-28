//
//  NavigationView.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/20.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AUIAnimatableLabel.h"

@class NavigationView;

@protocol NavigationViewDelegate <NSObject>

-(NSInteger)numberOfItemCount;

-(UIView *)navigationView:(NavigationView *)view viewOnIndex:(NSInteger)index;

-(void)navigationView:(NavigationView *)view didSelectedItemOnIndex:(NSInteger)index;

-(void)navigationView:(NavigationView *)view didScrollOffset:(CGFloat)offset;

@end

typedef enum{
    DragLeft = 1,
    DragRight,
    DragStop
}DragDirection;


@interface NavigationView : UIScrollView<UIScrollViewDelegate>

@property(strong,nonatomic) NSArray *navigationTitles;

@property(strong,nonatomic) id<NavigationViewDelegate> navigationViewDelegate;

@property(assign,nonatomic) NSInteger navigationIndex;

@property(assign,nonatomic) NSInteger index;

@property(assign,nonatomic) DragDirection direction;

-(void)setCurrentPage:(NSInteger )index;

-(void)changeFontSizeOfIndex:(NSInteger)index;

-(void)reloadData;

-(void)changeNavigationOffset:(CGFloat)offset;


@end
