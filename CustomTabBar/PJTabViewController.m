//
//  ViewController.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "PJTabViewController.h"
@interface PJTabViewController ()<UIScrollViewDelegate, DBTabBarDelegate>
@property (strong, nonatomic)  UIScrollView *controllerScrollView;
@property (nonatomic,strong) NSArray *controllers;
@property (nonatomic,strong)  PJTabBar *bar;
@property (nonatomic) NSArray *controllersArray;
@property (nonatomic) NSArray *tabImages;
@property (nonatomic) PJTabConfiguration *configuration;
@end

@implementation PJTabViewController
@synthesize bar;
@synthesize currentIndex;

- (instancetype)initWithControllers:(NSArray *)controllers
                       andTabImages:(NSArray *)tabImages
                   andConfiguration:(PJTabConfiguration *)configuration {
    
    self = [super init];
    
    if (self) {
        self.controllersArray = controllers;
        self.tabImages = tabImages;
        self.configuration = configuration;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializations];
}

- (void)initializations {
    
    self.controllers = [self controllersArray];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Shouldn't be called in View Did Load since frame wont' be set properly
    [self setupControllers];
    [self setupTabBar];
}

- (void)setupControllers {
    CGFloat controllerContainerHeight = self.configuration.screenHeight - self.configuration.tabBarHeight;
    CGFloat contentWidth = self.configuration.screenWidth * self.controllers.count;
    //Controller Scroll View Configuration
    self.controllerScrollView = [UIScrollView new];
    [self.view addSubview:self.controllerScrollView];
    self.controllerScrollView.frame = CGRectMake(0, 0, self.configuration.screenWidth,controllerContainerHeight);
    self.controllerScrollView.contentSize = CGSizeMake(contentWidth, self.controllerScrollView.frame.size.height);
    self.controllerScrollView.pagingEnabled = true;
    self.controllerScrollView.showsHorizontalScrollIndicator = false;
    self.controllerScrollView.delegate = self;
    
    NSArray *controllers = [self controllersArray];
    
    for (UIViewController *controller in controllers) {
        NSInteger index = [controllers indexOfObject:controller];
        CGFloat xOffSetForController = self.configuration.screenWidth * index;;
        [self addChildViewController:controller];
        [controller.view setFrame:CGRectMake(xOffSetForController, 0.0f,self.configuration.screenWidth , self.controllerScrollView.frame.size.height)];
        [self.controllerScrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
    }
}


- (void)setupTabBar {
    NSMutableArray *controllerTitles = [NSMutableArray new];
    for (UIViewController *c in self.controllersArray) {
        [controllerTitles addObject:c.title];
    }
    CGFloat yPositionOfTabBar = self.configuration.screenHeight - self.configuration.tabBarHeight;
    
    CGRect frame = CGRectMake(0, yPositionOfTabBar, self.configuration.screenWidth, self.configuration.tabBarHeight);
    bar = [[PJTabBar alloc]initWithImages:_tabImages
                      andControllerTitles:controllerTitles
                            configuration:self.configuration
                                 andFrame:frame];
    bar.delegate = self;
    [self.view addSubview:bar];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / self.configuration.screenWidth ;
    [self.bar highLightButtonAtIndex:self.currentIndex];
}

#pragma mark - TabBarDelegate
- (void)tappedAtIndex:(NSInteger)index {
    CGPoint offset = CGPointMake(index * self.configuration.screenWidth, 0);
    
    [UIView animateWithDuration:0.3 animations:^ {
        [self.controllerScrollView setContentOffset:offset animated:true];
    }];
}

@end
