//
//  ViewController.m
//  EFMaskedGradient
//
//  Created by Eric Freitas on 5/24/15.
//  Copyright (c) 2015 Eric Freitas. All rights reserved.
//

#import "ViewController.h"
#import "EFDashedGradientView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    EFDashedGradientView *line = [[EFDashedGradientView alloc] initWithFrame:CGRectMake(20, 20, 10, 200)];
    line.dashPeriod = 15.0;
    line.dashWorkingDuty = 0.75;
    line.startColor = [UIColor greenColor];
    line.endColor = [UIColor blueColor];
    line.backgroundColor = [UIColor clearColor];
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
