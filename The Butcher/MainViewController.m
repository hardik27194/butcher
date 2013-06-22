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
        [self.MainView.btnVote addTarget:self action:@selector(showVote:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyScrolled"] && self.MainView.contentOffset.y >= 320){
        NSLog(@"syncing");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"alreadyScrolled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


-(void)checkIfAlreadyScrolled:(id)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"alreadyScrolled"]){
        [self.MainView gotoScreen2];
    }
}

-(void)showInfo:(id)sender{
    self.infoVC = [[InfoViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:self.infoVC animated:YES completion:^{}];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisOverlays:) name:@"SHOW_MENU" object:self.infoVC];
}

-(void)showVote:(id)sender{
    if([Util networkConnectionAvailable]){
        self.voteVC = [[VoteViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:self.voteVC animated:YES completion:^{}];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisOverlays:) name:@"SHOW_MENU" object:self.infoVC];
    }
}

-(void)startGame:(id)sender{
    self.gameVC = [[GameViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:self.gameVC animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisOverlays:) name:@"SHOW_MENU" object:self.gameVC];
}

-(void)dismisOverlays:(id)sender{
    [[self presentedViewController] dismissViewControllerAnimated:YES completion:^{
        self.infoVC = nil;
        self.gameVC = nil;
        self.voteVC = nil;
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
