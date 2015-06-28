//
//  FunnyTableViewCell1.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/21.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "FunnyTableViewCell1.h"

@implementation FunnyTableViewCell1
{
    StyledPageControl *pageControl;
}

- (void)awakeFromNib {
    [_scrollView setBounces:YES];
    [_scrollView setDelegate:self];
    [_scrollView setPagingEnabled:YES];
    [_scrollView setAlwaysBounceHorizontal:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setAutoresizesSubviews:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setPicArray:(NSArray *)picArray{

    //设置滑动图
    _picArray = picArray;
    for (int i = 0; i < [_picArray count]; i++) {
        UIImage *image = [UIImage imageNamed:[_picArray objectAtIndex:i]];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * [[UIScreen mainScreen]bounds].size.width, 0, [[UIScreen mainScreen]bounds].size.width, self.frame.size.height)];
        [imageView setImage:image];
        [_scrollView addSubview:imageView];
    }
    
    [_scrollView setContentSize:CGSizeMake([_picArray count] * [[UIScreen mainScreen]bounds].size.width, _scrollView.frame.size.height)];
    
    //设置PageControl
    pageControl = [[StyledPageControl alloc]initWithFrame:CGRectMake(0, _scrollView.frame.size.height+1, self.frame.size.width, 10)];
    [pageControl setUserInteractionEnabled:NO];
    [pageControl setPageControlStyle:PageControlStyleDefault];
    [pageControl setNumberOfPages:(int)[_picArray count]];
    [self.contentView addSubview:pageControl];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前索引
    int index = round( _scrollView.contentOffset.x / _scrollView.frame.size.width);
    [pageControl setCurrentPage:index];
}

@end
