//
//  ViewController.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "PJTabViewController.h"
#import "PJTabBar.h"
#import "PJTabButton.h"

@interface PJTabViewController ()<UIScrollViewDelegate, DBTabBarDelegate>
@property (strong, nonatomic)  UIScrollView *controllerScrollView;
@property (nonatomic) NSInteger screenWidth;
@property (nonatomic) NSInteger screenHeight;
@property (nonatomic,strong) NSArray *controllers;
@property (nonatomic,strong)  PJTabBar *bar;
@property (nonatomic) NSArray *controllersArray;
@property (nonatomic) NSArray *tabImages;
@end

@implementation PJTabViewController
@synthesize bar;
@synthesize currentIndex;

- (instancetype)initWithControllers:(NSArray *)controllers andTabImages:(NSArray *)tabImages{
    self = [super init];
    if (self) {
        self.controllersArray = controllers;
        self.tabImages = tabImages;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializations];
}

- (void)initializations {
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.controllers = [self controllersArray];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Shouldn't be called in View Did Load since frame wont' be set properly
    
    self.controllerScrollView = [UIScrollView new];
    [self.view addSubview:self.controllerScrollView];
    self.controllerScrollView.frame = CGRectMake(0, 0, _screenWidth, _screenHeight - kTabBarHeight);
    [self setupControllers];
    NSMutableArray *controllerTitles = [NSMutableArray new];
    for (UIViewController *c in self.controllersArray) {
        [controllerTitles addObject:c.title];
    }
    
    bar = [[PJTabBar alloc]initWithImages:_tabImages andControllerTitles:controllerTitles];
    bar.frame = CGRectMake(0, _screenHeight - kTabBarHeight, _screenWidth, kTabBarHeight);
    bar.delegate = self;
    [bar configure];
    
    [self.view addSubview:bar];
    
}

- (void)setupControllers {
    //Controller Scroll View Configuration
    self.controllerScrollView.contentSize = CGSizeMake(self.screenWidth * self.controllers.count, self.controllerScrollView.frame.size.height);
    self.controllerScrollView.pagingEnabled = true;
    self.controllerScrollView.showsHorizontalScrollIndicator = false;
    self.controllerScrollView.delegate = self;
    
    NSArray *controllers = [self controllersArray];
    
    for (UIViewController *controller in controllers) {
        NSInteger index = [controllers indexOfObject:controller];
        [self addChildViewController:controller];
        [controller.view setFrame:CGRectMake(_screenWidth *
                                             index, 0.0f,_screenWidth , self.controllerScrollView.frame.size.height)];
        [self.controllerScrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / _screenWidth ;
    [self.bar highLightButtonAtIndex:self.currentIndex];
}

#pragma mark - TabBarDelegate
- (void)tappedAtIndex:(NSInteger)index {
    CGPoint offset = CGPointMake(index * _screenWidth, 0);
    
    [UIView animateWithDuration:0.3 animations:^ {
        [self.controllerScrollView setContentOffset:offset animated:true];
    }];
}

@end
