//
//  NRBubbleFrame.m
//  messages-ios
//
//  Created by liyangjun on 15/7/14.
//  Copyright (c) 2015年 Terry Worona. All rights reserved.
//

#import "NRBubbleFrame.h"

@implementation NRBubbleFrame

+(CGFloat)bubbleViewWidth{
    return [UIScreen mainScreen].bounds.size.width - (kTWMessageViewControllerCellPadding*2);
}

+(CGRect)getFrameWithEnglishContent:(NSString *)content{
    NSDictionary *attribute = @{NSFontAttributeName: BubbleContentFont};
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake([NRBubbleFrame bubbleViewWidth] - 5*2, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine |
     NSStringDrawingUsesLineFragmentOrigin |
                         NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    CGFloat contentX = 8;
    CGFloat contentY = 8;
    CGRect contentRect = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    return contentRect;
}

@end
