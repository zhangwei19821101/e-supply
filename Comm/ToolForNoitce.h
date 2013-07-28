//
//  ToolForNoitce.h
//  
//
//  Created by lee on 13-1-20.
//  Copyright (c) 2013年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"


@interface ToolForNoitce : NSObject

+(CGFloat)retunScreenHeight;

+(void)setExtraCellLineHidden: (UITableView *)tableView;

+(float)getStrHeight:(NSString *)tempStr andFont:(UIFont *)tempFont andDisplayWidth:(CGFloat)tempWidth;

+ (UIColor *)getBackgroundColor;

+(BOOL)isExistenceNetwork;

+(void)showAlertViewWithContent:(NSString *)content;

@end