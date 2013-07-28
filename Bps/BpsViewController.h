//
//  BpsViewController.h
//  E_Supply
//
//  Created by zhangwei on 12-12-27.
//  Copyright (c) 2012年 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BpsViewController : UITableViewController
{

    UISegmentedControl *bpssegmentedControl;
    UIBarButtonItem *bpsrightBarButton;
    
//    显示流程列表
    NSMutableArray *_items;
    NSOperationQueue *_queue;
}

@property (nonatomic, strong) UISegmentedControl *bpssegmentedControl;
@property (nonatomic, strong) UIBarButtonItem *bpsrightBarButton;

@end
