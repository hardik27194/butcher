//
//  SubmitViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 15/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "SubmitViewController.h"

@interface SubmitViewController ()

@end

@implementation SubmitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andModel:(AppModel *)model
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.model = model;
        
        self.v = [[SubmitView alloc] initWithFrame:[Util getGameFrame]];
        [self setView:self.v];
        
        self.v.txt.delegate = self;
        [self.v.btnSave addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)submit:(id)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y +110, self.v.frame.size.width, self.v.frame.size.height);
    }];
    self.model.burgerName = self.v.txt.text;
    self.v.txt.userInteractionEnabled = NO;
    [self.v.txt resignFirstResponder];
    self.v.btnSave.userInteractionEnabled = NO;
    self.v.btnSave.alpha = 0;
    [self.v addSubview:self.v.loader];
    [self.v.loader startAnimating];
    if (FBSession.activeSession.state == FBSessionStateOpen) {
        NSLog(@"logged in");
        [self readFBData];
    } else {
        NSLog(@"not logged in");
        [FBSession openActiveSessionWithReadPermissions:[NSArray arrayWithObjects:@"basic_info",@"email", nil] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            [self sessionStateChanged:session state:status error:error];
            NSLog(@"session changed: %@",session);

        }];
    }

}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
//    NSLog(@"session changed: %@",session);
//    [self readFBData];

    switch (state) {
        case FBSessionStateOpen: 
            NSLog(@"logged in in switch");
            [self readFBData];
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            self.v.btnSave.userInteractionEnabled = YES;
            self.v.txt.userInteractionEnabled = YES;
            self.v.btnSave.alpha = 1;
            [self.v.loader removeFromSuperview];
            break;
        default:
            break;
    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }    
}

-(void)readFBData{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if(!error){
                self.model.username = [result objectForKey:@"name"];;
                self.model.fbid = [result objectForKey:@"id"];
                self.model.email = [result objectForKey:@"email"];
                [self post];
            }else{
                NSLog(@"error: %@",error);
            }
        }];
    }
}

-(void)post{
    NSURL *url = [NSURL URLWithString:@"http://student.howest.be/wouter.vandersyppe/20122013/MAIV/FOOD/api/"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    [httpClient postPath:@"burger" parameters:[self.model toDictionary] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [FBSession openActiveSessionWithPublishPermissions:[NSArray arrayWithObjects:@"publish_stream", nil] defaultAudience:FBSessionDefaultAudienceFriends allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            if (status == FBSessionStateOpen) {
                [[FBRequest requestForPostStatusUpdate:[NSString stringWithFormat:@"I just butchered the Perfect Burger out of the Perfect Meat. Vote for \"%@\" on http://bit.ly/justsomemeat",self.model.burgerName] ] startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                    [self postDone];
                }];
            }
        }];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
}

-(void)postDone{
    NSLog(@"all done!");
    UIImage *img = [Util createImageFromPNG:@"done" InDirectory:@"img/game/7" DoYouWantImageView:NO];
    self.v.img.frame = CGRectMake((self.v.frame.size.width/2)-(img.size.width/2), self.v.img.frame.origin.y , img.size.width, img.size.height);
    self.v.img.image = img;
    [self.v.txt removeFromSuperview];
    [self.v.textbox removeFromSuperview];
    [self.v.btnSave removeFromSuperview];
    [self.v.loader removeFromSuperview];
    UIButton *menu = [Util createMenuButtonWithXpos:((self.v.frame.size.width/2) - 32) AndYpos:200];
    [self.v addSubview:menu];
    [menu addTarget:self action:@selector(btnMenuHandler:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnMenuHandler:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ALL_DONE" object:self];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y -110, self.v.frame.size.width, self.v.frame.size.height);
    }];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.v.txt resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        self.v.frame = CGRectMake(self.v.frame.origin.x, self.v.frame.origin.y +110, self.v.frame.size.width, self.v.frame.size.height);
    }];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField.text length] >= 4) {
        self.v.btnSave.userInteractionEnabled = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.v.btnSave.alpha = 1;
        }];
    }else{
        self.v.btnSave.userInteractionEnabled = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.v.btnSave.alpha = 0.5;
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
