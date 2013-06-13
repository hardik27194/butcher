//
//  SausenView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SausenView.h"

@implementation SausenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.picker = [[Sausenpicker alloc] initWithFrame:CGRectMake(20, 20, 185, 205)];
        [self addSubview:self.picker];
        
        UIImage *btnChooseImg = [Util createImageFromPNG:@"btnStart" InDirectory:@"img/game/5" DoYouWantImageView:NO];
        self.btnChoose = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width -200, 192, btnChooseImg.size.width, btnChooseImg.size.height)];
        [self.btnChoose setBackgroundImage:btnChooseImg forState:UIControlStateNormal];
        [self addSubview:self.btnChoose];
        
        self.line = [Util createImageFromPNG:@"line" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.line.frame = CGRectMake(frame.size.width-230, 75, self.line.frame.size.width, self.line.frame.size.height);
        [self addSubview:self.line];
        
        self.lblName = [[UILabel alloc] initWithFrame:CGRectMake(self.line.frame.origin.x, 50, self.line.frame.size.width, 30)];
        self.lblName.textAlignment = NSTextAlignmentCenter;
        self.lblName.font = [UIFont fontWithName:@"LinLibertine" size:25];
        self.lblName.backgroundColor = [UIColor clearColor];
        [self addSubview:self.lblName];
        
        self.lblDesc = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 265, 96, 235, 80)];
        self.lblDesc.textAlignment = NSTextAlignmentCenter;
        self.lblDesc.numberOfLines = 3;
        self.lblDesc.lineBreakMode = NSLineBreakByWordWrapping;
        self.lblDesc.font = [UIFont fontWithName:@"LinLibertine" size:19];
        self.lblDesc.backgroundColor = [UIColor clearColor];
        [self addSubview:self.lblDesc];
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
