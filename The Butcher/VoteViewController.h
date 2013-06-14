//
//  VoteViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface VoteViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webview;
@property (nonatomic, strong) UIActivityIndicatorView *loader;

@end
