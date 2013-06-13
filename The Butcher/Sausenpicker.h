//
//  Sausenpicker.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface Sausenpicker : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *saus1;
@property (nonatomic, strong) UIImageView *saus2;
@property (nonatomic, strong) UIImageView *saus3;
@property (nonatomic, strong) UIImageView *saus4;
@property (nonatomic, strong) UIImageView *saus5;

@property (nonatomic, strong) NSArray *arrSausen;
@property (nonatomic) int currentSaus;

@end
