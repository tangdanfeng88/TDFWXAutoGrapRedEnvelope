//
//  WeChatRedEnvelopParamQueue.h
//  TDFWXAutoGrapRedEnvelopeDylib
//
//  Created by 汤丹峰 on 2018/7/21.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChatRedEnvelopParamQueue : NSObject
+ (instancetype)sharedQueue;
- (void)enqueue:(NSMutableDictionary *)param;
- (NSMutableDictionary *)dequeue;
@end
