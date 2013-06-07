//
//  MainViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 5/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.MainView = [[MainView alloc] initWithFrame:[Util getMainScreenLandscape]];
        self.MainView.backgroundColor = [UIColor blackColor];
        [self.MainView setDelegate:self];
        [self setView:self.MainView];
        self.MainView.showsHorizontalScrollIndicator = NO;
        self.MainView.showsVerticalScrollIndicator = NO;
        self.MainView.pagingEnabled = YES;
        
        self.showingArrows = NO;
        [self performSelector:@selector(checkIfAlreadyScrolled:) withObject:nil afterDelay:0.1];
        
        
        [self.MainView.btnInfo addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
        [self.MainView.btnMakeBurger addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(self.MainView.contentOffset.y >= 120 && self.MainView.contentOffset.y < 320){
        self.MainView.screen2.alpha = (self.MainView.contentOffset.y -120)/200;
    }
    if(self.MainView.contentOffset.y >= 320){
        self.MainView.screen2.alpha = 1;
        if(!self.showingArrows){
            [self performSelector:@selector(showArrows:) withObject:nil afterDelay:2];
            self.showingArrows = YES;
        }
    }
    if(self.MainView.contentOffset.y < 120){
        self.MainView.screen2.alpha = 0;
    }
    if(self.MainView.contentOffset.y >= 350 && self.MainView.contentOffset.y <= 500){
        self.MainView.screen3.alpha = (self.MainView.contentOffset.y -350)/150;
    }
    if(self.MainView.contentOffset.y >= 480 && self.MainView.contentOffset.y <= 580){
        self.MainView.btnMakeBurger.alpha = (self.MainView.contentOffset.y -480)/100;
    }
    if(self.MainView.contentOffset.y >= 540 && self.MainView.contentOffset.y <=640){
        self.MainView.btnInfo.alpha = (self.MainView.contentOffset.y -540)/100;
        self.MainView.btnVote.alpha = (self.MainView.contentOffset.y -540)/100;
    }
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyScrolled"] && self.MainView.contentOffset.y > 500){
        NSLog(@"syncing");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"alreadyScrolled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(void)showArrows:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.MainView.screen2Arrows.alpha = 1;
    } completion:^(BOOL finished) {
        //
    }];
}

-(void)checkIfAlreadyScrolled:(id)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyScrolled"]){
        [self.MainView gotoScreen3];
        self.MainView.screen3.alpha = self.MainView.btnVote.alpha = self.MainView.btnInfo.alpha =   self.MainView.btnMakeBurger.alpha = 1;
    }
}

-(void)showInfo:(id)sender{
    self.infoVC = [[InfoViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:self.infoVC animated:YES completion:^{}];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisOverlays:) name:@"SHOW_MENU" object:self.infoVC];
}

-(void)startGame:(id)sender{
    self.gameVC = [[GameViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:self.gameVC animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisOverlays:) name:@"SHOW_MENU" object:self.gameVC];
}

-(void)dismisOverlays:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        self.infoVC = nil;
        self.gameVC = nil;
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
