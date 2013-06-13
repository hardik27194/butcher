//
//  Sausenpicker.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "Sausenpicker.h"

@implementation Sausenpicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = NO;
        _currentSaus = 10;
        
        self.saus1 = [Util createImageFromPNG:@"saus_0" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.saus1.frame = CGRectMake((frame.size.width/2)-(self.saus1.frame.size.width/2), 0, self.saus1.frame.size.width, self.saus1.frame.size.height);
        [self addSubview:self.saus1];
        
        self.saus2 = [Util createImageFromPNG:@"saus_1" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.saus2.frame = CGRectMake(self.saus1.frame.origin.x + 60, 0, self.saus1.frame.size.width, self.saus1.frame.size.height);
        [self addSubview:self.saus2];
        
        self.saus3 = [Util createImageFromPNG:@"saus_2" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.saus3.frame = CGRectMake(self.saus2.frame.origin.x + 60, 0, self.saus1.frame.size.width, self.saus1.frame.size.height);
        [self addSubview:self.saus3];
        
        self.saus4 = [Util createImageFromPNG:@"saus_3" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.saus4.frame = CGRectMake(self.saus3.frame.origin.x + 60, 0, self.saus1.frame.size.width, self.saus1.frame.size.height);
        [self addSubview:self.saus4];
        
        self.saus5 = [Util createImageFromPNG:@"saus_4" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        self.saus5.frame = CGRectMake(self.saus4.frame.origin.x + 60, 0, self.saus1.frame.size.width, self.saus1.frame.size.height);
        [self addSubview:self.saus5];
        
        self.arrSausen = [NSArray arrayWithObjects:self.saus1, self.saus2, self.saus3, self.saus4, self.saus5, nil];
        
        self.contentSize = CGSizeMake(self.saus5.frame.origin.x + (self.saus5.frame.size.width * 2), frame.size.height);
        self.delegate = self;
        self.saus1.transform = self.saus2.transform = self.saus3.transform = self.saus4.transform = self.saus5.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        [self scrollViewDidScroll:self];
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float centerOffset = (self.contentOffset.x + (self.frame.size.width/2));
    for (int i = 0; i < [self.arrSausen count]; i++) {
        
        UIImageView *current = [self.arrSausen objectAtIndex:i];
        float xMin = ((current.frame.origin.x + (current.frame.size.width/2))-80);
        float xMax = ((current.frame.origin.x + (current.frame.size.width/2))+80);
        
        if( xMin <= centerOffset && centerOffset <= xMax ){
            float scale = fabsf((centerOffset - xMin -80));
            scale = 1 - (scale*(0.5/80));
            current.transform = CGAffineTransformMakeScale(scale, scale);
            current.alpha = 1;
            if (scale <= 0.6) {
                current.alpha = (scale - 0.5)*10;
            }
        }else{
            current.transform = CGAffineTransformMakeScale(0.5, 0.5);
            current.alpha = 0;
        }
    }
    //NSLog(@"center offset: %f",centerOffset);
    if (centerOffset <= 122) {
        self.currentSaus = 0;
    }
    if (centerOffset > 122 && centerOffset <= 183) {
        self.currentSaus = 1;
    }
    if (centerOffset > 183 && centerOffset <= 243) {
        self.currentSaus = 2;
    }
    if (centerOffset > 243 && centerOffset <= 302) {
        self.currentSaus = 3;
    }
    if (centerOffset > 302) {
        self.currentSaus = 4;
    }
}

-(void)setCurrentSaus:(int)currentSaus{
    if (currentSaus != _currentSaus) {
        _currentSaus = currentSaus;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NEW_SAUS" object:self];
    }
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
