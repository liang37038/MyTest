//
//  UIColor+Custom_Hex.m
//  CCDemo
//
//  Created by 许 强 on 13-6-29.
//  Copyright (c) 2013年 许 强. All rights reserved.
//

#import "UIColor+CCCustom_Hex.h"

@implementation UIColor (CCCustom_Hex)

/**
 * @brief 通过十六进制配置颜色,
 * @param hexValue:十六进制数值,例如0x00AA00
 * @param alphaValue:透明度0~1.0 0为全透明,1为不透明
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

/**
 * @brief 通过十六进制配置颜色,透明度为1
 * @param hexValue:十六进制数值,例如0x00AA00
 */
+ (UIColor*)ccColorWithHex:(NSInteger)hexValue {
    return [UIColor ccColorWithHex:hexValue alpha:1.0];
}

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 * @param alpha:透明度
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex alpha:(CGFloat)alpha {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

/**
 * @brief 通过十六进制字符串配置颜色,透明度为1
 * @param hex:十六进制数值字符串,例如0x00AA00
 */
+ (UIColor*)ccColorWithHexString:(NSString*)hex {
    return [[self class] ccColorWithHexString:hex alpha:1.0];
}

/** 带透明度的白色,在配置某些背景时使用 */
+ (UIColor*)ccWhiteColorWithAlpha:(CGFloat)alphaValue {
    return [UIColor ccColorWithHex:0xffffff alpha:alphaValue];
}

/** 带透明度的黑色,在配置某些背景时使用 */
+ (UIColor*)ccBlackColorWithAlpha:(CGFloat)alphaValue {
    return [UIColor ccColorWithHex:0x000000 alpha:alphaValue];
}

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue {
    return [[self class] ccColorWithR:red g:green b:blue a:1.0];
}

// 通过RGBA获取颜色,注意,rgba都是NSInteger,非NSFloat
+ (UIColor *)ccColorWithR:(NSInteger)red g:(NSInteger)green b:(NSInteger)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end