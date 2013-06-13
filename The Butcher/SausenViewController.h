//
//  SausenViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "AppModel.h"
#import "Sausenpicker.h"
#import "SausenView.h"
#import "SausKleurenView.h"

@interface SausenViewController : UIViewController

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) SausenView *v;
@property (nonatomic, strong) SausKleurenView *kleurV;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
