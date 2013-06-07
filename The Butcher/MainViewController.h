//
//  MainViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 5/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "Util.h"
#import "InfoViewController.h"
#import "GameViewController.h"

@interface MainViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong) MainView *MainView;

@property (nonatomic) BOOL showingArrows;
@property (nonatomic, strong) InfoViewController *infoVC;
@property (nonatomic, strong) GameViewController *gameVC;


@end
