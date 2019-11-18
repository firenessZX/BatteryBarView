//
//  BatteryBarView.h
//  BatteryBarDemo
//
//  Created by Nick on 2019/11/18.
//  Copyright © 2019 Dudian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///----------------------------用贝塞尔曲线和CAShaperLayer自定义电池条--------------------///

@interface BatteryBarView : UIView
///线宽 默认 1.5
@property (assign, nonatomic) CGFloat lineWidth;

/// 线的颜色
@property (strong, nonatomic) UIColor *lineColor;

/// 电池填充色
@property (strong, nonatomic) UIColor *batteryFillColor;

/// 电池正极颜色
@property (strong, nonatomic) UIColor *batteryPlusColor;

///电量 0 - 100
@property (assign, nonatomic) NSUInteger batteryPower;

@end

NS_ASSUME_NONNULL_END
