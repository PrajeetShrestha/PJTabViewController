//
//  PJTabAppearance.h
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/29/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface PJTabConfiguration : NSObject
@property (nonatomic) NSInteger tabItemWidth;
@property (nonatomic) NSInteger tabBarHeight;
@property (nonatomic, strong) UIColor *activeBackgroundColor;
@property (nonatomic, strong) UIColor *inactiveBackgroundColor;
@property (nonatomic, strong) UIColor *activeTextColor;
@property (nonatomic, strong) UIColor *inactiveTextColor;
@property (nonatomic) NSInteger screenWidth;
@property (nonatomic) NSInteger screenHeight;


@end
