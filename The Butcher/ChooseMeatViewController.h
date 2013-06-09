//
//  ChooseMeatViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 9/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "ChooseMeatView.h"
#import "AppModel.h"

@interface ChooseMeatViewController : UIViewController

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) ChooseMeatView *v;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
