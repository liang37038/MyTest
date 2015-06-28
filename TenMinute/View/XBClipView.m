//
//  XBClipView.m
//  TenMinute
//
//  Created by sasukiliang on 15/5/25.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBClipView.h"

@implementation XBClipView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupDefault];
    }
    
    return self;
}

-(void)setupDefault{
    [self setBackgroundColor:[UIColor ccColorWithHex:0x333333]];
    [self setUserInteractionEnabled:YES];
    [self setClipsToBounds:YES];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = nil;
    NSArray *childViews = [self.scrollView subviews];
    for (NSUInteger i = 0; i < childViews.count; i++) {
        CGRect childFrame = [[childViews objectAtIndex:i] frame];
        CGRect scrollFrame = self.scrollView.frame;
        CGPoint contentOffset = self.scrollView.contentOffset;
        if (childFrame.origin.x + scrollFrame.origin.x < point.x + contentOffset.x &&
            point.x + contentOffset.x < childFrame.origin.x + scrollFrame.origin.x + childFrame.size.width &&
            childFrame.origin.y + scrollFrame.origin.y < point.y + contentOffset.y &&
            point.y + contentOffset.y < childFrame.origin.y + scrollFrame.origin.y + childFrame.size.height
            ){
            hitView = [childViews objectAtIndex:i];
            return hitView;
        }
    }
    hitView = [super hitTest:point withEvent:event];
    if (hitView == self)
        return self.scrollView;
    return hitView;
}

@end
