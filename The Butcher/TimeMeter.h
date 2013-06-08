//
//  TimeMeter.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 8/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TimeMeter : UIView

@property (nonatomic, strong) UILabel *lblTime;
@property (nonatomic, strong) CAShapeLayer *cirkel;

-(void)setTimeInSeconds:(int)timeInSeconds;

@end
