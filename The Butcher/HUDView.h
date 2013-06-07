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

@interface HUDView : UIView

@property (nonatomic, strong) ProgressMeter *progressMeter;

@end
