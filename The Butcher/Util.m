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
    NSString *path = [[NSBundle mainBundle] pathForResource:pngName ofType:@"png" inDirectory:dir];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
    if(imgView){
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        return imgView;
    }else{
        return img;
    }
}

+ (UIButton *)createMenuButtonWithXpos:(CGFloat)x AndYpos:(CGFloat)y{
    UIImage *btnMenuImg = [self createImageFromPNG:@"btnMenu" InDirectory:@"img" DoYouWantImageView:NO];
    UIImage *btnMenuDownImg = [self createImageFromPNG:@"btnMenuDown" InDirectory:@"img" DoYouWantImageView:NO];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, btnMenuImg.size.width, btnMenuImg.size.height)];
    [btn setBackgroundImage:btnMenuImg forState:UIControlStateNormal];
    [btn setBackgroundImage:btnMenuDownImg forState:UIControlStateHighlighted];
    return btn;
}



@end
