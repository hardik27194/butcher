//
//  BakkenViewController.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 12/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "Util.h"
#import "BakkenView.h"
#import "AppModel.h"

@interface BakkenViewController : UIViewController

@property (nonatomic, strong) BakkenView *v;
@property (nonatomic, strong) AppModel *model;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *audiotimer;
@property (nonatomic, strong) AVAudioRecorder *recorder;

@property (nonatomic) float bakgetal;
@property (nonatomic) float vuursterkte;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model;


@end
