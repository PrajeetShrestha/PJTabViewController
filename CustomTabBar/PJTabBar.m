//
//  DBTabBar.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//
#import "PJTabBar.h"
@interface PJTabBar()
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSArray *controllerTitles;
@property (nonatomic, strong)PJTabConfiguration *configuration;
@end

@implementation PJTabBar
@synthesize scrollView;
- (instancetype)initWithImages:(NSArray *) images
           andControllerTitles:(NSArray *)titles
                 configuration:(PJTabConfiguration *) configuration
                      andFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.images = images;
        self.controllerTitles = titles;
        self.configuration = configuration;
        [self configure];
    }
    return self;
}
- (void)configure {
    self.scrollView = [UIScrollView new];
    CGFloat height = self.frame.size.height;
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    CGFloat contentWidth = self.configuration.tabItemWidth * self.controllerTitles.count;
    scrollView.contentSize = CGSizeMake(contentWidth, height);
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.scrollEnabled = true;
    self.buttonViews = [NSMutableArray new];
    
    for (NSString *title in self.controllerTitles) {
        NSInteger index = [self.controllerTitles indexOfObject:title];
        PJTabButton *button = [PJTabButton new];
        button.tag = index;
        CGFloat xOffset = index * self.configuration.tabItemWidth;
        button.frame = CGRectMake(xOffset, 0, self.configuration.tabItemWidth, self.configuration.tabBarHeight);
        NSLog(@"Frame: %@",NSStringFromCGRect(button.frame));
        UITapGestureRecognizer *recogniser = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedTabButton:)];
        [button addGestureRecognizer:recogniser];
        [scrollView addSubview:button];
        button.title.text = title;
        NSString *imageName = self.images[index];
        button.image.image = [UIImage imageNamed:imageName];
        [self.buttonViews addObject:button];
    }
}

- (void)tappedTabButton:(UITapGestureRecognizer*)sender {
    PJTabButton *view = (PJTabButton *)sender.view;
    
    [self highLightButtonAtIndex:view.tag];
    if (self.delegate != nil) {
        [self.delegate tappedAtIndex:view.tag];
    }
}

- (void)highLightButtonAtIndex:(NSInteger)index {
    for(PJTabButton *btn in self.buttonViews) {
        NSInteger i = [self.buttonViews indexOfObject:btn];
        if (index == i) {
            btn.backgroundColor = self.configuration.activeBackgroundColor;
            [self.scrollView scrollRectToVisible:btn.frame animated:true];
        } else {
            btn.backgroundColor = self.configuration.inactiveBackgroundColor;
        }
    }
}




@end
