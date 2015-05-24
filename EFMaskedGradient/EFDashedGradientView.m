//
//  EFDashedGradientView.m
//  EFMaskedGradient
//
//  Created by Eric Freitas on 5/24/15.
//  Copyright (c) 2015 Eric Freitas. All rights reserved.
//

#import "EFDashedGradientView.h"

@implementation EFDashedGradientView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat dashOnDuty = self.dashPeriod * self.dashWorkingDuty;
    
    // Create the outline path for the mask
    for (CGFloat idx = 0.; idx < height; idx += self.dashPeriod) {
        if (idx == 0.) {
            // move to start position
            [path moveToPoint:CGPointZero];
        } else {
            // add a line to the next loop start position
            [path addLineToPoint:CGPointMake(0., idx)];
        }
        // add a line to the right side
        [path addLineToPoint:CGPointMake(width, idx)];
        // add a line up the working duty distance
        [path addLineToPoint:CGPointMake(width, idx + dashOnDuty)];
        // add a line to the right
        [path addLineToPoint:CGPointMake(0., idx + dashOnDuty)];
    }
    [path addLineToPoint:CGPointZero];
    
    // Add the mask
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.fillColor = [[UIColor blackColor] CGColor];
    mask.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    mask.path = path.CGPath;
    
    // Add the gradient
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0.5, 0.0);
    gradient.endPoint = CGPointMake(0.5, 1.0);
    gradient.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    NSMutableArray *colors = @[(id)self.startColor.CGColor,
                               (id)self.endColor.CGColor].mutableCopy;
    gradient.colors = colors;
    gradient.locations = [NSArray arrayWithObjects:@0.0, @1.0, nil];
    
    [gradient setMask:mask];
    [self.layer addSublayer:gradient];
}




@end
