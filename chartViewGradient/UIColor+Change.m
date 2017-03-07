//
//  UIColor+Change.m
//  UIColor和16进制色值相互转换
//
//  Created by go  on 16/4/1.
//  Copyright © 2016年 Sherman. All rights reserved.
//

#import "UIColor+Change.h"

@implementation UIColor (Change)

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (NSString *)hexFromUIColor:(UIColor *)color
{
    if (CGColorGetNumberOfComponents(color.CGColor) < 4)
    {
        const CGFloat *components = CGColorGetComponents(color.CGColor);

        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB)
    {
        return [NSString stringWithFormat:@"FFFFFF"];
    }
    
    int r =(int)((CGColorGetComponents(color.CGColor))[0]*255.0);
    int g =(int)((CGColorGetComponents(color.CGColor))[1]*255.0);
    int b =(int)((CGColorGetComponents(color.CGColor))[2]*255.0);
    
    
    return [NSString stringWithFormat:@"%@%@%@",[self tenToHexNum:r],[self tenToHexNum:g],[self tenToHexNum:b]];
}
+ (NSString *)tenToHexNum:(NSInteger) ten
{
    NSString * str = nil ;
    NSString * tempStr = [[NSString alloc]initWithFormat:@"%lx",(long)ten];
    if (tempStr)
    {
        if (tempStr.length == 1)
        {
            str = [NSString stringWithFormat:@"0%@",tempStr];
        }
        else if (tempStr.length >= 2)
        {
            str = tempStr;
        }
    }
    return str;
}
@end
