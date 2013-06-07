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
        
        self.cirkel = [CAShapeLayer layer];
        self.cirkel.path = [UIBezierPath bezierPathWithOvalInRect:frame].CGPath;
        self.cirkel.strokeColor = [UIColor blackColor].CGColor;
        self.cirkel.fillColor = [UIColor clearColor].CGColor;
        self.cirkel.lineWidth = 3;
        self.cirkel.lineCap = kCALineCapRound;
        self.cirkel.lineJoin = kCALineJoinRound;
        self.cirkel.strokeStart = 0;
        self.cirkel.strokeEnd = 0.5;
        
        [self.layer addSublayer:self.cirkel];
        
        [self animate];
        
    }
    return self;
}

-(void)animate{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fromValue = @0;
    anim.toValue = @1;
    anim.duration = 2;
    
    [self.cirkel addAnimation:anim forKey:@"strokeEnd"];
    
    //self.cirkel.strokeEnd = 1;
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
