# lineChartView
ChartView for color of gradient 背景颜色渐变的折线图
# Installation
import "YXHeartLineChartView.h"
import "UIColor+Change.h"
# Usage
初始化 x轴 点    _chartView.unitxArray
初始化 y轴 点    _chartView.unityArray
初始化 数据 点   _chartView.pointArray

      NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
      for (int i = 0; i <= 23; i ++ ) {
          [arr addObject:[NSString stringWithFormat:@"%d",i]];
      }
      _chartView.unitxArray = [arr copy];
      _chartView.unityArray = @[@"0",@"20",@"40",@"60",@"80",@"100",@"120",@"140",@"160"];
      NSMutableArray *arrPoint = [[NSMutableArray alloc]initWithCapacity:0];
      for (int i = 1; i <= 24; i ++ ) {
          [arrPoint addObject:[NSString stringWithFormat:@"%d",arc4random()%20 + 60]];
      }
      _chartView.pointArray = [arrPoint copy];

      [self.view addSubview:_chartView];
      
需要重新绘制调用

    [_chartView  reDrawChartLine];
    
