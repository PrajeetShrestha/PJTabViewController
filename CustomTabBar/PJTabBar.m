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
@end

@implementation PJTabBar
@synthesize scrollView;
- (instancetype)initWithImages:(NSArray *) images andControllerTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        self.images = images;
        self.controllerTitles = titles;
        //[self configure];
    }
    return self;
}
- (void)configure {
    self.scrollView = [UIScrollView new];
    CGFloat height = self.frame.size.height;
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(kTabItemWidth * 6, height);
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.scrollEnabled = true;
    self.buttonViews = [NSMutableArray new];
    
    for (NSString *title in self.controllerTitles) {
        NSInteger index = [self.controllerTitles indexOfObject:title];
        PJTabButton *button = [PJTabButton new];
        button.tag = index;
        button.frame = CGRectMake(index * kTabItemWidth, 0, kTabItemWidth, kTabBarHeight);
        UITapGestureRecognizer *recogniser = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedTabButton:)];
        [button addGestureRecognizer:recogniser];
        [scrollView addSubview:button];
        button.title.text = title;
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
            btn.backgroundColor = [UIColor blueColor];
            [self.scrollView scrollRectToVisible:btn.frame animated:true];
        } else {
            btn.backgroundColor = [UIColor blackColor];
        }
    }
}




@end
