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

-(NSDictionary *)toDictionary{
    NSString *time_in_seconds = [NSString stringWithFormat:@"%d",self.timeInSeconds];
    NSString *meat_id = [NSString stringWithFormat:@"%d",self.meatID];
    NSString *bakwijze_id = [NSString stringWithFormat:@"%d",self.bakwijze];
    NSString *saus_amount = [NSString stringWithFormat:@"%d",self.sausHoeveelheid];
    NSString *saus_id = [NSString stringWithFormat:@"%d",self.sausID];
    NSMutableArray *arrExtras = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"loopke nr°%d",i);
        int nummer;
        if ([self.extras count] >> i) {
            NSNumber *num = (NSNumber *)[self.extras objectAtIndex:i];
            nummer = [num intValue];
        }else{
            nummer = 0;
        }
        [arrExtras addObject: [NSString stringWithFormat:@"%d",nummer]];
    }
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          time_in_seconds,@"time_in_seconds",
                          meat_id,@"meat_id",
                          bakwijze_id,@"bakwijze_id",
                          saus_amount,@"saus_amount",
                          saus_id,@"saus_id",
                          [arrExtras objectAtIndex:0],@"extra1",
                          [arrExtras objectAtIndex:1],@"extra2",
                          [arrExtras objectAtIndex:2],@"extra3",
                          [arrExtras objectAtIndex:3],@"extra4",
                          [arrExtras objectAtIndex:4],@"extra5",
                          self.special,@"special",
                          self.burgerName,@"name",
                          self.username,@"username",
                          self.email,@"email",
                          self.fbid,@"fbid",
                          nil];
    
    return dict;
}

@end
