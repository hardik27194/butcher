//
//  GameView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "GameView.h"

@implementation GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *bg = [Util createImageFromPNG:@"whiteBG" InDirectory:@"img" DoYouWantImageView:YES];
        [self addSubview:bg];
        
        self.gameStartV = [[GameStartView alloc] initWithFrame:frame];
        [self addSubview:self.gameStartV];
        
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
