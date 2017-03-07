//
//  ViewController.m
//  chartViewGradient
//
//  Created by 帅 on 2017/3/7.
//  Copyright © 2017年 YX. All rights reserved.
//

#import "ViewController.h"
#import "YXHeartLineChartView.h"
#import "UIColor+Change.h"
@interface ViewController ()

@property (nonatomic,strong)  YXHeartLineChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithHex:0Xf88d8d];
    _chartView = [[YXHeartLineChartView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height-100)];
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
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithHex:0X70b3e8] CGColor], (id)[[UIColor colorWithHex:0X7994ed] CGColor], nil];
    gradient.locations = @[@0.6];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0,1.0);

    [self.view.layer insertSublayer:gradient atIndex:0];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
