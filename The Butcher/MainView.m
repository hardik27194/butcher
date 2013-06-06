//
//  MainView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 5/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *bg = [Util createImageFromPNG:@"home_bg" InDirectory:@"img/home" DoYouWantImageView:YES];
        bg.frame = CGRectMake((frame.size.width/2) - (bg.frame.size.width/2), 0, bg.frame.size.width, bg.frame.size.height);
        [self addSubview:bg];
        self.contentSize = CGSizeMake(frame.size.width, bg.frame.size.height);
        
        
        
        UIImage *btnContinueImg = [Util createImageFromPNG:@"home_btnContinue" InDirectory:@"img/home" DoYouWantImageView:NO];
        UIImage *btnContinueImgDown = [Util createImageFromPNG:@"home_btnContinueDown" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnContinue = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnContinueImg.size.width/2), 200, btnContinueImg.size.width, btnContinueImg.size.height)];
        [self.btnContinue addTarget:self action:@selector(gotoScreen2:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnContinue setBackgroundImage:btnContinueImg forState:UIControlStateNormal];
        [self.btnContinue setBackgroundImage:btnContinueImgDown forState:UIControlStateHighlighted];
        [self addSubview:self.btnContinue];
        
        
        self.screen2 = [Util createImageFromPNG:@"home_screen2" InDirectory:@"img/home" DoYouWantImageView:YES];
        self.screen2.frame = CGRectMake((frame.size.width/2) - (self.screen2.frame.size.width/2), 339, self.screen2.frame.size.width, self.screen2.frame.size.height);
        self.screen2.alpha = 0;
        [self addSubview:self.screen2];
        
        
        self.screen2Arrows = [Util createImageFromPNG:@"home_showmoreArrows" InDirectory:@"img/home" DoYouWantImageView:YES];
        self.screen2Arrows.frame = CGRectMake((frame.size.width/2) - (self.screen2Arrows.frame.size.width/2), 606, self.screen2Arrows.frame.size.width, self.screen2Arrows.frame.size.height);
        [self addSubview:self.screen2Arrows];
        self.screen2Arrows.alpha = 0;
        
        
        self.screen3 = [Util createImageFromPNG:@"home_screen3" InDirectory:@"img/home" DoYouWantImageView:YES];
        self.screen3.frame = CGRectMake((frame.size.width/2) - (self.screen3.frame.size.width/2), 660, self.screen3.frame.size.width, self.screen3.frame.size.height);
        self.screen3.alpha = 1;
        [self addSubview:self.screen3];
        
        
        UIImage *btnMakeBurgerImg = [Util createImageFromPNG:@"home_btnMakeBurger" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnMakeBurger = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnMakeBurgerImg.size.width/2), 810, btnMakeBurgerImg.size.width, btnContinueImg.size.height)];
        [self.btnMakeBurger setBackgroundImage:btnMakeBurgerImg forState:UIControlStateNormal];
        [self addSubview:self.btnMakeBurger];
        
        
        UIImage *btnVoteImg = [Util createImageFromPNG:@"home_btnVote" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnVote = [[UIButton alloc] initWithFrame:CGRectMake(self.btnMakeBurger.frame.origin.x, 880, btnVoteImg.size.width, btnVoteImg.size.height)];
        [self.btnVote setBackgroundImage:btnVoteImg forState:UIControlStateNormal];
        [self addSubview:self.btnVote];
        
        UIImage *btnInfoImg = [Util createImageFromPNG:@"home_btnInfo" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnInfo = [[UIButton alloc] initWithFrame:CGRectMake((self.btnMakeBurger.frame.origin.x + self.btnMakeBurger.frame.size.width) - btnInfoImg.size.width, 880, btnInfoImg.size.width, btnInfoImg.size.height)];
        [self.btnInfo setBackgroundImage:btnInfoImg forState:UIControlStateNormal];
        [self addSubview:self.btnInfo];
        self.btnMakeBurger.alpha = self.screen3.alpha = self.btnInfo.alpha = self.btnVote.alpha = 0;
        
        
        
    }
    return self;
}



-(void)gotoScreen2:(id)sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.contentOffset = CGPointMake(0,320);
        self.screen2.alpha = 1;
    } completion:^(BOOL finished) {
        //
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
