//
//  MainView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 5/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface MainView : UIScrollView

@property (nonatomic, strong) UIButton *btnVote;
@property (nonatomic, strong) UIButton *btnInfo;
@property (nonatomic, strong) UIButton *btnMakeBurger;
@property (nonatomic, strong) UIImageView *logo;


-(void)gotoScreen2;

@end
