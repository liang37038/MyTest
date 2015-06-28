//
//  UIColor+Custom_Hex.h
//  CCDemo
//
//  Created by 许 强 on 13-6-29.
//  Copyright (c) 2013年 许 强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CCCustom_Hex)

/**
 * @brief 通过十六进制配置颜色,
 * @param hexValue:十六进制数值,例如0x00AA00
 * @param alphaValue:透明度0~1.0 0为全透明,1为不透明
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/**
 * @brief 通过十六进制配置颜色,透明度为1
 * @param hexValue:十六进制数值,例如0x00AA00
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue;

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex;

/** 带透明度的白色,在配置某些背景时使用 */
+ (UIColor*)ccWhiteColorWithAlpha:(CGFloat)alphaValue;

/** 带透明度的黑色,在配置某些背景时使用 */
+ (UIColor*)ccBlackColorWithAlpha:(CGFloat)alphaValue;

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue;

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue a:(CGFloat)alpha;

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 * @param alpha:透明度
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex alpha:(CGFloat)alpha;

@end

