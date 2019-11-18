//
//  ViewController.m
//  BatteryBarDemo
//
//  Created by Nick on 2019/11/18.
//  Copyright © 2019 Dudian. All rights reserved.
//

#import "ViewController.h"
#import "BatteryBarView.h"
@interface ViewController ()

@property (weak, nonatomic) NSTimer  *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    BatteryBarView *barView = [[BatteryBarView alloc]initWithFrame:CGRectMake(40.f, 60.f, 40, 20)];
    barView.lineColor = UIColor.redColor;
    barView.batteryFillColor = UIColor.greenColor;
    barView.batteryPlusColor = UIColor.purpleColor;
    [self.view addSubview:barView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   BatteryBarView *barView = self.view.subviews.lastObject;
   barView.batteryPower = [self randomNumber];
   
}

- (void)randomBattery{
    
    
    
}

- (NSUInteger)randomNumber{
    
    return arc4random_uniform(100) + 1;
    
}


@end
