//
//  HUDViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "HUDView.h"
#import "AppModel.h"

@interface HUDViewController : UIViewController

@property (nonatomic, strong) HUDView *v;
@property (nonatomic, strong) AppModel *model;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
