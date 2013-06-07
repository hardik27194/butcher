//
//  InfoView.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 6/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Util.h"

@interface InfoView : UIView <MKMapViewDelegate>

@property (nonatomic, strong) UIImageView *header;
@property (nonatomic, strong) UIButton *btnMenu;
@property (nonatomic, strong) UIImageView *sidebar;
@property (nonatomic, strong) MKMapView *map;
@property (nonatomic) BOOL elemsHidden;

@end
