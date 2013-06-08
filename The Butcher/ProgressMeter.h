//
//  ProgressMeter.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ProgressMeter : UIView

@property (nonatomic) int step;
@property (nonatomic, strong) CAShapeLayer *cirkel;
@property (nonatomic, strong) UILabel *lblTotalSteps;
@property (nonatomic, strong) UILabel *lblCurrentStep;

-(void)gotoStep:(int)step;

@end
