//
//  HakkenViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 10/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "HakkenViewController.h"

@interface HakkenViewController ()

@end

@implementation HakkenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[HakkenView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        [self.v.overlay addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchDown];
        self.v.lblMeat.text = [[[[self.model.gamedata objectForKey:@"meatdetails"]
                                objectAtIndex:self.model.meatID-1]
                               objectForKey:@"name"] uppercaseString];
        
        self.hits = 0;
        self.started = NO;
        [[UIAccelerometer sharedAccelerometer] setUpdateInterval:0.1];
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"chop" ofType:@"m4a" ] ];
        NSError *error;
        self.chopSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        self.chopSound.numberOfLoops = 0;
        self.chopSound.delegate = self;
        [self.chopSound prepareToPlay];
        
        

    }
    return self;
}

-(void)startGame:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.v.overlay.alpha = 0;
    } completion:^(BOOL finished) {
        [self.v.overlay removeFromSuperview];
        self.v.overlay = nil;
        self.started = YES;
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerCallback:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }];
}

-(void)timerCallback:(NSTimer *)timer{
    self.model.timeInSeconds++;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    if (acceleration.x < -2.02 && self.started) {
        self.hits++;
    }
}

-(void)setHits:(int)hits{
    [self.chopSound play];
    _hits = hits;
    NSLog(@"hits: %d",self.hits);
    self.v.slider.value = hits;
    switch (hits) {
        case 2:
            self.v.cleaver.image = [Util createImageFromPNG:@"cleaver1" InDirectory:@"img/game/2" DoYouWantImageView:NO];
            break;
            
        case 5:
            self.v.cleaver.image = [Util createImageFromPNG:@"cleaver2" InDirectory:@"img/game/2" DoYouWantImageView:NO];
            break;
            
        case 10:
            self.v.cleaver.image = [Util createImageFromPNG:@"cleaver3" InDirectory:@"img/game/2" DoYouWantImageView:NO];
            break;
            
        case 15:
            self.v.cleaver.image = [Util createImageFromPNG:@"cleaver4" InDirectory:@"img/game/2" DoYouWantImageView:NO];
            break;
            
        case 20:
            [self.timer invalidate];
            self.timer = nil;
            self.started = NO;
            self.model.progress = 3;
            break;
            
        default:
            break;
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self.chopSound prepareToPlay];
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
