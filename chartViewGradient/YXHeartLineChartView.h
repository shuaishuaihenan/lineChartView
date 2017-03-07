//
//  YXHeartLineChartView.h
//  fitness
//
//  Created by 帅 on 2017/2/8.
//  Copyright © 2017年 YunXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXHeartLineChartView : UIView

@property(nonatomic,strong) NSArray * pointArray;//数据坐标
@property(nonatomic,strong) NSArray * unitxArray;//数据坐标
@property(nonatomic,strong) NSArray * unityArray;//数据坐标


@property(nonatomic,assign)float everHeight;//纵坐标间距
@property(nonatomic,assign)float AllWidth;//坐标
@property(nonatomic,assign)float AllHeight;//坐标

@property(nonatomic)CGPoint startPointx;//虚线起点
@property(nonatomic)CGPoint endPointx;//虚线终点
@property(nonatomic)CGPoint startPointy;//虚线起点
@property(nonatomic)CGPoint endPointy;//虚线终点


@property(nonatomic,strong)UIColor *coorLineColor;//坐标颜色
@property(nonatomic,strong)UIColor *coorColor;//坐标颜色
@property(nonatomic,strong)UIColor *lineColor;//虚线颜色


@property(nonatomic,strong) UILabel * lbTitle;//标题
@property(nonatomic,strong) UILabel * lbUnitX;//单位
@property(nonatomic,strong) UILabel * lbUnitY;//单位

- (void)reDrawChartLine;

@end
