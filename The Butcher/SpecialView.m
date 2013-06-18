//
//  SpecialView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SpecialView.h"

@implementation SpecialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *textbox = [Util createImageFromPNG:@"txtField" InDirectory:@"img/game/6" DoYouWantImageView:YES];
        textbox.frame = CGRectMake((frame.size.width/2) - (textbox.frame.size.width/2), 200, textbox.frame.size.width, textbox.frame.size.height);
        [self addSubview:textbox];
        
        UIImageView *img = [Util createImageFromPNG:@"ultimate" InDirectory:@"img/game/6" DoYouWantImageView:YES];
        img.frame = CGRectMake((frame.size.width/2) - (img.frame.size.width/2), 30, img.frame.size.width, img.frame.size.height);
        [self addSubview:img];
        
        UIImage *btnDoneImg = [Util createImageFromPNG:@"btnDone" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        UIImage *btnDoneDownImg = [Util createImageFromPNG:@"btnDoneDown" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        self.btnDone = [[UIButton alloc] initWithFrame:CGRectMake(textbox.frame.origin.x + textbox.frame.size.width + 30, textbox.frame.origin.y, btnDoneImg.size.width, btnDoneImg.size.height)];
        [self.btnDone setBackgroundImage:btnDoneImg forState:UIControlStateNormal];
        [self.btnDone setBackgroundImage:btnDoneDownImg forState:UIControlStateHighlighted];
        self.btnDone.alpha = 0.5;
        self.btnDone.userInteractionEnabled = NO;
        [self addSubview:self.btnDone];
        
        self.txt = [[UITextField alloc] initWithFrame:CGRectMake(textbox.frame.origin.x +10, textbox.frame.origin.y +8, textbox.frame.size.width -20, textbox.frame.size.height -13)];
        self.txt.placeholder = @"EG. SKITTLES";
        self.txt.font = [UIFont fontWithName:@"Franchise" size:23];
        self.txt.minimumFontSize = 18;
        self.txt.textAlignment = NSTextAlignmentLeft;
        self.txt.returnKeyType = UIReturnKeyDone;
        self.txt.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.txt.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.txt.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.txt];
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
