//
//  HUDView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "ProgressMeter.h"
#import "TimeMeter.h"

@interface HUDView : UIView

@property (nonatomic, strong) ProgressMeter *progressMeter;
@property (nonatomic, strong) TimeMeter *timeMeter;
@property (nonatomic, strong) UILabel *lblGameInfo;
@property (nonatomic, strong) UIButton *btnMenu;
@property (nonatomic, strong) UIButton *btnHelp;
@property (nonatomic, strong) UIButton *btnOverlay;

@property (nonatomic, strong) UIImageView *stap1;
@property (nonatomic, strong) UIImageView *stap2;
@property (nonatomic, strong) UIImageView *stap3;
@property (nonatomic, strong) UIImageView *stap4;
@property (nonatomic, strong) UIImageView *stap5;
@property (nonatomic, strong) UIImageView *stap6;

@end
