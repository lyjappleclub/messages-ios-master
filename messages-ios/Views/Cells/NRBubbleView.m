//
//  NRBubbleView.m
//  messages-ios
//
//  Created by liyangjun on 15/7/14.
//  Copyright (c) 2015年 Terry Worona. All rights reserved.
//

#import "NRBubbleView.h"

@implementation NRBubbleView

-(instancetype)initWithContent:(NSString *)content{
    self = [super init];
    if(self){
        self.contentLB = [[UILabel alloc] init];
        [self refereshContent:content];
        
        [self addSubview:self.contentLB];
    }
    return self;
}

-(void)refereshContent:(NSString *)content{
    CGRect bubbleFrame = [NRBubbleFrame getFrameWithEnglishContent:content];
    self.contentLB.frame = bubbleFrame;
    self.contentLB.numberOfLines = 0;
    self.contentLB.font = BubbleContentFont;
    self.contentLB.text = content;
}









@end
