//
//  HakkenView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 10/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface HakkenView : UIView

@property (nonatomic, strong) UIButton *overlay;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *lblMeat;
@property (nonatomic, strong) UILabel *lblBurger;
@property (nonatomic, strong) UIImageView *cleaver;

@end
