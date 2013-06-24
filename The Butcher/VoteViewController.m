//
//  VoteViewController.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 13/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "VoteViewController.h"

@interface VoteViewController ()

@end

@implementation VoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIButton *btnMenu = [Util createMenuButtonWithXpos:30 AndYpos:280];
        [btnMenu addTarget:self action:@selector(backToMenu:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect frame = [Util getMainScreenLandscape];
        self.loader = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.loader.frame = CGRectMake((frame.size.width/2)-(self.loader.frame.size.width/2), 150, self.loader.frame.size.width, self.loader.frame.size.height);
        [self.loader startAnimating];
        
        self.webview = [[UIWebView alloc] initWithFrame:[Util getMainScreenLandscape]];
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://student.howest.be/wouter.vandersyppe/20122013/MAIV/FOOD/CLIENT/"]];
        self.webview.allowsInlineMediaPlayback = YES;
        [self.webview loadRequest:req];
        self.webview.delegate = self;
        [self.webview addSubview:btnMenu];
        [self setView:self.webview];
        
    }
    return self;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{

    [self.webview addSubview:self.loader];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.loader removeFromSuperview];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.webview setDelegate:nil];
    [self.webview stopLoading];
}

-(void)backToMenu:(id)sender{
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
