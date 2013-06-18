//
//  ProgressMeter.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ProgressMeter.h"

@implementation ProgressMeter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        CGRect rect = frame;
        
        
        self.cirkel = [CAShapeLayer layer];
        
        UIBezierPath *bezPath = [UIBezierPath bezierPathWithOvalInRect:rect];
        CGAffineTransform translate = CGAffineTransformMakeTranslation(-1 * (rect.origin.x + (rect.size.width / 2)), -1 * (rect.origin.y + (rect.size.height / 2)));
        [bezPath applyTransform:translate];
        
        CGAffineTransform rotate = CGAffineTransformMakeRotation(-1.57057);
        [bezPath applyTransform:rotate];
        
        translate = CGAffineTransformMakeTranslation(20, 20);
        [bezPath applyTransform:translate];
        
        CGPathRef path = bezPath.CGPath;
        
        self.cirkel.path = path;
        self.cirkel.strokeColor = [UIColor whiteColor].CGColor;
        self.cirkel.fillColor = [UIColor clearColor].CGColor;
        self.cirkel.lineWidth = 2;
        self.cirkel.lineCap = kCALineCapSquare;
        self.cirkel.lineJoin = kCALineJoinRound;
        self.cirkel.strokeStart = 0;
        self.cirkel.strokeEnd = 0;
        
        [self.layer addSublayer:self.cirkel];
        
        
        CAShapeLayer *lijn = [CAShapeLayer layer];
        UIBezierPath *lijnpath = [UIBezierPath bezierPath];
        [lijnpath moveToPoint:CGPointMake(10, 30)];
        [lijnpath addLineToPoint:CGPointMake(30, 10)];
        lijn.path = lijnpath.CGPath;
        lijn.strokeColor = [UIColor whiteColor].CGColor;
        lijn.lineWidth = 2;
        [self.layer addSublayer:lijn];
        
        
        self.lblTotalSteps = [[UILabel alloc] initWithFrame:CGRectMake(23, 19, 20, 20)];
        self.lblTotalSteps.backgroundColor = [UIColor clearColor];
        self.lblTotalSteps.font = [UIFont fontWithName:@"Franchise" size:19];
        self.lblTotalSteps.textColor = [UIColor whiteColor];
        self.lblTotalSteps.text = @"6";
        [self addSubview:self.lblTotalSteps];
        
        self.lblCurrentStep = [[UILabel alloc] initWithFrame:CGRectMake(11, 5, 20, 20)];
        self.lblCurrentStep.backgroundColor = [UIColor clearColor];
        self.lblCurrentStep.font = [UIFont fontWithName:@"Franchise" size:19];
        self.lblCurrentStep.textColor = [UIColor whiteColor];
        [self addSubview:self.lblCurrentStep];
        
    }
    return self;
}

-(void)gotoStep:(int)step{
    double from = ((step - 1)*0.16667);
    double to = (step*0.16667);
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fromValue = [[NSNumber alloc] initWithDouble:from];
    anim.toValue = [[NSNumber alloc] initWithDouble:to];
    anim.duration = 2;
    
    self.cirkel.strokeEnd = to;
    [self.cirkel addAnimation:anim forKey:@"strokeEnd"];
    
    self.lblCurrentStep.text = [NSString stringWithFormat:@"%d",step];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
