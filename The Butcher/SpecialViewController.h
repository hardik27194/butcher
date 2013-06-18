//
//  SpecialViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"
#import "Util.h"
#import "SpecialView.h"

@interface SpecialViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) SpecialView *v;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
