//
//  BakkenView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 12/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "BakkenView.h"

@implementation BakkenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.slider = [[UISlider alloc] initWithFrame:CGRectMake((frame.size.width/2) - (343/2), 15, 343, 10)];
        UIImage *trackImg = [Util createImageFromPNG:@"track" InDirectory:@"img/game/3" DoYouWantImageView:NO];
        UIImage *thumbImg = [Util createImageFromPNG:@"thumb" InDirectory:@"img/game/3" DoYouWantImageView:NO];
        [self.slider setMaximumTrackImage:trackImg forState:UIControlStateNormal];
        [self.slider setMinimumTrackImage:[trackImg resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)] forState:UIControlStateNormal];
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 600;
        [self.slider setThumbImage:thumbImg forState:UIControlStateNormal];
        [self.slider setThumbImage:thumbImg forState:UIControlStateHighlighted];
        self.slider.userInteractionEnabled = NO;
        [self addSubview:self.slider];
        
        self.lblCooking = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width/2) - (343/2), 35, 343, 20)];
        self.lblCooking.textAlignment = NSTextAlignmentCenter;
        self.lblCooking.font = [UIFont fontWithName:@"LinLibertine" size:15];
        self.lblCooking.backgroundColor = [UIColor clearColor];
        self.lblCooking.text = @"RAW";
        [self addSubview:self.lblCooking];
        
        UIImageView *grill = [Util createImageFromPNG:@"grill" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        grill.frame = CGRectMake((frame.size.width/2) - (grill.frame.size.width/2), 87, grill.frame.size.width, grill.frame.size.height);
        [self addSubview:grill];
        
        UIImageView *meter = [Util createImageFromPNG:@"meter" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        meter.frame = CGRectMake((frame.size.width/2) - (meter.frame.size.width/2), 185, meter.frame.size.width, meter.frame.size.height);
        [self addSubview:meter];
        
        self.wijzer = [Util createImageFromPNG:@"wijzer" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.wijzer.frame = CGRectMake((frame.size.width/2) - (self.wijzer.frame.size.width/2), 210, self.wijzer.frame.size.width, self.wijzer.frame.size.height);
        [self addSubview:self.wijzer];
        
        
        self.burger0 = [Util createImageFromPNG:@"burger_0" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.burger0.frame = CGRectMake(grill.frame.origin.x +130, grill.frame.origin.y-15, self.burger0.frame.size.width, self.burger0.frame.size.height);
        
        self.burger1 = [Util createImageFromPNG:@"burger_1" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.burger1.frame = CGRectMake(self.burger0.frame.origin.x, self.burger0.frame.origin.y, self.burger0.frame.size.width, self.burger0.frame.size.height);
        
        self.burger2 = [Util createImageFromPNG:@"burger_2" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.burger2.frame = CGRectMake(self.burger0.frame.origin.x, self.burger0.frame.origin.y, self.burger0.frame.size.width, self.burger0.frame.size.height);

        self.burger3 = [Util createImageFromPNG:@"burger_3" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.burger3.frame = CGRectMake(self.burger0.frame.origin.x, self.burger0.frame.origin.y, self.burger0.frame.size.width, self.burger0.frame.size.height);

        self.burger4 = [Util createImageFromPNG:@"burger_4" InDirectory:@"img/game/3" DoYouWantImageView:YES];
        self.burger4.frame = CGRectMake(self.burger0.frame.origin.x, self.burger0.frame.origin.y, self.burger0.frame.size.width, self.burger0.frame.size.height);

        [self addSubview:self.burger4];
        [self addSubview:self.burger3];
        [self addSubview:self.burger2];
        [self addSubview:self.burger1];
        [self addSubview:self.burger0];
        
        
        UIImage *overlayImg = [Util createImageFromPNG:@"overlay" InDirectory:@"img/game/3" DoYouWantImageView:NO];
        self.overlay = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (overlayImg.size.width/2), 0, overlayImg.size.width, overlayImg.size.height)];
        [self.overlay setBackgroundImage:overlayImg forState:UIControlStateNormal];
        [self.overlay setBackgroundImage:overlayImg forState:UIControlStateHighlighted];
        self.overlay.alpha = 0;
        [self addSubview:self.overlay];
        [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
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
