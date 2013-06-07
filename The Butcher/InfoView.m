//
//  InfoView.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 6/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.header = [Util createImageFromPNG:@"header" InDirectory:@"img/info" DoYouWantImageView:YES];
        self.header.frame = CGRectMake((frame.size.width/2) - (self.header.frame.size.width/2), 0, self.header.frame.size.width, self.header.frame.size.height);
        [self addSubview:self.header];
        
        self.elemsHidden = NO;
        
        
        self.btnMenu = [Util createMenuButtonWithXpos:40 AndYpos:7];
        [self addSubview:self.btnMenu];
        
        self.sidebar = [Util createImageFromPNG:@"sidebar" InDirectory:@"img/info" DoYouWantImageView:YES];
        self.sidebar.frame = CGRectMake(frame.size.width, self.header.frame.size.height, self.sidebar.frame.size.width, self.sidebar.frame.size.height);
        
        self.map = [[MKMapView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, self.frame.size.width, self.frame.size.height - self.header.frame.size.height)];
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(52.35539,4.892263);
        self.map.region = MKCoordinateRegionMakeWithDistance(coord, 500, 500);
        
        MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
        pin.coordinate = coord;
        self.map.delegate = self;
        [self.map addAnnotation:pin];
        
        [self addSubview:self.map];
        [self addSubview:self.sidebar];

        
        [self showElements];
        
        
        UITapGestureRecognizer *gestureRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        gestureRecogniser.numberOfTapsRequired = 1;
        [self.map addGestureRecognizer:gestureRecogniser];
    }
    return self;
}

-(void)showElements{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = [Util getMainScreenLandscape];
        self.sidebar.frame = CGRectMake(frame.size.width - self.sidebar.frame.size.width, self.header.frame.size.height, self.sidebar.frame.size.width, self.sidebar.frame.size.height);
        self.map.frame = CGRectMake(0, self.header.frame.size.height, frame.size.width - self.sidebar.frame.size.width, frame.size.height - self.header.frame.size.height);
    }];
}

-(void)hideElements{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = [Util getMainScreenLandscape];
        self.sidebar.frame = CGRectMake(frame.size.width, self.header.frame.size.height, self.sidebar.frame.size.width, self.sidebar.frame.size.height);
        self.map.frame = CGRectMake(0, self.header.frame.size.height, frame.size.width, frame.size.height - self.header.frame.size.height);
    }];
}

- (void)handleTap:(UIGestureRecognizer*)tap {
    if (self.elemsHidden) {
        [self showElements];
    }else{
        [self hideElements];
    }
    self.elemsHidden = !self.elemsHidden;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *viewId = @"MKPinAnnotationView";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)
    [self.map dequeueReusableAnnotationViewWithIdentifier:viewId];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:viewId];
    }
    // set your custom image
    annotationView.image = [Util createImageFromPNG:@"pin" InDirectory:@"img/info" DoYouWantImageView:NO];
    return annotationView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
