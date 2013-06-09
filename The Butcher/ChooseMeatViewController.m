//
//  ChooseMeatViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 9/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ChooseMeatViewController.h"

@interface ChooseMeatViewController ()

@end

@implementation ChooseMeatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[ChooseMeatView alloc] initWithFrame:[Util getMainScreenLandscape]];
        [self setView:self.v];
        
        [self.v.btnMeat1 addTarget:self.v.btnMeat1 action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat2 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat3 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat4 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat5 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat6 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)meatClickHandler:(id)sender{
    NSLog(@"geklikt op %@",sender);
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
