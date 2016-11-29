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
    self.scrollView.backgroundColor = self.configuration.tabBarBackgroundColor;
    CGFloat height = self.frame.size.height;
    scrollView.frame = self.bounds;
    [self addSubview:scrollView];
    CGFloat contentWidth = self.configuration.tabItemWidth * self.controllerTitles.count;
    scrollView.contentSize = CGSizeMake(contentWidth, height);
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.scrollEnabled = true;
    self.buttonViews = [NSMutableArray new];
    [self addTabItems];
    
}

- (void)addTabItems {
    for (NSString *title in self.controllerTitles) {
        NSInteger index = [self.controllerTitles indexOfObject:title];
        PJTabButton *button = [PJTabButton new];
        button.tag = index;
        CGFloat xOffset = index * self.configuration.tabItemWidth;
        button.frame = CGRectMake(xOffset, 0, self.configuration.tabItemWidth, self.configuration.tabBarHeight);
        UITapGestureRecognizer *recogniser = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedTabButton:)];
        [button addGestureRecognizer:recogniser];
        [scrollView addSubview:button];
        button.title.text = title;
        NSString *imageName = self.images[index];
        button.image.image = [UIImage imageNamed:imageName];
        [self renderImage:button.image withColor:self.configuration.tabImageInactiveTintColor];
        button.image.tintColor = [UIColor redColor];
        [self.buttonViews addObject:button];
    }
}

- (void)renderImage:(UIImageView *)imageView withColor:(UIColor *)color {
    UIImage *newImage = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(imageView.image.size, NO, newImage.scale);
    [color set];
    [newImage drawInRect:CGRectMake(0, 0, imageView.image.size.width, newImage.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageView.image = newImage;
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
            btn.title.textColor = self.configuration.activeTextColor;
            [self renderImage:btn.image withColor:self.configuration.tabImageActiveTintColor];
            [self.scrollView scrollRectToVisible:btn.frame animated:true];
        } else {
            btn.backgroundColor = self.configuration.inactiveBackgroundColor;
            btn.title.textColor = self.configuration.inactiveTextColor;
            [self renderImage:btn.image withColor:self.configuration.tabImageInactiveTintColor];
        }
    }
}




@end
