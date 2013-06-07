//
//  AppModel.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
//@synthesize progress = _progress;

-(id)init{
    self = [super init];
    
    self.progress = 0;
    
    return self;
}

-(void)setProgress:(int)progress{
    _progress = progress;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NEW_STEP" object:self];
}

@end
