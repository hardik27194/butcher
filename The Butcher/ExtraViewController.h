//
//  ExtraViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "AppModel.h"
#import "ExtraView.h"
#import "Extra.h"

@interface ExtraViewController : UIViewController

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) ExtraView *v;
@property (nonatomic, strong) NSMutableArray *arrExtras;
@property (nonatomic, strong) NSMutableArray *arrGekozenExtras;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
