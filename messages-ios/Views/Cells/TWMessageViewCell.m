//
//  TWMessageViewCell.m
//  spud-ios
//
//  Created by Terry Worona on 8/15/13.
//  Copyright (c) 2013 Terry Worona. All rights reserved.
//

#import "TWMessageViewCell.h"

@interface TWMessageViewCell (){
    NRBubbleView *bubbleView;
}

@end

@implementation TWMessageViewCell

-(void)setContent:(NSString *)content{
    if(bubbleView == nil){
        bubbleView = [[NRBubbleView alloc] initWithContent:content];
        [self.contentView addSubview:bubbleView];
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = 15;
    }else {
        [bubbleView refereshContent:content];
    }
    
    bubbleView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}




@end
