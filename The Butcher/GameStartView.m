//
//  GameStartView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "GameStartView.h"

@implementation GameStartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.btnMenu = [Util createMenuButtonWithXpos:30 AndYpos:15];
        [self addSubview:self.btnMenu];
        
        UIImageView *info = [Util createImageFromPNG:@"info" InDirectory:@"img/game/start" DoYouWantImageView:YES];
        info.frame = CGRectMake((frame.size.width/2)-(info.frame.size.width/2), 62, info.frame.size.width, info.frame.size.height);
        [self addSubview:info];
        
        UIImage *btnContinueImg = [Util createImageFromPNG:@"btnContinue" InDirectory:@"img/game/start" DoYouWantImageView:NO];
        UIImage *btnContinueImgDown = [Util createImageFromPNG:@"btnContinueDown" InDirectory:@"img/game/start" DoYouWantImageView:NO];
        self.btnContinue = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnContinueImg.size.width/2), 250, btnContinueImg.size.width, btnContinueImg.size.height)];
        [self.btnContinue setBackgroundImage:btnContinueImg forState:UIControlStateNormal];
        [self.btnContinue setBackgroundImage:btnContinueImgDown forState:UIControlStateHighlighted];
        [self addSubview:self.btnContinue];
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
