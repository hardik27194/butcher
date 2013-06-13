//
//  SausKleurenView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Util.h"

@interface SausKleurenView : UIView

@property (nonatomic, strong) UIView *fill;
@property (nonatomic, strong) UIImageView *drawing;
@property (nonatomic) CGPoint lastpoint;
@property (nonatomic) BOOL mouseSwiped;
@property (nonatomic) int mouseMoveCount;
@property (nonatomic, strong) UIColor *kleur;
@property (nonatomic, strong) UIButton *btnDone;

- (id)initWithFrame:(CGRect)frame  andColor:(UIColor *)kleur;

@end
