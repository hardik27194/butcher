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
        self.backgroundColor = [UIColor clearColor];
        self.progressMeter = [[ProgressMeter alloc] initWithFrame:CGRectMake(30, 15, 40, 40)];
        [self addSubview:self.progressMeter];
        
        self.timeMeter = [[TimeMeter alloc] initWithFrame:CGRectMake(frame.size.width - 70, 15, 40, 40)];
        [self addSubview:self.timeMeter];
        
        self.btnMenu = [Util createMenuButtonWithXpos:25 AndYpos:275];
        [self addSubview:self.btnMenu];
        
        self.lblGameInfo = [[UILabel alloc] initWithFrame:CGRectMake(115, 280, frame.size.width - 220, 25)];
        self.lblGameInfo.backgroundColor = [UIColor clearColor];
        self.lblGameInfo.textAlignment = NSTextAlignmentCenter;
        self.lblGameInfo.font = [UIFont fontWithName:@"Franchise" size:23];
        [self addSubview:self.lblGameInfo];
        
        UIImage *btnOverlayImg = [Util createImageFromPNG:@"infoOverlay" InDirectory:@"img/game" DoYouWantImageView:NO];
        self.btnOverlay = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnOverlayImg.size.width/2), 0, btnOverlayImg.size.width, btnOverlayImg.size.height)];
        [self.btnOverlay setBackgroundImage:btnOverlayImg forState:UIControlStateNormal];
        [self.btnOverlay setBackgroundImage:btnOverlayImg forState:UIControlStateHighlighted];
        //for skipping the game
        //[self addSubview:self.btnOverlay];
        [self.btnOverlay addTarget:self action:@selector(removeOverlay:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

-(void)removeOverlay:(id)sender{
    [UIView animateWithDuration:1 animations:^{
        self.btnOverlay.alpha = 0;
    } completion:^(BOOL finished) {
        self.btnOverlay = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"OVERLAY_DISMISSED" object:self];
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
