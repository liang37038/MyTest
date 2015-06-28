//
//  TouchDemoView.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/27.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "TouchDemoView.h"

static CGFloat originWidth = 320;

const void* _ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET = &_ARSEGMENTPAGE_CURRNTPAGE_SCROLLVIEWOFFSET;

@implementation TouchDemoView
{
    CGFloat lastOffsetY;
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    NSLayoutConstraint *headerHeightConstraint;
    NSLayoutConstraint *headerPicMarginTopConstraint;
    NSLayoutConstraint *headerTitleMarginTopConstraint;
    
    UIImageView *ivHeaderPic;
    UILabel *lbTitle;
    UILabel *lbDesc;
}

-(instancetype)init{
    
    if (self = [super init]) {
        [self configDefault];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self configDefault];
        
        _headerView = [[UIView alloc]init];
        [_headerView setClipsToBounds:YES];
        
        lbTitle = [[UILabel alloc]init];
        lbDesc = [[UILabel alloc]init];
        [lbTitle setTextColor:[UIColor whiteColor]];
        [lbTitle setFont:[UIFont systemFontOfSize:20]];
        [lbDesc setTextColor:[UIColor whiteColor]];
        [lbDesc setFont:[UIFont systemFontOfSize:14]];
        
        ivHeaderPic = [[UIImageView alloc]init];
        [ivHeaderPic setContentMode:UIViewContentModeScaleAspectFill];
        
        [_headerView addSubview:ivHeaderPic];
        [_headerView addSubview:lbTitle];
        [_headerView addSubview:lbDesc];
        
        
        [_headerView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [ivHeaderPic setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [lbTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
        [lbDesc setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

-(void)setXbScrollView:(UIScrollView *)xbScrollView{
    if (_xbScrollView) {
        [_xbScrollView removeFromSuperview];
    }
    
    if (_headerView) {
        [_headerView removeFromSuperview];
    }
    
    _xbScrollView = xbScrollView;
    [_xbScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_xbScrollView];
    [self addSubview:_headerView];
}

-(void)moveUpWithOffset:(CGFloat)offset{
    
    CGFloat deltaY = offset - lastOffsetY;
    if(deltaY != _headerHeight){
        CGFloat deltaOffset = deltaY/2;
        
        if(headerPicMarginTopConstraint.constant + deltaOffset >= 0){
            headerPicMarginTopConstraint.constant = 0;
        }else{
            headerPicMarginTopConstraint.constant = headerPicMarginTopConstraint.constant + deltaOffset;
            headerTitleMarginTopConstraint.constant = headerTitleMarginTopConstraint.constant +deltaOffset;
            
            CGFloat deltaAlpha =  deltaY/(offset - 34);
            
            if (headerTitleMarginTopConstraint.constant < 34) {
                headerTitleMarginTopConstraint.constant = 34;
                
            }else if(headerTitleMarginTopConstraint.constant > 80){
                headerTitleMarginTopConstraint.constant = 80;
            }else{
                [lbDesc setAlpha:lbDesc.alpha + deltaAlpha];
                if(lbDesc.alpha > 1){
                    [lbDesc setAlpha:1];
                }
                if(lbDesc.alpha < 0){
                    [lbDesc setAlpha:0];
                }
            }
        }
    }
    
    lastOffsetY = offset;
}

-(void)configDefault{
    _headerHeight = 200;
}

-(void)layoutSubviews{
    [self configLayout];
}

-(void)configLayout{
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    [self setHeaderHeight: (screenWidth * _headerHeight / originWidth)];
    
    if (self.title) {
        [lbTitle setText:self.title];
    }
    
    if (self.desc) {
        [lbDesc setText:self.desc];
    }
    
    if (self.headerPic) {
        [ivHeaderPic setImage:[UIImage imageNamed:self.headerPic]];
    }
    
    //设置头部
    [self configHeaderView];
    //设置头部背景
    [self configHeaderPic];
    
    [self configLabel];
    
    //设置列表
    [self configTableView];
}

-(void)configHeaderView{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTopMargin multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeLeadingMargin relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeadingMargin multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeTrailingMargin relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailingMargin multiplier:1 constant:0]];
    
    headerHeightConstraint =[NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:_headerHeight];
    
    [_headerView addConstraint: headerHeightConstraint];
}

-(void)configLabel{
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:lbTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    headerTitleMarginTopConstraint =[NSLayoutConstraint constraintWithItem:lbTitle attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTopMargin multiplier:1 constant:80];
    [_headerView addConstraint:headerTitleMarginTopConstraint];
    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:lbDesc attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:lbDesc attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:lbTitle attribute:NSLayoutAttributeBottom multiplier:1 constant:20]];
}

-(void)configHeaderPic{
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:ivHeaderPic attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    headerPicMarginTopConstraint = [NSLayoutConstraint constraintWithItem:ivHeaderPic attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTopMargin multiplier:1 constant:0];
    
    [_headerView addConstraint:headerPicMarginTopConstraint];
    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:ivHeaderPic attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeLeftMargin multiplier:1 constant:0]];
    [ivHeaderPic addConstraint:[NSLayoutConstraint constraintWithItem:ivHeaderPic attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:_headerHeight]];
}

-(void)configTableView{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_xbScrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_xbScrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_xbScrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_xbScrollView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:0]];
    
    [_xbScrollView setContentInset:UIEdgeInsetsMake(_headerHeight, 0, 0, 0)];
    [_xbScrollView setContentOffset:CGPointMake(0, -_headerHeight)];
    
}

@end
