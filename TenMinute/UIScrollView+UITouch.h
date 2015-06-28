//
//  UIScrollView+UITouch.h
//  TenMinute
//
//  Created by sasukiliang on 15/5/28.
//  Copyright (c) 2015年 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIScrollView(UITouch)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
