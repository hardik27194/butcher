//
//  SubmitView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SubmitView.h"

@implementation SubmitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.img = [Util createImageFromPNG:@"info" InDirectory:@"img/game/7" DoYouWantImageView:YES];
        self.img.frame = CGRectMake((frame.size.width/2) - (self.img.frame.size.width/2), 30, self.img.frame.size.width, self.img.frame.size.height);
        [self addSubview:self.img];
        
        self.textbox = [Util createImageFromPNG:@"txtField" InDirectory:@"img/game/7" DoYouWantImageView:YES];
        self.textbox.frame = CGRectMake((frame.size.width/2) - (self.textbox.frame.size.width/2), 180, self.textbox.frame.size.width, self.textbox.frame.size.height);
        [self addSubview:self.textbox];
        
        UIImage *btnSaveImg = [Util createImageFromPNG:@"btnFb" InDirectory:@"img/game/7" DoYouWantImageView:NO];
        self.btnSave = [[UIButton alloc] initWithFrame:CGRectMake(self.textbox.frame.origin.x, self.textbox.frame.origin.y + btnSaveImg.size.height + 15, btnSaveImg.size.width, btnSaveImg.size.height)];
        [self.btnSave setBackgroundImage:btnSaveImg forState:UIControlStateNormal];
        self.btnSave.alpha = 0.5;
        self.btnSave.userInteractionEnabled = NO;
        [self addSubview:self.btnSave];
        
        self.txt = [[UITextField alloc] initWithFrame:CGRectMake(self.textbox.frame.origin.x +10, self.textbox.frame.origin.y +9, self.textbox.frame.size.width -20, self.textbox.frame.size.height -13)];
        self.txt.placeholder = @"NAME YOUR CREATION...";
        self.txt.font = [UIFont fontWithName:@"Franchise" size:21];
        self.txt.minimumFontSize = 18;
        self.txt.textAlignment = NSTextAlignmentLeft;
        self.txt.returnKeyType = UIReturnKeyDone;
        self.txt.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.txt.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.txt.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.txt];
        
        self.loader = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.btnSave.frame.origin.x + (self.btnSave.frame.size.width/2) - 10, self.btnSave.frame.origin.y + 3, 20, 20)];
        self.loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
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
