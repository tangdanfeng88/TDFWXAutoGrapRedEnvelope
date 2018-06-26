//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  TDFWXAutoGrapRedEnvelopeDylib.h
//  TDFWXAutoGrapRedEnvelopeDylib
//
//  Created by 汤丹峰 on 2018/6/26.
//  Copyright (c) 2018年 tangdanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INSERT_SUCCESS_WELCOME @"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍"

@interface CustomViewController

@property (nonatomic, copy) NSString* newProperty;

+ (void)classMethod;

- (NSString*)getMyName;

- (void)newMethod:(NSString*) output;

@end
