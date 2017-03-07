//
//  UIColor+Change.h
//  UIColor和16进制色值相互转换
//
//  Created by go  on 16/4/1.
//  Copyright © 2016年 Sherman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Change)
/**
 *  16进制RGB值转换成UIColor对象
 *
 *  @param hexValue 0x开头 16进制数
 *  @param alphaValue 透明度
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
/**
 *  16进制RGB值转换成UIColor对象
 *
 *  @param hexValue 0x开头16进制数
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;
/**
 *  UIColor对象转换成16进制字符串
 *
 *  @param color UIColor对象
 *
 *  @return 16进制字符串
 */
+ (NSString *)hexFromUIColor:(UIColor *)color;

@end
