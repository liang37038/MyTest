//
//  XBSearchTextField.m
//  TenMinute
//
//  Created by sasukiliang on 15/6/3.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import "XBSearchTextField.h"

const NSInteger LeftViewSize = 18;
const NSInteger offset = 10;

@implementation XBSearchTextField

-(void)awakeFromNib{
    
    [self setBackground:[UIImage imageNamed:@"search_bg.png"]];
    
}

//设置leftView Frame
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    
    CGRect leftIConRect = CGRectInset(CGRectMake(
                                                 (bounds.size.height - LeftViewSize),
                                                 (bounds.size.height - LeftViewSize)/2,
                                                 LeftViewSize, LeftViewSize), 0, 0);
    
    return leftIConRect;
}

//设置 编辑框Frame
-(CGRect)textRectForBounds:(CGRect)bounds{
    
    CGRect oldRect = [super textRectForBounds:bounds];
    
    oldRect.origin.x += offset;
    
    return oldRect;
}
//设置 编辑中的Frame
-(CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect oldRect = [super editingRectForBounds:bounds];
    
    oldRect.origin.x += offset;
    
    return oldRect;
}



@end
