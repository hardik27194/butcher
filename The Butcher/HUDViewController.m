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
        
        
    }
    return self;
}

-(void)updateTime:(id)sender{
    [self.v.timeMeter setTimeInSeconds:self.model.timeInSeconds];
}

-(void)updateStep:(id)sender{
    [self.v.progressMeter gotoStep:self.model.progress];
    NSString *gametext = [[[self.model.gamedata objectForKey:@"minigames"] objectAtIndex:self.model.progress] objectForKey:@"desc"];
    self.v.lblGameInfo.text = [NSString stringWithFormat:@"%d. %@",self.model.progress, [gametext uppercaseString]];
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
