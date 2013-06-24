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
        
        self.HUDVC = [[HUDViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];

    }
    return self;
}

-(void)newStepHandler:(id)sender{
    switch (self.model.progress) {
        case 1:
            [self.v.gameStartV removeFromSuperview];
            self.v.gameStartV = nil;
            
            //dit comenten bij een kortsluiting van games.
            self.ChooseMeatVC = [[ChooseMeatViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.ChooseMeatVC.v];
            
            [self.v addSubview:self.HUDVC.v];
            [self.HUDVC.v.btnMenu addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
            
            //KORTSLUITEN VAN BEPAALDE GAMES
//            self.model.timeInSeconds = 123;
//            self.model.meatID = 2;
//            self.model.bakwijze =3;
//            self.model.progress = 7;
//            self.model.sausHoeveelheid = 56;
//            self.model.sausID = 2;
//            self.model.extras = [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:12], nil];
//            self.model.special = @"pis kak stront";
            
            break;
            
        case 2:
            [self.ChooseMeatVC.v removeFromSuperview];
            self.ChooseMeatVC = nil;
            
            self.HakkenVC = [[HakkenViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.HakkenVC.v];

            break;
            
        case 3:
            [self.HakkenVC.v removeFromSuperview];
            self.HakkenVC = nil;
            
            self.BakkenVC = [[BakkenViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.BakkenVC.v];
            
            break;
            
        case 4:

            [self.BakkenVC.v removeFromSuperview];
            self.BakkenVC = nil;
            
            self.ExtraVC = [[ExtraViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.ExtraVC.v];
            
            break;
            
        case 5:
            [self.ExtraVC.v removeFromSuperview];
            self.ExtraVC = nil;
            
            self.SausenVC = [[SausenViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.SausenVC.v];
            
            break;
            
        case 6:
            [self.SausenVC.v removeFromSuperview];
            [self.SausenVC.kleurV removeFromSuperview];
            self.SausenVC = nil;
            
            self.specialVC = [[SpecialViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.specialVC.v];
            
            break;
            
        case 7:
            [self.HUDVC.v removeFromSuperview];
            self.HUDVC = nil;
            
            [self.specialVC.v removeFromSuperview];
            self.specialVC = nil;
            
            self.submitVC = [[SubmitViewController alloc] initWithNibName:nil bundle:nil andModel:self.model];
            [self.v addSubview:self.submitVC.v];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMenu:) name:@"ALL_DONE" object:self.submitVC];

            
            //toevoeven van submit..
            NSLog(@"model: %@",self.model);
            break;
        default:
            break;
    }
    [self moveHudToFront:nil];

}

-(void)moveHudToFront:(id)sender{
    [self.HUDVC.v removeFromSuperview];
    [self.v addSubview:self.HUDVC.v];
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
