//
//  ViewController.h
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJTabConfiguration.h"
#import "PJTabBar.h"
#import "PJTabButton.h"

@interface  PJTabViewController: UIViewController
@property (nonatomic) NSInteger currentIndex;
- (instancetype)initWithControllers:(NSArray *)controllers andTabImages:(NSArray *)tabImages andConfiguration:(PJTabConfiguration *)configuration ;
@end

