//
//  AppModel.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(id)init{
    self = [super init];
    
    self.progress = 0;
    self.timeInSeconds = 0;
    
    NSString *gamedataPath = [[NSBundle mainBundle] pathForResource:@"gameData" ofType:@"plist"];
    self.gamedata = [NSDictionary dictionaryWithContentsOfFile:gamedataPath];
    
    NSLog(@"%@",self.gamedata);
    return self;
}

-(void)setProgress:(int)progress{
    _progress = progress;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NEW_STEP" object:self];
}

-(void)setTimeInSeconds:(int)timeInSeconds{
    _timeInSeconds = timeInSeconds;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NEW_TIME" object:self];
}

@end
