//
//  NavigationView.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/20.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "NavigationView.h"
#import "UIColor+CCCustom_Hex.h"

static CGFloat BigFontSize      = 18;
static CGFloat smallFontSize    = 13;

//默认占屏幕item数
static const NSInteger ITEM_COUNT = 3;

@implementation NavigationView
{
    CGFloat itemWidth;
    CGFloat itemHeight;
    
    BOOL draggingByHand;
    
    AUIAnimatableLabel *lastLabel;
    
    CGFloat lastContentOffset;
}

#pragma mark - INIT

-(instancetype)init{
    
    if ([super init]) {
        [self setupDefault:CGRectZero];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        [self setupDefault:frame];
    }
    
    return self;
}

-(void)setupDefault:(CGRect)originRect{
    itemWidth = [[UIScreen mainScreen]bounds].size.width/ITEM_COUNT;
    itemHeight = originRect.size.height;
    [self setBounces:YES];
    [self setPagingEnabled:YES];
    [self setAlwaysBounceHorizontal:YES];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    [self setDelegate:self];
    [self setAutoresizesSubviews:NO];
}

-(void)setupView{
    
    if ([_navigationViewDelegate respondsToSelector:@selector(numberOfItemCount)]) {
        
        NSInteger itemCount = [_navigationViewDelegate numberOfItemCount];
        
        for (int i = 0; i < itemCount; i ++) {
            
            if ([_navigationViewDelegate respondsToSelector:@selector(navigationView:viewOnIndex:)]) {
                UILabel *itemView =(UILabel *)[_navigationViewDelegate navigationView:self viewOnIndex:i];
                [itemView setUserInteractionEnabled:YES];
                CGRect itemRect = CGRectMake(i * itemWidth, 0, itemWidth, itemHeight);
                [itemView setFrame:UIEdgeInsetsInsetRect(itemRect, UIEdgeInsetsMake(25, 15, 5, 15))];
                UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectItemOnIndex:)];
                
                [itemView setTag:i];
                [itemView addGestureRecognizer:tapGesture];
                
                [self addSubview:itemView];
            }
        }
        self.clipsToBounds = NO;
        self.contentSize = CGSizeMake(itemWidth * itemCount, itemHeight);
    }
}

#pragma mark - 相关逻辑

-(void)setNavigationViewDelegate:(id<NavigationViewDelegate>)navigationViewDelegate{
    _navigationViewDelegate = navigationViewDelegate;
    [self reloadData];
}

//重设控件
-(void)reloadData{
    
    NSArray *subViews = [self subviews];
    
    for (UIView *subView in subViews) {
        [subView removeFromSuperview];
    }
    
    [self setupView];
}

-(void)changeNavigationOffset:(CGFloat)offset{
    self.contentOffset = CGPointMake(offset * itemWidth / [[UIScreen mainScreen]bounds].size.width, self.contentOffset.y);
}

//选中点击
-(void)selectItemOnIndex:(UITapGestureRecognizer *)gesture{
    UIView *viewOnTap = [gesture view];
    NSInteger index = [viewOnTap tag];
    
    [self setCurrentPage:index];
}

-(void)setCurrentPage:(NSInteger )index{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentOffset = CGPointMake(self.contentOffset.x + (index - self.navigationIndex)*self.frame.size.width, self.contentOffset.y);
    }];
    
    [self changeFontSizeOfIndex:index];
    
    [self setNavigationIndex:index];
    
    if ([_navigationViewDelegate respondsToSelector:@selector(navigationView:didSelectedItemOnIndex:)]) {
        [_navigationViewDelegate navigationView:self didSelectedItemOnIndex:index];
    }
    
}

-(void)changeFontSizeWithOffset:(CGFloat)offset{
    
    CGFloat fontSizeRatio = BigFontSize * offset/[[UIScreen mainScreen]bounds].size.width/3;
    
    AUIAnimatableLabel *currentLabel = [[self subviews]objectAtIndex:_navigationIndex];
    
    AUIAnimatableLabel *targetLabel = nil;
    
    //手指左滑
    if (offset > lastContentOffset) {
        
        CGFloat bigSize = smallFontSize + fontSizeRatio;
        
        CGFloat smallSize = BigFontSize - fontSizeRatio;
        
        if (bigSize >= BigFontSize) {
            bigSize = BigFontSize;
        }
        
        if (smallSize <= smallFontSize) {
            smallSize = smallFontSize;
        }
        
        if(_navigationIndex + 1 < [[self subviews]count]){
            targetLabel = [[self subviews]objectAtIndex:_navigationIndex + 1];
            
            UIFont *newSmallFont = [UIFont fontWithName:[currentLabel font].fontName size:smallSize];
            UIFont *newBigFont = [UIFont fontWithName:[targetLabel font].fontName size:bigSize];
            
            //目标字体放大
            targetLabel.font = newBigFont;
            //当前字体缩小
            currentLabel.font = newSmallFont;
        }
    }
}

//改变index位置的字体
-(void)changeFontSizeOfIndex:(NSInteger)index{
    
    AUIAnimatableLabel *currentLabel = [[self subviews]objectAtIndex:index];
    
    if(lastLabel){
        //缩小
        [UIView animateWithDuration:1.0 animations:^{
            UIFont *font = [lastLabel font];
            UIFont *newFont = [UIFont fontWithName:font.fontName size:smallFontSize];
            lastLabel.font = newFont;
        }];
    }
    //放大
    [UIView animateWithDuration:1.0 animations:^{
        UIFont *font = [currentLabel font];
        UIFont *newFont = [UIFont fontWithName:font.fontName size:BigFontSize];
        currentLabel.font = newFont;
    }];
    
    lastLabel = currentLabel;
}

#pragma mark - ScrollView Delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    draggingByHand = YES;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffset = scrollView.contentOffset.x;
    
//        [self changeFontSizeWithOffset:contentOffset];
    
    if (draggingByHand) {
        if ([_navigationViewDelegate respondsToSelector:@selector(navigationView:didScrollOffset:)]) {
            [_navigationViewDelegate navigationView:self didScrollOffset:contentOffset];
        }
    }
    
    lastContentOffset = contentOffset;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self setNavigationIndex:round(self.contentOffset.x / self.frame.size.width)];
    [self changeFontSizeOfIndex:round(self.contentOffset.x / self.frame.size.width)];
    draggingByHand = NO;
}

@end
