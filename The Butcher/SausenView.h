//
//  SausenView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "Sausenpicker.h"

@interface SausenView : UIView

@property (nonatomic, strong) Sausenpicker *picker;
@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblDesc;
@property (nonatomic, strong) UIButton *btnChoose;
@property (nonatomic, strong) UIImageView *line;

@end
