//
//  SubmitViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "AFHTTPClient.h"
#import "AppModel.h"
#import "Util.h"
#import "SubmitView.h"

@interface SubmitViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) SubmitView *v;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;

@end
