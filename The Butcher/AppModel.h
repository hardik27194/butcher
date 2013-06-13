//
//  AppModel.h
//  The Butcher
//
//  Created by Wouter Vandersyppe on 7/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property (nonatomic) int progress;
@property (nonatomic) int timeInSeconds;
@property (nonatomic) int meatID;
@property (nonatomic) int bakwijze;
@property (nonatomic) int sausHoeveelheid;
@property (nonatomic) int sausID;

@property (nonatomic, strong) NSDictionary *gamedata;
@end
