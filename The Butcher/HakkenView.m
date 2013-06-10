//
//  HakkenView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 10/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "HakkenView.h"

@implementation HakkenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake((frame.size.width/2) - (105/2), 30, 105, 10)];
        UIImage *trackImg = [Util createImageFromPNG:@"sliderTrack" InDirectory:@"img/game/2" DoYouWantImageView:NO];
        UIImage *thumbImg = [Util createImageFromPNG:@"sliderThumb" InDirectory:@"img/game/2" DoYouWantImageView:NO];
        [self.slider setMaximumTrackImage:trackImg forState:UIControlStateNormal];
        [self.slider setMinimumTrackImage:trackImg forState:UIControlStateNormal];
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 20;
        [self.slider setThumbImage:thumbImg forState:UIControlStateNormal];
        [self.slider setThumbImage:thumbImg forState:UIControlStateHighlighted];
        [self addSubview:self.slider];
        
        self.lblMeat = [[UILabel alloc] initWithFrame:CGRectMake(self.slider.frame.origin.x - 105, self.slider.frame.origin.y +5, 100, 10)];
        self.lblBurger = [[UILabel alloc] initWithFrame:CGRectMake(self.slider.frame.origin.x + self.slider.frame.size.width +5, self.slider.frame.origin.y +5, 100, 10)];
        self.lblBurger.text = @"BURGER";
        self.lblMeat.textAlignment = NSTextAlignmentRight;
        self.lblBurger.textAlignment = NSTextAlignmentLeft;
        self.lblBurger.font = self.lblMeat.font = [UIFont fontWithName:@"LinLibertine" size:15];
        [self addSubview:self.lblBurger];
        [self addSubview:self.lblMeat];
        
        self.cleaver = [Util createImageFromPNG:@"cleaver0" InDirectory:@"img/game/2" DoYouWantImageView:YES];
        self.cleaver.frame = CGRectMake((frame.size.width/2) - (self.cleaver.frame.size.width/2), 90, self.cleaver.frame.size.width, self.cleaver.frame.size.height);
        self.cleaver.transform = CGAffineTransformScale(self.cleaver.transform, -1, 1);
        [self addSubview:self.cleaver];
        
        
        UIImage *overlayImg = [Util createImageFromPNG:@"overlay" InDirectory:@"img/game/2" DoYouWantImageView:NO];
        self.overlay = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (overlayImg.size.width/2), 0, overlayImg.size.width, overlayImg.size.height)];
        [self.overlay setBackgroundImage:overlayImg forState:UIControlStateNormal];
        [self.overlay setBackgroundImage:overlayImg forState:UIControlStateHighlighted];
        self.overlay.alpha = 0;
        [self addSubview:self.overlay];
        [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.overlay.alpha = 1;
        } completion:nil];
    }
    return self;
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
