//
//  WeChatRedEnvelopParamQueue.m
//  TDFWXAutoGrapRedEnvelopeDylib
//
//  Created by 汤丹峰 on 2018/7/21.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

#import "WeChatRedEnvelopParamQueue.h"

@interface WeChatRedEnvelopParamQueue()
@property (nonatomic, strong) NSMutableArray *queue;
@end
@implementation WeChatRedEnvelopParamQueue
+ (instancetype)sharedQueue
{
    static WeChatRedEnvelopParamQueue *queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[WeChatRedEnvelopParamQueue alloc] init];
    });
    return queue;
}
- (instancetype)init
{
    if (self = [super init]) {
        _queue = [NSMutableArray array];
    }
    return self;
}
- (void)enqueue:(NSMutableDictionary *)param
{
    [self.queue addObject:param];
}
- (NSMutableDictionary *)dequeue
{
    if (self.queue.count==0 && !self.queue.firstObject) {
        return nil;
    }
    NSMutableDictionary *first = self.queue.firstObject;
    [self.queue removeObjectAtIndex:0];
    return first;
}
@end
