//
//  HakkenViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 10/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppModel.h"
#import "Util.h"
#import "HakkenView.h"

@interface HakkenViewController : UIViewController <UIAccelerometerDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) HakkenView *v;
@property (nonatomic) int hits;
@property (nonatomic) BOOL started;
@property (nonatomic, strong) AVAudioPlayer *chopSound;
@property (nonatomic, strong) NSTimer *timer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;
@end
