//
//  GameViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
        self.model = [[AppModel alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newStepHandler:) name:@"NEW_STEP" object:self.model];
        
        self.v = [[GameView alloc] initWithFrame:[Util getMainScreenLandscape]];
        [self setView:self.v];
        [self.v.gameStartV.btnMenu addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.gameStartV.btnContinue addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)newStepHandler:(id)sender{
    switch (self.model.progress) {
        case 1:
            [self.v.gameStartV removeFromSuperview];
            self.v.gameStartV = nil;
            
            self.HUDVC = [[HUDViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.HUDVC.v];
            break;
            
        default:
            break;
    }
}


-(void)nextStep:(id)sender{
    self.model.progress++;
}

-(void)showMenu:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_MENU" object:self];
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
