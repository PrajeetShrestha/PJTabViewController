//
//  ViewController.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/28/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "ViewController.h"
#import "PJTabViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)push:(id)sender {
    NSArray *images = @[@"1",@"2",@"3",@"4",@"5",@"6"];

    PJTabViewController *tab = [[PJTabViewController alloc]initWithControllers:[self controllersArray]
                                                                  andTabImages:images
                                                              andConfiguration:[PJTabConfiguration new]];
    [self showViewController:tab sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)controllersArray {
    
    UIViewController *controller1 = [UIViewController new];
    controller1.view.backgroundColor = [UIColor grayColor];
    controller1.title = @"v1";
    
    UIViewController *controller2 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    controller2.title = @"v2";
    
    UIViewController *controller3 = [UIViewController new];
    controller3.view.backgroundColor = [UIColor purpleColor];
    controller3.title = @"v3";
    
    UIViewController *controller4 = [UIViewController new];
    controller4.view.backgroundColor = [UIColor magentaColor];
    controller4.title = @"v4";
    
    UIViewController *controller5 = [UIViewController new];
    controller5.view.backgroundColor = [UIColor darkGrayColor];
    controller5.title = @"v5";
    
    UIViewController *controller6 = [UIViewController new];
    controller6.view.backgroundColor = [UIColor cyanColor];
    controller6.title = @"v6";
    
    return  @[controller1,controller2,controller3,controller4,controller5,controller6];
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
