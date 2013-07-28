//
//  CommViewController.m
//  E_Supply
//
//  Created by zhangwei on 12-12-27.
//  Copyright (c) 2012年 Pixolity Ltd. All rights reserved.
//

#import "CommViewController.h"

@interface CommViewController ()

@end

@implementation CommViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"设置";
        self.tabBarItem.image = [UIImage imageNamed:@"SecondTab.png"];
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
