//
//  SpecialViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SpecialViewController.h"

@interface SpecialViewController ()

@end

@implementation SpecialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[SpecialView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        self.v.txt.delegate = self;
        
        [self.v.btnDone addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)submit:(id)sender{
    self.model.special = self.v.txt.text;
    self.model.progress = 7;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y -100, self.v.frame.size.width, self.v.frame.size.height);
    }];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.v.txt resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y +100, self.v.frame.size.width, self.v.frame.size.height);
    }];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField.text length] >= 3) {
        self.v.btnDone.userInteractionEnabled = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.v.btnDone.alpha = 1;
        }];
    }else{
        self.v.btnDone.userInteractionEnabled = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.v.btnDone.alpha = 0.5;
        }];
    }
    return YES;
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
