//
//  HUDViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model  = model;
        
        self.v = [[HUDView alloc] initWithFrame:[Util getMainScreenLandscape]];
        [self setView:self.v];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTime:) name:@"NEW_TIME" object:self.model];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateStep:) name:@"NEW_STEP" object:self.model];
        [self updateTime:nil];
        [self updateStep:nil];
        
        self.v.frame = CGRectMake(self.v.frame.origin.x, 260, self.v.frame.size.width, self.v.frame.size.height);
        self.showing = NO;
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    self.previousY = [touch locationInView:nil].y;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MOVE_HUD_TOFRONT" object:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    float versch = [touch locationInView:self.v.superview].y - [touch previousLocationInView:self.v.superview].y;
    self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y + versch, self.v.frame.size.width, self.v.frame.size.height);
    if(self.v.frame.origin.y < 0){
        self.v.frame = CGRectMake(self.v.frame.origin.x, 0, self.v.frame.size.width, self.v.frame.size.height);
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1){
        self.showing = !self.showing;
    }else{
        if(self.v.frame.origin.y < 180){
            self.showing = YES;
        }else{
            self.showing = NO;
        }
    }
}

-(void)setShowing:(BOOL)showing{
    _showing = showing;
    int newY;
    if(showing){
        newY = 0;
    }else{
        newY = 260;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MOVE_HUD_TOBACK" object:self];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, newY, self.v.frame.size.width, self.v.frame.size.height);
    }];
}

-(void)updateTime:(id)sender{
    [self.v.timeMeter setTimeInSeconds:self.model.timeInSeconds];
}

-(void)updateStep:(id)sender{
    [self.v.progressMeter gotoStep:self.model.progress];
    NSString *gametext = [[[self.model.gamedata objectForKey:@"minigames"] objectAtIndex:self.model.progress] objectForKey:@"desc"];
    self.v.lblGameInfo.text = [NSString stringWithFormat:@"%@", [gametext uppercaseString]];
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
