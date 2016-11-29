//
//  TabContentViewController.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/29/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "TabContentViewController.h"

@interface TabContentViewController ()

@end

@implementation TabContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbl.text = self.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
