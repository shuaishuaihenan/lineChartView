//
//  YXHeartLineChartView.m
//  fitness
//
//  Created by 帅 on 2017/2/8.
//  Copyright © 2017年 YunXiang. All rights reserved.
//

#import "YXHeartLineChartView.h"

#import "UIColor+Change.h"

#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width

#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define HFont(A) (IPhone5 ? 0.8515 : (IPhone6 ? 1.0000 : (IPhone6p ? 1.1034 : 1.0000))) * (A)

@implementation YXHeartLineChartView

- (id)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    
    if(self) {
        
        [self selfViewSetting];

    }
    
    return self;
}

-(void)selfViewSetting{
    
    self.AllWidth  = self.frame.size.width-40;
    
    self.AllHeight = self.frame.size.height-5;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.coorColor       = [UIColor colorWithHex:0Xf5c1c1];
    
    self.lineColor       = [UIColor whiteColor];
    
    self.coorLineColor   = [UIColor colorWithHex:0Xf5c1c1];
    
    self.startPointx = CGPointMake(40, self.AllHeight);//x轴
    
    self.endPointx   = CGPointMake(DEVICE_WIDTH-10, self.AllHeight);
    
    self.startPointy = CGPointMake(40, self.AllHeight);//y轴
    
    self.endPointy   = CGPointMake(40, 20);
    
}
- (void)reDrawChartLine
{
    for (UIView *views in self.subviews) {
        
        [views removeFromSuperview];
        
    }
    [self setNeedsDisplay];
    
    [self layoutIfNeeded];
    
}
- (void)drawRect:(CGRect)rect
{
    
    self.everHeight = [[self.unityArray objectAtIndex:1] floatValue]-[[self.unityArray objectAtIndex:0] floatValue];
    
    /*---------------------------坐标轴--------------------------------*/
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    
    CGContextSetLineWidth(context,1);//线宽度
    
    CGContextSetStrokeColorWithColor(context,self.coorColor.CGColor);
    
    //x轴
    CGContextMoveToPoint(context,self.startPointx.x,self.startPointx.y);
    
    CGContextAddLineToPoint(context,self.endPointx.x,self.endPointx.y);
    
    //y轴
    CGContextMoveToPoint(context,self.startPointy.x,self.startPointy.y);
    
    CGContextAddLineToPoint(context,self.endPointy.x,self.endPointy.y);
    
    CGContextMoveToPoint(context,40,self.AllHeight-3*(self.AllHeight)/self.unityArray.count);
    
    CGContextAddLineToPoint(context,self.endPointx.x,self.AllHeight-3*(self.AllHeight)/self.unityArray.count);
    
    CGContextMoveToPoint(context,40,self.AllHeight-5*(self.AllHeight)/self.unityArray.count);
    
    CGContextAddLineToPoint(context,self.endPointx.x,self.AllHeight-5*(self.AllHeight)/self.unityArray.count);
    
    
    CGContextStrokePath(context);
    
    CGContextClosePath(context);
    
    
    /*---------------------------坐标单位--------------------------------*/
    for (int i = 0; i<self.unitxArray.count; i++) {
        
        UILabel * lbX = [[UILabel alloc]initWithFrame:CGRectMake(0,0, (self.AllWidth-10)/self.pointArray.count, 20)];
        
        lbX.center = CGPointMake(40+i*(self.AllWidth-10)/self.pointArray.count, self.AllHeight+15);
        
        lbX.text = [self.unitxArray objectAtIndex:i];
        
        [lbX setTextAlignment:NSTextAlignmentCenter];
        
        lbX.font = [UIFont systemFontOfSize:HFont(10)];
        
        lbX.textColor = [UIColor whiteColor];
        
        [self addSubview:lbX];
    }
    
    for (int i = 0; i<self.unityArray.count; i++) {
        
        UILabel * lbY = [[UILabel alloc]initWithFrame:CGRectMake(10, self.AllHeight-i*(self.AllHeight)/self.unityArray.count-5, 30, 20)];
        lbY.font = [UIFont systemFontOfSize:HFont(12)];
        [lbY setTextAlignment:NSTextAlignmentRight];
        lbY.text = [self.unityArray objectAtIndex:i];
        [lbY sizeToFit];
        lbY.textColor = [UIColor whiteColor];
        if (i >0) {
            [self addSubview:lbY];
        }
    }
    /*---------------------------数据点--------------------------------*/
    
    
    for (int i = 0; i<self.pointArray.count; i++) {
        int values = [[self.pointArray objectAtIndex:i] intValue];
        if (values == 0) {
            continue;
        }
        UIView *views = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 4)];
        views.center = CGPointMake(40+i*(self.AllWidth-10)/self.pointArray.count, self.AllHeight-[[self.pointArray objectAtIndex:i] intValue]*(self.AllHeight)/self.unityArray.count/self.everHeight);
        views.layer.cornerRadius = 2;
        views.layer.masksToBounds = YES;
        views.backgroundColor = [UIColor whiteColor];
        [self addSubview:views];
    }
    
    CGContextRef contextData1 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextData1,self.lineColor.CGColor);//设置颜色
    
    CGFloat lengthsData1[] = {4,0};//先画4个点再画2个点
    CGContextSetLineDash(contextData1,0, lengthsData1,2);//代表虚线
    
    CGContextSetLineWidth(contextData1, 0.5);
    //总高度-剩下的高度
    CGFloat floatY0 = self.AllHeight-[[self.pointArray objectAtIndex:0] intValue]*(self.AllHeight)/self.unityArray.count/self.everHeight;
    CGContextMoveToPoint(contextData1, 40, floatY0);//起始点
    
    for (int i = 0; i<self.pointArray.count; i++) {
        
        int values = [[self.pointArray objectAtIndex:i] intValue];
        CGFloat X = (self.AllWidth-10)/self.pointArray.count;
        CGFloat floatX = 40+i*X;
        CGFloat floatY = self.AllHeight-values*(self.AllHeight)/self.unityArray.count/self.everHeight;
        CGContextAddCurveToPoint(contextData1, floatX-X*2/3, floatY0, floatX-X*1/3, floatY, floatX, floatY);//控制点1  控制点2  数据点
        floatY0 = self.AllHeight-values*(self.AllHeight)/self.unityArray.count/self.everHeight;

    }
    /*---------------------------填充颜色--------------------------------*/
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGFloat colors[] =
    {
        1,1,1, 0.5,
        
        1,1,1, 0.01,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    CGContextRef contextFull = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextFull,[UIColor clearColor].CGColor);//设置颜色
    
    CGContextSaveGState(contextFull);//new
    
    CGContextSetBlendMode(contextFull, kCGBlendModeOverlay);
    //开始一个起始路径
    CGContextMoveToPoint(contextFull, 40,self.AllHeight);//起点
    CGContextAddLineToPoint(contextFull, 40, self.AllHeight-[[self.pointArray objectAtIndex:0] intValue]*(self.AllHeight)/self.unityArray.count/self.everHeight);
    CGContextAddLineToPoint(contextFull, 40+(self.pointArray.count-1)*(self.AllWidth-10)/self.pointArray.count, self.AllHeight-[[self.pointArray objectAtIndex:self.pointArray.count-1] intValue]*(self.AllHeight)/self.unityArray.count/self.everHeight);
    CGContextAddLineToPoint(contextFull, 40+(self.pointArray.count-1)*(self.AllWidth-10)/self.pointArray.count, self.AllHeight);
    
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = 40;
         myStartPoint.y = self.AllHeight-[[self.pointArray valueForKeyPath:@"@max.intValue"] intValue]*(self.AllHeight)/self.unityArray.count/self.everHeight;
    myEndPoint.x = 40;
    myEndPoint.y = self.AllHeight;
    
    CGContextClip(contextFull);//new
    CGContextDrawLinearGradient(contextFull, gradient, myStartPoint, myEndPoint, kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(contextFull);
    
    // if animation style is wave, we got to do other jobs later
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
