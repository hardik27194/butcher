//
//  BakkenView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 12/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface BakkenView : UIView

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *overlay;
@property (nonatomic, strong) UILabel *lblCooking;

@property (nonatomic, strong) UIImageView *wijzer;
@property (nonatomic, strong) UIImageView *burger0;
@property (nonatomic, strong) UIImageView *burger1;
@property (nonatomic, strong) UIImageView *burger2;
@property (nonatomic, strong) UIImageView *burger3;
@property (nonatomic, strong) UIImageView *burger4;


@end
