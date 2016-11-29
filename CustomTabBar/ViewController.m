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
    
    UIViewController *controller1 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    
    controller1.title = @"Opportunities";
    
    UIViewController *controller2 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    controller2.title = @"Games";
    
    UIViewController *controller3 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    
    controller3.title = @"Talent Spots";
    
    UIViewController *controller4 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    
    controller4.title = @"Insight";
    
    UIViewController *controller5 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    
    controller5.title = @"You";
    
    UIViewController *controller6 = [self.storyboard instantiateViewControllerWithIdentifier:@"VRAMBO"];
    
    controller6.title = @"Mobile";
    
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
