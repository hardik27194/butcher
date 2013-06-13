//
//  BakkenViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 12/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "BakkenViewController.h"

@interface BakkenViewController ()

@end

@implementation BakkenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[BakkenView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        [self rotateWijzerkeToAngle:[Util radiansFromDegrees:-60]];
        
        self.bakgetal = 0;
        [self.v.overlay addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchDown];
        
    }
    return self;
}

-(void)startGame:(id)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.v.overlay.alpha = 0;
    } completion:^(BOOL finished) {
        [self.v.overlay removeFromSuperview];
    }];
    
    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(timerCallback:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    self.vuursterkte = 20;

    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
                              nil];
    NSError *error;
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    
    if (self.recorder) {
        [self.recorder prepareToRecord];
        [self.recorder record];
        self.recorder.meteringEnabled = YES;
        self.audiotimer = [NSTimer timerWithTimeInterval:0.03 target:self selector:@selector(AudiotimerCallback:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.audiotimer forMode:NSRunLoopCommonModes];
    } else {
        NSLog(@"%@",[error description]);
    }
}

-(void)timerCallback:(NSTimer *)timer{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.v.slider.value += self.vuursterkte;
    } completion:nil];
    
    UIImageView *toFadeOut;
    if (self.v.slider.value >= 120) {
        self.v.lblCooking.text = @"BLUE";
        toFadeOut = self.v.burger0;
    }
    if (self.v.slider.value >= 220) {
        self.v.lblCooking.text = @"RARE";
        toFadeOut = self.v.burger1;
    }
    if (self.v.slider.value >= 320) {
        self.v.lblCooking.text = @"MEDIUM";
        toFadeOut = self.v.burger2;
    }
    if (self.v.slider.value >= 420) {
        self.v.lblCooking.text = @"WELL DONE";
        toFadeOut = self.v.burger3;
    }
    if (self.v.slider.value >= 520) {
        self.v.lblCooking.text = @"BURNED";
        [self endGameBurntBurger:YES];
    }
    [UIView animateWithDuration:4 animations:^{
        toFadeOut.alpha = 0;
    }];
    
}

-(void)AudiotimerCallback:(NSTimer *)timer{
    [self.recorder updateMeters];
    
    if ([self.recorder averagePowerForChannel:0] > -5) {
        self.vuursterkte -= 0.2;
    }
}

-(void)setVuursterkte:(float)vuursterkte{
    _vuursterkte = vuursterkte;
    [self rotateWijzerkeToAngle:[Util radiansFromDegrees:(vuursterkte*6)-60]];
    if(_vuursterkte <= 2){
        [self endGameBurntBurger:NO];
    }

}
-(void)endGameBurntBurger:(BOOL)burnt{
    [self.audiotimer invalidate];
    self.audiotimer = nil;
    [self.timer invalidate];
    self.timer = nil;
    if (burnt) {
        NSLog(@"verbrande burger");
    }else{
        NSLog(@"niet verbrande burger");
        self.model.bakwijze = self.v.slider.value / 100;
        NSLog(@"bakwijze %d",self.model.bakwijze);
        self.model.timeInSeconds += self.v.slider.value /5;
        self.model.progress = 4;
    }
}


-(void)rotateWijzerkeToAngle:(float)a{
    float x = 2.0;
    float y = 14;
    
    CGAffineTransform transform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x-x*cos(a)+y*sin(a),y-x*sin(a)-y*cos(a));
    [UIView animateWithDuration:0.2 animations:^{
        self.v.wijzer.transform = transform;
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
