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
        self.tabItemWidth = 80;
        self.tabBarHeight = 80;
        self.activeBackgroundColor = [UIColor blueColor];
        self.activeTextColor = [UIColor whiteColor];
        self.inactiveBackgroundColor = [UIColor grayColor];
        self.inactiveTextColor = [UIColor whiteColor];
        
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    }
    return self;
}
@end
