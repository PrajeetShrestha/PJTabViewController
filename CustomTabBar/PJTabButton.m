//
//  DBTabButton.m
//  CustomTabBar
//
//  Created by Prajeet Shrestha on 11/25/16.
//  Copyright © 2016 Prajeet Shrestha. All rights reserved.
//

#import "PJTabButton.h"

@implementation PJTabButton

- (id)init
{
    self = [super init];
    if (self)
    {
        self= [self getViewFromMainBundle];
        
    }
    return self;
}

-(PJTabButton *)getViewFromMainBundle {
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"PJTabButton"
                                                      owner:nil
                                                    options:nil];
    
    return (PJTabButton *)[nibViews objectAtIndex:0];
}


@end
