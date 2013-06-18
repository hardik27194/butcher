//
//  ExtraView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "ExtraPicker.h"

@interface ExtraView : UIView

@property (nonatomic, strong) ExtraPicker *picker;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UILabel *lblHoeveelheid;

-(void)animateTxt;

@end
