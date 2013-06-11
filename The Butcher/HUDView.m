//
//  HUDView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "HUDView.h"

@implementation HUDView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        UIImageView *bg = [Util createImageFromPNG:@"bg" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        bg.frame = CGRectMake((frame.size.width/2)-(bg.frame.size.width/2), 0, bg.frame.size.width, bg.frame.size.height);
        [self addSubview:bg];
        
        self.progressMeter = [[ProgressMeter alloc] initWithFrame:CGRectMake(15, 10, 40, 40)];
        [self addSubview:self.progressMeter];
        
        self.timeMeter = [[TimeMeter alloc] initWithFrame:CGRectMake(frame.size.width - 55, 10, 40, 40)];
        [self addSubview:self.timeMeter];
        
        UIImage *btnMenuImg = [Util createImageFromPNG:@"btnMenu" InDirectory:@"img/game/menu" DoYouWantImageView:NO];
        self.btnMenu = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnMenuImg.size.width/2), 270, btnMenuImg.size.width, btnMenuImg.size.height)];
        [self.btnMenu setBackgroundImage:btnMenuImg forState:UIControlStateNormal];
        [self addSubview:self.btnMenu];
        
        self.lblGameInfo = [[UILabel alloc] initWithFrame:CGRectMake(60, 21, frame.size.width - 120, 25)];
        self.lblGameInfo.backgroundColor = [UIColor clearColor];
        self.lblGameInfo.textColor = [UIColor whiteColor];
        self.lblGameInfo.textAlignment = NSTextAlignmentCenter;
        self.lblGameInfo.font = [UIFont fontWithName:@"Franchise" size:23];
        [self addSubview:self.lblGameInfo];
        
        
        //OVERLAY MET EXTRA INFO DEPRECATED
//        UIImage *btnOverlayImg = [Util createImageFromPNG:@"infoOverlay" InDirectory:@"img/game" DoYouWantImageView:NO];
//        self.btnOverlay = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnOverlayImg.size.width/2), 0, btnOverlayImg.size.width, btnOverlayImg.size.height)];
//        [self.btnOverlay setBackgroundImage:btnOverlayImg forState:UIControlStateNormal];
//        [self.btnOverlay setBackgroundImage:btnOverlayImg forState:UIControlStateHighlighted];
//        [self addSubview:self.btnOverlay];
//        [self.btnOverlay addTarget:self action:@selector(removeOverlay:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
//DEPRECATED
//-(void)removeOverlay:(id)sender{
//    [UIView animateWithDuration:1 animations:^{
//        self.btnOverlay.alpha = 0;
//    } completion:^(BOOL finished) {
//        self.btnOverlay = nil;
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"OVERLAY_DISMISSED" object:self];
//    }];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
