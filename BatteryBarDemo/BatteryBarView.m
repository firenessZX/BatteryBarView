//
//  BatteryBarView.m
//  BatteryBarDemo
//
//  Created by Nick on 2019/11/18.
//  Copyright © 2019 Dudian. All rights reserved.
//

#import "BatteryBarView.h"

@interface BatteryBarView ()

/// 电池框Layer
@property (strong, nonatomic) CAShapeLayer *batteryBoxLayer;
/// 电池正极Layer
@property (strong, nonatomic) CAShapeLayer *batteryPlusLayer;
///电量Layer
@property (strong, nonatomic) CAShapeLayer *batteryPowerLayer;
///电量路径
@property (strong, nonatomic) UIBezierPath *batteryPowerPath;

@end

@implementation BatteryBarView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self drawBatteryView];
        self.batteryPower = 0;
    }
    return self;
    
}

/// 画电池
- (void)drawBatteryView{
    
    CGFloat x = self.bounds.origin.x;
    CGFloat y = self.bounds.origin.y;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.lineWidth = 1.5f;
    ///画电池框
    UIBezierPath   *batteryBoxPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, width, height) cornerRadius:4.f];
    self.batteryBoxLayer = [CAShapeLayer layer];
    self.batteryBoxLayer.strokeColor = [UIColor grayColor].CGColor;
    self.batteryBoxLayer.fillColor = [UIColor clearColor].CGColor;
    self.batteryBoxLayer.lineWidth = self.lineWidth;
    self.batteryBoxLayer.path = batteryBoxPath.CGPath;
    [self.layer addSublayer:self.batteryBoxLayer];
    
    ///画电池的正极 +
    CGFloat batteryPlusHeight = self.bounds.size.height / 2;
    UIBezierPath    *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x + width + 1.f, (y + height - batteryPlusHeight)/2.0 , 2.f, batteryPlusHeight) cornerRadius:batteryPlusHeight / 2];
    self.batteryPlusLayer = [CAShapeLayer layer];
    self.batteryPlusLayer.strokeColor = [UIColor grayColor].CGColor;
    self.batteryPlusLayer.fillColor = [UIColor grayColor].CGColor;
    self.batteryPlusLayer.lineWidth = 2.f;
    self.batteryPlusLayer.path = path2.CGPath;
    [self.layer addSublayer:self.batteryPlusLayer];
    [self.layer addSublayer:self.batteryPowerLayer];
    self.batteryPowerLayer.path = self.batteryPowerPath.CGPath;
}

#pragma mark  ——————————设置线宽——————————
-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.batteryBoxLayer.lineWidth = _lineWidth;
}

#pragma mark  ——————————设置线的颜色——————————
-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.batteryBoxLayer.strokeColor = _lineColor.CGColor;
}

#pragma mark  ——————————设置电池填充色——————————
-(void)setBatteryFillColor:(UIColor *)batteryFillColor{
    _batteryFillColor = batteryFillColor;
    self.batteryPowerLayer.fillColor = _batteryFillColor.CGColor;
}

#pragma mark  ——————————设置电池正极的背景颜色——————————
-(void)setBatteryPlusColor:(UIColor *)batteryPlusColor{
    _batteryPlusColor = batteryPlusColor;
    self.batteryPlusLayer.strokeColor = _batteryPlusColor.CGColor;
    self.batteryPlusLayer.fillColor = _batteryPlusColor.CGColor;
}

/// 电量路径
-(UIBezierPath *)batteryPowerPath{
    if (!_batteryPowerPath) {
        _batteryPowerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1.5f, 1.5f, self.bounds.size.width - 3.f, self.bounds.size.height - 3.f) cornerRadius:4.f];
    }
    return _batteryPowerPath;
}

/// 电量Layer
-(CAShapeLayer *)batteryPowerLayer{
    if (!_batteryPowerLayer) {
        _batteryPowerLayer = [CAShapeLayer layer];
        _batteryPowerLayer.fillColor = UIColor.blackColor.CGColor;
    }
    return _batteryPowerLayer;
}

- (void)setBatteryPower:(NSUInteger)batteryPower{
    
    _batteryPower = batteryPower;
        
    if (batteryPower >= 0 && batteryPower <=100) {

        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        basicAnimation.duration = 0.5;
        basicAnimation.fillMode = kCAFillModeForwards;
        basicAnimation.fromValue = @(0);
        basicAnimation.toValue = @(_batteryPower / 100.0);
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.repeatCount = 1;
        basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [self.batteryPowerLayer addAnimation:basicAnimation forKey:@"Animation"];
    }

}


@end
