//
//  PJTabAppearance.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/29/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "PJTabConfiguration.h"

@implementation PJTabConfiguration
- (instancetype) init {
    self = [super init];
    if (self) {
        //Set Default properties
        self.tabBarBackgroundColor = [UIColor blackColor];
        self.tabItemWidth = 80;
        self.tabBarHeight = 44;
        self.activeBackgroundColor = [UIColor clearColor];
        self.activeTextColor = [UIColor orangeColor];
        self.inactiveTextColor = [UIColor whiteColor];
        self.inactiveBackgroundColor = [UIColor clearColor];
        self.tabImageActiveTintColor = [UIColor orangeColor];
        self.tabImageInactiveTintColor = [UIColor whiteColor];
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    }
    return self;
}
@end
