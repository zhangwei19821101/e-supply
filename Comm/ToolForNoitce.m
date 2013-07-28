//
//  ToolForNoitce.m
//  NoticeDemo
//
//  Created by lee on 13-1-20.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import "ToolForNoitce.h"

@implementation ToolForNoitce


+(CGFloat)retunScreenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}


+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}


//得到一个字符串的高度
+(float)getStrHeight:(NSString *)tempStr andFont:(UIFont *)tempFont andDisplayWidth:(CGFloat)tempWidth
{
    CGSize constraintSize = CGSizeMake(tempWidth, MAXFLOAT);
    CGSize labelSize = [tempStr sizeWithFont:tempFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeCharacterWrap];
    return labelSize.height;
}


+ (UIColor *)getBackgroundColor
{
    return [UIColor colorWithRed:235.0/255 green:235.0/255 blue:243.0/255 alpha:1.0];
}

//监测网络
+(BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork;
	Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
			isExistenceNetwork=FALSE;
            break;
        case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
            break;
        case ReachableViaWiFi:
			isExistenceNetwork=TRUE;
            break;
    }
    return isExistenceNetwork;
    
}


+(void)showAlertViewWithContent:(NSString *)content
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示信息" message:content delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alertView show];
    [alertView release];
}

@end
