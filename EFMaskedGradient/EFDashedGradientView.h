//
//  EFDashedGradientView.h
//  EFMaskedGradient
//
//  Created by Eric Freitas on 5/24/15.
//  Copyright (c) 2015 Eric Freitas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EFDashedGradientView : UIView

// The length of one period (on then off) of the dashed line.
@property (nonatomic) CGFloat dashPeriod;
// The ratio of how much of the period is dash. Valid values are 0.0 to 1.0
@property (nonatomic) CGFloat dashWorkingDuty;

@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;

@end
