//
//  ExtraViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 14/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "ExtraViewController.h"

@interface ExtraViewController ()

@end

@implementation ExtraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[ExtraView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        self.arrGekozenExtras = [[NSMutableArray alloc] init];
        self.arrExtras = [[NSMutableArray alloc] init];
        int xpos = (self.v.picker.frame.size.width /2)-70;
        
        for (int i = 0; i < [[self.model.gamedata objectForKey:@"extras"] count]; i++) {
            Extra *extra = [[Extra alloc] initWithFrame:CGRectMake(xpos, 0, 140, 140) andData:[[self.model.gamedata objectForKey:@"extras"] objectAtIndex:i]];
            [self.v.picker addSubview:extra];
            [self.arrExtras addObject:extra];
            [extra.btnAdd addTarget:self action:@selector(addExtra:) forControlEvents:UIControlEventTouchUpInside];
            xpos += 140;
        }
        self.v.picker.contentSize = CGSizeMake(xpos - 70 +(self.v.picker.frame.size.width /2), 140);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickerMovedHandler:) name:@"MOVED" object:self.v.picker];
        [self.v.btnDone addTarget:self action:@selector(doneHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        [self viewDidLoad];
    }
    return self;
}

-(void)addExtra:(Extra *)sender{
    Extra *x = (Extra *)sender.superview;
    NSNumber *extraId = [NSNumber numberWithInt:x.extraId];
    
    if (x.toegevoegd) {
        x.toegevoegd = NO;
        [self.arrGekozenExtras removeObject:extraId];
        self.v.lblHoeveelheid.textColor = [UIColor blackColor];
    }else{
        if([self.arrGekozenExtras count] >= 5){
            [self.v animateTxt];
        }else{
            x.toegevoegd = YES;
            [self.arrGekozenExtras addObject:extraId];
        }
    }
    self.v.lblHoeveelheid.text = [NSString stringWithFormat:@"%d/5",[self.arrGekozenExtras count]];
    
    if([self.arrGekozenExtras count] <= 0){
        self.v.btnDone.alpha = 0.5;
        self.v.btnDone.userInteractionEnabled = NO;
    }else{
        self.v.btnDone.alpha = 1;
        self.v.btnDone.userInteractionEnabled = YES;
    }
}

-(void)pickerMovedHandler:(id)sender{
    int cur = [[[sender userInfo] objectForKey:@"currentSelected"] intValue ];
    Extra *x = [self.arrExtras objectAtIndex:cur];
    
    for (Extra *x2 in self.arrExtras) {
        if(x2 == x){
            [x2 showButton];
        }else{
            [x2 hideButton];
        }
    }
}

-(void)doneHandler:(id)sender{
    self.model.extras = [NSArray arrayWithArray:self.arrGekozenExtras];
    self.model.timeInSeconds += (20 * [self.arrGekozenExtras count]);
    self.model.progress = 5;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Extra *x = [self.arrExtras objectAtIndex:0];
    [x showButton];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
