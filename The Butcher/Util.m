//
//  Util.m
//  The Butcher
//
//  Created by Wouter Vandersyppe on 5/06/13.
//  Copyright (c) 2013 devine. All rights reserved.
//

#import "Util.h"

@implementation Util

- (id)init
{
    self = [super init];
    if (self) {
        //initializations
        
    }
    return self;
}

+(CGRect)getMainScreenLandscape{
    CGRect portrait = [[UIScreen mainScreen] bounds];
    
    CGRect landscape = CGRectMake(0, 0, portrait.size.height, portrait.size.width);
    return landscape;
}

+ (id)createImageFromPNG:(NSString *)pngName InDirectory:(NSString *)dir DoYouWantImageView:(BOOL)imgView{
    NSString *path = [[NSBundle mainBundle] pathForResource:pngName ofType:@"pn" inDirectory:dir];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
    if(imgView){
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        return imgView;
    }else{
        return img;
    }
}



@end
