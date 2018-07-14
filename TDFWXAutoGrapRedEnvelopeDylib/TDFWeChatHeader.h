//
//  TDFWeChatHeader.h
//  TDFWXAutoGrapRedEnvelope
//
//  Created by 汤丹峰 on 2018/6/28.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

#ifndef TDFWeChatHeader_h
#define TDFWeChatHeader_h

#import <UIKit/UIKit.h>
#define TDFDefaults [NSUserDefaults standardUserDefaults]
#define TDFNotification [NSNotificationCenter defaultCenter]
#define TDFSWITCHKEY @"TDFSWITCHKEY"
#define TDFTIMEKEY @"TDFTIMEKEY"

@interface NewSettingViewController : UIViewController
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
@end
@interface MMTableViewInfo
- (long long)numberOfSectionsInTableView:(id)arg1;
- (void)switchChange:(UISwitch *)switchView;
- (void)textFieldDidChangeValue:(NSNotification *)notification;
@end


#endif /* TDFWeChatHeader_h */
