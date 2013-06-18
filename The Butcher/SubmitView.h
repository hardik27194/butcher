//
//  SubmitView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface SubmitView : UIView

@property (nonatomic, strong) UITextField *txt;
@property (nonatomic, strong) UIButton *btnSave;
@property (nonatomic, strong) UIActivityIndicatorView *loader;
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UIImageView *textbox;


@end
