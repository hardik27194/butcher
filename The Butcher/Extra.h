//
//  Extra.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface Extra : UIView

@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic) int extraId;
@property (nonatomic) BOOL toegevoegd;

- (id)initWithFrame:(CGRect)frame andData:(NSDictionary *)data;

-(void)showButton;
-(void)hideButton;

@end
