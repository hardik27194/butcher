//
//  Extra.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "Extra.h"

@implementation Extra

- (id)initWithFrame:(CGRect)frame andData:(NSDictionary *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.extraId = [[data objectForKey:@"id"] intValue];
        self.toegevoegd = NO;
        
        UIImageView *img = [Util createImageFromPNG:[data objectForKey:@"photo"] InDirectory:@"img/game/4" DoYouWantImageView:YES];
        img.frame = CGRectMake((frame.size.width/2)-(img.frame.size.width/2), 20, img.frame.size.width, img.frame.size.height);
        [self addSubview:img];
        
        UIImageView *line = [Util createImageFromPNG:@"line" InDirectory:@"img/game/4" DoYouWantImageView:YES];
        line.frame = CGRectMake((frame.size.width/2)-(line.frame.size.width/2), 67, line.frame.size.width, line.frame.size.height);
        [self addSubview:line];
        
        UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectMake(0, 47, frame.size.width, 20)];
        UILabel *lblCategory = [[UILabel alloc] initWithFrame:CGRectMake(0, 72, frame.size.width, 20)];
        lblName.textAlignment = lblCategory.textAlignment = NSTextAlignmentCenter;
        lblCategory.font = lblName.font = [UIFont fontWithName:@"LinLibertine" size:18];
        lblName.backgroundColor = lblCategory.backgroundColor = [UIColor clearColor];
        lblCategory.text = [data objectForKey:@"category"];
        lblName.text = [[data objectForKey:@"name"] uppercaseString];
        [self addSubview:lblName];
        [self addSubview:lblCategory];

        UIImage *btnImg = [Util createImageFromPNG:@"btnAdd" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        UIImage *btnDownImg = [Util createImageFromPNG:@"btnAddDown" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        self.btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(58, 102, btnImg.size.width, btnImg.size.height)];
        [self.btnAdd setBackgroundImage:btnImg forState:UIControlStateNormal];
        [self.btnAdd setBackgroundImage:btnDownImg forState:UIControlStateHighlighted];
        self.btnAdd.alpha = 0;
    }
    return self;
}

-(void)showButton{
    [self addSubview:self.btnAdd];
    [UIView animateWithDuration:0.5 animations:^{
        self.btnAdd.alpha = 1;
    }];
}

-(void)hideButton{
    [UIView animateWithDuration:0.5 animations:^{
        self.btnAdd.alpha = 0;
    } completion:^(BOOL finished) {
        [self.btnAdd removeFromSuperview];
    }];
}

-(void)setToegevoegd:(BOOL)toegevoegd{
    _toegevoegd = toegevoegd;
    UIImage *btnImg;
    UIImage *btnDownImg;
    if(toegevoegd){
        btnImg = [Util createImageFromPNG:@"btnDelete" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        btnDownImg = [Util createImageFromPNG:@"btnDeleteDown" InDirectory:@"img/game/4" DoYouWantImageView:NO];
    }else{
        btnImg = [Util createImageFromPNG:@"btnAdd" InDirectory:@"img/game/4" DoYouWantImageView:NO];
        btnDownImg = [Util createImageFromPNG:@"btnAddDown" InDirectory:@"img/game/4" DoYouWantImageView:NO];
    }
    [self.btnAdd setBackgroundImage:btnImg forState:UIControlStateNormal];
    [self.btnAdd setBackgroundImage:btnDownImg forState:UIControlStateHighlighted];
}

@end
