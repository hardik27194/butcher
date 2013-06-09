//
//  ChooseMeatView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 9/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ChooseMeatView.h"

@implementation ChooseMeatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *silhouette = [Util createImageFromPNG:@"silhouette" InDirectory:@"img/game/1" DoYouWantImageView:YES];
        silhouette.frame = CGRectMake((frame.size.width/2) - (silhouette.frame.size.width/2) -30, 55, silhouette.frame.size.width, silhouette.frame.size.height);
        //[self addSubview:silhouette];
        
        UIImage *btnMeat1Img = [Util createImageFromPNG:@"meat1" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat1 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 109, silhouette.frame.origin.y + 25, btnMeat1Img.size.width, btnMeat1Img.size.height)];
        [self.btnMeat1 setBackgroundImage:btnMeat1Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat1];
        
        UIImage *btnMeat2Img = [Util createImageFromPNG:@"meat2" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat2 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 208, silhouette.frame.origin.y + 20, btnMeat2Img.size.width, btnMeat2Img.size.height)];
        [self.btnMeat2 setBackgroundImage:btnMeat2Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat2];
        
        UIImage *btnMeat3Img = [Util createImageFromPNG:@"meat3" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat3 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 291, silhouette.frame.origin.y + 11, btnMeat3Img.size.width, btnMeat3Img.size.height)];
        [self.btnMeat3 setBackgroundImage:btnMeat3Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat3];
        
        UIImage *btnMeat4Img = [Util createImageFromPNG:@"meat4" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat4 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 60, silhouette.frame.origin.y + 124, btnMeat4Img.size.width, btnMeat4Img.size.height)];
        [self.btnMeat4 setBackgroundImage:btnMeat4Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat4];
        
        UIImage *btnMeat5Img = [Util createImageFromPNG:@"meat5" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat5 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 200, silhouette.frame.origin.y + 117, btnMeat5Img.size.width, btnMeat5Img.size.height)];
        [self.btnMeat5 setBackgroundImage:btnMeat5Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat5];
        
        UIImage *btnMeat6Img = [Util createImageFromPNG:@"meat6" InDirectory:@"img/game/1" DoYouWantImageView:NO];
        self.btnMeat6 = [[UIButton alloc] initWithFrame:CGRectMake(silhouette.frame.origin.x + 289, silhouette.frame.origin.y + 118, btnMeat6Img.size.width, btnMeat6Img.size.height)];
        [self.btnMeat6 setBackgroundImage:btnMeat6Img forState:UIControlStateNormal];
        [self addSubview:self.btnMeat6];
        

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
