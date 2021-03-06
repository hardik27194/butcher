//
//  ExtraView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ExtraView.h"

@implementation ExtraView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        UIImage *btnDoneImg = [Util createImageFromPNG:@"btnDone" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        UIImage *btnDoneDownImg = [Util createImageFromPNG:@"btnDoneDown" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        self.btnDone = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnDoneImg.size.width/2), 210, btnDoneImg.size.width, btnDoneImg.size.height)];
        [self.btnDone setBackgroundImage:btnDoneImg forState:UIControlStateNormal];
        [self.btnDone setBackgroundImage:btnDoneDownImg forState:UIControlStateHighlighted];
        self.btnDone.alpha = 0.5;
        self.btnDone.userInteractionEnabled = NO;
        [self addSubview:self.btnDone];
        
        self.lblHoeveelheid = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width/2)-50, 10, 100, 20)];
        self.lblHoeveelheid.textAlignment = NSTextAlignmentCenter;
        self.lblHoeveelheid.font = [UIFont fontWithName:@"LinLibertine" size:20];
        self.lblHoeveelheid.text = @"0/5";
        [self addSubview:self.lblHoeveelheid];
        
        UIImageView *circle = [Util createImageFromPNG:@"circle" InDirectory:@"img/game/4" DoYouWantImageView:YES];
        circle.frame = CGRectMake((frame.size.width/2)-(circle.frame.size.width/2), 50, circle.frame.size.width, circle.frame.size.height);
        [self addSubview:circle];
        
        self.picker = [[ExtraPicker alloc] initWithFrame:CGRectMake(0, 50, frame.size.width, 140)];
        [self addSubview:self.picker];
    }
    return self;
}

-(void)animateTxt{
    self.lblHoeveelheid.textColor = [UIColor redColor];
    [UIView animateWithDuration:0.3 animations:^{
        self.lblHoeveelheid.transform = CGAffineTransformMakeScale(1.3, 1.3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.lblHoeveelheid.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
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
