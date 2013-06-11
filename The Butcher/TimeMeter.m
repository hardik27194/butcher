//
//  TimeMeter.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 8/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "TimeMeter.h"

@implementation TimeMeter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.cirkel = [CAShapeLayer layer];
        
        UIBezierPath *bezPath = [UIBezierPath bezierPathWithOvalInRect:frame];
        CGAffineTransform translate = CGAffineTransformMakeTranslation(-1 * (frame.origin.x + (frame.size.width / 2)), -1 * (frame.origin.y + (frame.size.height / 2)));
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
        self.cirkel.strokeEnd = 1;
        
        [self.layer addSublayer:self.cirkel];
        
        
        self.lblTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 40, 20)];
        self.lblTime.font = [UIFont fontWithName:@"Franchise" size:20];
        self.lblTime.textAlignment = NSTextAlignmentCenter;
        self.lblTime.backgroundColor = [UIColor clearColor];
        self.lblTime.textColor = [UIColor whiteColor];
        

        [self addSubview:self.lblTime];
    }
    return self;
}

-(void)setTimeInSeconds:(int)timeInSeconds{
    int seconds = timeInSeconds % 60;
    int minutes = (timeInSeconds / 60) % 60;
    self.lblTime.text = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
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
