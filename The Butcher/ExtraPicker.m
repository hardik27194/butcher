//
//  ExtraPicker.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ExtraPicker.h"

@implementation ExtraPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //object width 140
        self.pagingEnabled = NO;
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        self.delegate = self;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return self;
}



-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity
    targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    self.newX = targetContentOffset->x /140.0;
    self.newX = round(self.newX);
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MOVED" object:self userInfo:[NSDictionary dictionaryWithObject:[ NSNumber numberWithInt:self.newX] forKey:@"currentSelected"]];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setContentOffset:CGPointMake(self.newX*140,0) animated:YES];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self setContentOffset:CGPointMake(self.newX*140,0) animated:YES];
}

@end
