//
//  SausenViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SausenViewController.h"

@interface SausenViewController ()

@end

@implementation SausenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSaus:) name:@"NEW_SAUS" object:self.v.picker];

        self.v = [[SausenView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        [self updateSaus:nil];
        [self.v.btnChoose addTarget:self action:@selector(startDraw:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)startDraw:(id)sender{
    float R = [[[[self.model.gamedata objectForKey:@"sausdetails"]
               objectAtIndex:self.v.picker.currentSaus] objectForKey:@"R"] floatValue]/255.0;
    float G = [[[[self.model.gamedata objectForKey:@"sausdetails"]
                 objectAtIndex:self.v.picker.currentSaus] objectForKey:@"G"] floatValue]/255.0;
    float B = [[[[self.model.gamedata objectForKey:@"sausdetails"]
                 objectAtIndex:self.v.picker.currentSaus] objectForKey:@"B"] floatValue]/255.0;
    
    UIColor *kleur = [UIColor colorWithRed:R green:G blue:B alpha:1];
    self.kleurV = [[SausKleurenView alloc] initWithFrame:[Util getGameFrame] andColor:kleur];
    [self.v.picker removeFromSuperview];
    [self.v.line removeFromSuperview];
    [self.v.lblDesc removeFromSuperview];
    [self.v.lblName removeFromSuperview];
    [self.v.btnChoose removeFromSuperview];
    [self.v addSubview:self.kleurV];
    [self.kleurV.btnDone addTarget:self action:@selector(doneDrawing:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)doneDrawing:(id)sender{
    self.model.sausID = self.v.picker.currentSaus;
    self.model.sausHoeveelheid = 100-(self.kleurV.mouseMoveCount/4);
    self.model.progress = 6;
}

-(void)updateSaus:(id)sender{
    self.v.lblName.text = [[[self.model.gamedata objectForKey:@"sausdetails"]
                            objectAtIndex:self.v.picker.currentSaus]
                           objectForKey:@"name"];
    self.v.lblDesc.text = [[[self.model.gamedata objectForKey:@"sausdetails"]
                            objectAtIndex:self.v.picker.currentSaus]
                           objectForKey:@"desc"];
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
