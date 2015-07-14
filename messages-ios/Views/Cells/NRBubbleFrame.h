//
//  NRBubbleFrame.h
//  messages-ios
//
//  Created by liyangjun on 15/7/14.
//  Copyright (c) 2015年 Terry Worona. All rights reserved.
//


#import <UIKit/UIKit.h>

#define BubbleContentFont [UIFont systemFontOfSize:14]//内容字体

CGFloat const kTWMessageViewControllerCellPadding = 10;

@interface NRBubbleFrame : NSObject

+(CGRect)getFrameWithEnglishContent:(NSString *)content;

@end
