//
//  SausKleurenView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SausKleurenView.h"

@implementation SausKleurenView

- (id)initWithFrame:(CGRect)frame  andColor:(UIColor *)kleur
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.kleur = kleur;
        
        UIImageView *bg = [Util createImageFromPNG:@"whiteBG" InDirectory:@"img" DoYouWantImageView:YES];
        [self addSubview:bg];
        
        UIImageView *fillOverlay = [Util createImageFromPNG:@"sausmeter" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        fillOverlay.frame = CGRectMake((frame.size.width/2)-(fillOverlay.frame.size.width/2), 10, fillOverlay.frame.size.width, fillOverlay.frame.size.height);
        
        self.fill = [[UIView alloc] initWithFrame:CGRectMake(fillOverlay.frame.origin.x, fillOverlay.frame.origin.y, 60, fillOverlay.frame.size.height)];
        self.fill.backgroundColor = self.kleur;
        [self addSubview:self.fill];
        [self addSubview:fillOverlay];
        
        UIImageView *burger = [Util createImageFromPNG:@"burger" InDirectory:@"img/game/5" DoYouWantImageView:YES];
        burger.frame = CGRectMake((frame.size.width/2)-(burger.frame.size.width/2), 50, burger.frame.size.width, burger.frame.size.height);
        [self addSubview:burger];
        
        UIImage *mask = [Util createImageFromPNG:@"mask" InDirectory:@"img/game/5" DoYouWantImageView:NO];
        
        self.drawing = [[UIImageView alloc] initWithImage:nil];
        self.drawing.frame = self.frame;
        [self addSubview:self.drawing];
        self.mouseMoveCount = 0;
        
        CALayer *_maskingLayer = [CALayer layer];
        _maskingLayer.frame = CGRectMake(burger.frame.origin.x, burger.frame.origin.y, mask.size.width, mask.size.height);
        [_maskingLayer setContents:(id)[mask CGImage]];
        [self.drawing.layer setMask:_maskingLayer];
        
        UIImage *btnDoneImg = [Util createImageFromPNG:@"btnDone" InDirectory:@"img/game/5" DoYouWantImageView:NO];
        self.btnDone = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width) - (btnDoneImg.size.width) - 20, 10, btnDoneImg.size.width, btnDoneImg.size.height)];
        [self.btnDone setBackgroundImage:btnDoneImg forState:UIControlStateNormal];
        [self.btnDone setBackgroundImage:btnDoneImg forState:UIControlStateHighlighted];
        [self addSubview:self.btnDone];
        
    }
    return self;
}

-(void)setMouseMoveCount:(int)mouseMoveCount{
    _mouseMoveCount = mouseMoveCount;
    self.fill.frame = CGRectMake(self.fill.frame.origin.x, self.fill.frame.origin.y, 60.0-((self.mouseMoveCount/400.0)*60.0), self.fill.frame.size.height);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.mouseSwiped = NO;
    
    UITouch *touch = [touches anyObject];
	
	if ([touch tapCount] == 2) {
		self.drawing.image = nil;
        self.mouseMoveCount = 0;
		return;
	}
    
	self.lastpoint = [touch locationInView:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.mouseSwiped = YES;
	
	UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:self];
	
    if(self.mouseMoveCount <= 400){
        UIGraphicsBeginImageContext(self.frame.size);
        [self.drawing.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 15.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), CGColorGetComponents(self.kleur.CGColor)[0], CGColorGetComponents(self.kleur.CGColor)[1], CGColorGetComponents(self.kleur.CGColor)[2], 1.0);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastpoint.x, self.lastpoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.drawing.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.mouseMoveCount++;
    }
    
	self.lastpoint = currentPoint;
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
	
	if ([touch tapCount] == 2) {
		self.drawing.image = nil;
        self.mouseMoveCount = 0;
		return;
	}
	
	
	if(!self.mouseSwiped && self.mouseMoveCount <= 400) {
		UIGraphicsBeginImageContext(self.frame.size);
		[self.drawing.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
		CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 15.0);
		CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), CGColorGetComponents(self.kleur.CGColor)[0], CGColorGetComponents(self.kleur.CGColor)[1], CGColorGetComponents(self.kleur.CGColor)[2], 1.0);
		CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastpoint.x, self.lastpoint.y);
		CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.lastpoint.x, self.lastpoint.y);
		CGContextStrokePath(UIGraphicsGetCurrentContext());
		CGContextFlush(UIGraphicsGetCurrentContext());
		self.drawing.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
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
