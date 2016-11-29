//
//  DBTabBar.h
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJTabButton.h"
#import "Constants.h"

@protocol DBTabBarDelegate <NSObject>

- (void) tappedAtIndex:(NSInteger)index;

@end
@interface PJTabBar : UIView

@property (nonatomic,strong) NSMutableArray<PJTabButton *> *buttonViews;
@property (weak,nonatomic) id<DBTabBarDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
- (instancetype)initWithImages:(NSArray *) images andControllerTitles:(NSArray *)titles;
- (void)configure ;
- (void)highLightButtonAtIndex:(NSInteger)index;
@end
