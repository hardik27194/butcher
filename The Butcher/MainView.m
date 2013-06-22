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
        
        
        self.logo = [Util createImageFromPNG:@"logo" InDirectory:@"img/home" DoYouWantImageView:YES];
        self.logo.frame = CGRectMake((frame.size.width/2) - (self.logo.frame.size.width/2), 360, self.logo.frame.size.width, self.logo.frame.size.height);
        [self addSubview:self.logo];
        
        
        UIImage *btnMakeBurgerImg = [Util createImageFromPNG:@"home_btnMakeBurger" InDirectory:@"img/home" DoYouWantImageView:NO];
        UIImage *btnMakeBurgerDownImg = [Util createImageFromPNG:@"home_btnMakeBurgerDown" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnMakeBurger = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width/2) - (btnMakeBurgerImg.size.width/2), 490, btnMakeBurgerImg.size.width, btnMakeBurgerImg.size.height)];
        [self.btnMakeBurger setBackgroundImage:btnMakeBurgerImg forState:UIControlStateNormal];
        [self.btnMakeBurger setBackgroundImage:btnMakeBurgerDownImg forState:UIControlStateHighlighted];
        [self addSubview:self.btnMakeBurger];
        
        
        UIImage *btnVoteImg = [Util createImageFromPNG:@"home_btnVote" InDirectory:@"img/home" DoYouWantImageView:NO];
        UIImage *btnVoteDownImg = [Util createImageFromPNG:@"home_btnVoteDown" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnVote = [[UIButton alloc] initWithFrame:CGRectMake(self.btnMakeBurger.frame.origin.x, 555, btnVoteImg.size.width, btnVoteImg.size.height)];
        [self.btnVote setBackgroundImage:btnVoteImg forState:UIControlStateNormal];
        [self.btnVote setBackgroundImage:btnVoteDownImg forState:UIControlStateHighlighted];
        [self addSubview:self.btnVote];
        
        UIImage *btnInfoImg = [Util createImageFromPNG:@"home_btnInfo" InDirectory:@"img/home" DoYouWantImageView:NO];
        UIImage *btnInfoDownImg = [Util createImageFromPNG:@"home_btnInfoDown" InDirectory:@"img/home" DoYouWantImageView:NO];
        self.btnInfo = [[UIButton alloc] initWithFrame:CGRectMake((self.btnMakeBurger.frame.origin.x + self.btnMakeBurger.frame.size.width) - btnInfoImg.size.width, 555, btnInfoImg.size.width, btnInfoImg.size.height)];
        [self.btnInfo setBackgroundImage:btnInfoImg forState:UIControlStateNormal];
        [self.btnInfo setBackgroundImage:btnInfoDownImg forState:UIControlStateHighlighted];
        [self addSubview:self.btnInfo];
        
        
        
    }
    return self;
}



-(void)gotoScreen2{
    
    [UIView animateWithDuration:0.4 animations:^{
        self.contentOffset = CGPointMake(0,320);
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
