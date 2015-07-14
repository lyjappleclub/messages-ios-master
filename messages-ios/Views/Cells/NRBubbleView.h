//
//  NRBubbleView.h
//  messages-ios
//
//  Created by liyangjun on 15/7/14.
//  Copyright (c) 2015年 Terry Worona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRBubbleFrame.h"
@interface NRBubbleView : UIView
@property (nonatomic,strong) UILabel *contentLB;
-(instancetype)initWithContent:(NSString *)content;
-(void)refereshContent:(NSString *)content;

@end
