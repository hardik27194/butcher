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
        
        self.v = [[ChooseMeatView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        [self.v.btnMeat1 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat2 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat3 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat4 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat5 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.v.btnMeat6 addTarget:self action:@selector(meatClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.showingOverlay = NO;
        
        [self.v.btnChoose addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)submit:(id)sender{
    self.model.progress++;
    self.model.timeInSeconds += 63;
}

-(void)meatClickHandler:(id)sender{
    UIButton *target = sender;
    if(self.showingOverlay){
        //toon alles
        [self enableButtons];
        [self dismissDetail:target];
        self.showingOverlay = !self.showingOverlay;
        
    }else{
        //toon detail
        [self disableButtons];
        self.showingOverlay = !self.showingOverlay;
        target.userInteractionEnabled = YES;
        target.alpha = 1;
        [self showDetail:target];
    }
}

-(void)showDetail:(UIButton *)btnMeat{
    self.model.meatID = [btnMeat.titleLabel.text intValue];
    self.previousFrame = btnMeat.frame;
    
    self.v.lblMeatInfo.text = [[[self.model.gamedata objectForKey:@"meatdetails"]
                                objectAtIndex:[btnMeat.titleLabel.text intValue]-1]
                               objectForKey:@"desc"];
    [self.v addSubview:self.v.lblMeatInfo];
    [self.v addSubview:self.v.btnChoose];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        btnMeat.frame = CGRectMake((self.v.frame.size.width/2)-(btnMeat.frame.size.width/2),
                                   (self.v.frame.size.height/4) - (btnMeat.frame.size.height/2),
                                   btnMeat.frame.size.width,
                                   btnMeat.frame.size.height);
        self.v.lblMeatInfo.alpha = 1;
        self.v.btnChoose.alpha = 1;
    }];
    
    self.v.lblMeatInfo.frame = CGRectMake(self.v.lblMeatInfo.frame.origin.x,
                                          btnMeat.frame.origin.y + 10 + btnMeat.frame.size.height,
                                          self.v.lblMeatInfo.frame.size.width,
                                          self.v.lblMeatInfo.frame.size.height);
}

-(void)dismissDetail:(UIButton *)btnMeat{
    
    [UIView animateWithDuration:0.5 animations:^{
        btnMeat.frame = self.previousFrame;
        self.v.lblMeatInfo.alpha = 0;
        self.v.btnChoose.alpha = 0;
    } completion:^(BOOL finished) {
        [self.v.lblMeatInfo removeFromSuperview];
        [self.v.btnChoose removeFromSuperview];
    }];
}

-(void)disableButtons{
    self.v.btnMeat1.userInteractionEnabled = self.v.btnMeat2.userInteractionEnabled = self.v.btnMeat3.userInteractionEnabled = self.v.btnMeat4.userInteractionEnabled = self.v.btnMeat5.userInteractionEnabled = self.v.btnMeat6.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.v.btnMeat1.alpha = self.v.btnMeat2.alpha = self.v.btnMeat3.alpha = self.v.btnMeat4.alpha = self.v.btnMeat5.alpha = self.v.btnMeat6.alpha = 0.04;
    }];
}

-(void)enableButtons{
    self.v.btnMeat1.userInteractionEnabled = self.v.btnMeat2.userInteractionEnabled = self.v.btnMeat3.userInteractionEnabled = self.v.btnMeat4.userInteractionEnabled = self.v.btnMeat5.userInteractionEnabled = self.v.btnMeat6.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.v.btnMeat1.alpha = self.v.btnMeat2.alpha = self.v.btnMeat3.alpha = self.v.btnMeat4.alpha = self.v.btnMeat5.alpha = self.v.btnMeat6.alpha = 1;
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
    // Dispose of any resources that an be recreated.
}

@end
