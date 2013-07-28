//
//  SkinnedSetting.m
//  E_Supply
//
//  Created by zhangwei on 13-1-9.
//  Copyright (c) 2013年 Pixolity Ltd. All rights reserved.
//

#import "SkinnedSetting.h"

@interface SkinnedSetting ()

@end

@implementation SkinnedSetting


- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Setting";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for ( int i=0; i<[[self themes] count]; i++ )
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*100+7, 0, 100, 100);
        button.tag = i;
        
        NSString *image = [NSString stringWithFormat: @"Comm/SkinnedUI/Color/skin_set_%@",
                           [[self themes] objectAtIndex:i]];
        
        [button setImage:IMAGE(image)
                forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(selectThemeAtIndex:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (NSArray *)themes
{
    return @[kThemeRed, kThemeBlack, kThemeBlue];
}

- (void)selectThemeAtIndex:(UIButton *)sender
{
    [[ThemeManager sharedInstance]
     setTheme:[[self themes] objectAtIndex:sender.tag]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
