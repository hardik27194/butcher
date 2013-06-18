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
        
        self.stap1 = [Util createImageFromPNG:@"stap1" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap1.frame = CGRectMake((frame.size.width/2)-180, frame.size.height - self.stap1.frame.size.height - 190, self.stap1.frame.size.width, self.stap1.frame.size.height);
        [self addSubview:self.stap1];
        
        self.stap2 = [Util createImageFromPNG:@"stap2" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap2.frame = CGRectMake((frame.size.width/2)-(self.stap2.frame.size.width/2), frame.size.height - self.stap2.frame.size.height - 190, self.stap2.frame.size.width, self.stap2.frame.size.height);
        [self addSubview:self.stap2];
        
        self.stap3 = [Util createImageFromPNG:@"stap3" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap3.frame = CGRectMake((frame.size.width/2)+100, frame.size.height - self.stap3.frame.size.height - 190, self.stap3.frame.size.width, self.stap3.frame.size.height);
        [self addSubview:self.stap3];
        
        self.stap4 = [Util createImageFromPNG:@"stap4" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap4.frame = CGRectMake((frame.size.width/2)-180, frame.size.height - self.stap4.frame.size.height - 80, self.stap4.frame.size.width, self.stap4.frame.size.height);
        [self addSubview:self.stap4];
        
        self.stap5 = [Util createImageFromPNG:@"stap5" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap5.frame = CGRectMake((frame.size.width/2)-(self.stap5.frame.size.width/2), frame.size.height - self.stap5.frame.size.height - 80, self.stap5.frame.size.width, self.stap5.frame.size.height);
        [self addSubview:self.stap5];
        
        self.stap6 = [Util createImageFromPNG:@"stap6" InDirectory:@"img/game/menu" DoYouWantImageView:YES];
        self.stap6.frame = CGRectMake((frame.size.width/2)+100, frame.size.height - self.stap6.frame.size.height - 80, self.stap6.frame.size.width, self.stap6.frame.size.height);
        [self addSubview:self.stap6];
        
        

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
