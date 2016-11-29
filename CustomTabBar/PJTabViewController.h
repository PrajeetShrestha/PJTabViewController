//
//  ViewController.h
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface  PJTabViewController: UIViewController
@property (nonatomic) NSInteger currentIndex;

- (instancetype)initWithControllers:(NSArray *)controllers andTabImages:(NSArray *)tabImages;
@end

