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

//UI界面
@interface NewSettingViewController : UIViewController
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
@end
@interface MMTableViewInfo
- (long long)numberOfSectionsInTableView:(id)arg1;
- (void)switchChange:(UISwitch *)switchView;
- (void)textFieldDidChangeValue:(NSNotification *)notification;
@end

//逻辑分析
@interface WCRedEnvelopesReceiveControlLogic : NSObject
- (void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes;
@end

@interface WCRedEnvelopesControlData : NSObject
- (NSDictionary *)m_structDicRedEnvelopesBaseInfo;
@end

@interface WCPayInfoItem : NSObject
@property (retain, nonatomic) NSString *m_c2cNativeUrl;
@end

@interface CMessageWrap : NSObject
@property (retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@end

@interface WCBizUtil : NSObject
+ (id)dictionaryWithDecodedComponets:(id)agr1 separator:(id)agr2;
@end

@interface MMServiceCenter : NSObject
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end

@interface MMMsgLogicManager : NSObject
- (id)GetCurrentLogicController;
@end

@interface WeixinContentLogicController : NSObject
- (id)m_contact;
@end

@interface CBaseContact
@property (retain, nonatomic) NSString *m_nsHeadImgUrl;
@property (retain, nonatomic) NSString *m_nsUsrName;

@end

@interface CContact : CBaseContact
- (NSString *)getContactDisplayName;
@end

@interface CContactMgr : NSObject
- (CContact *)getSelfContact;
@end

@interface WCPayLogicMgr
- (void)setRealnameReportScene:(unsigned int)arg1;
- (void)checkHongbaoOpenLicense:(id)agr1 acceptCallback:(void(^)())agr2 denyCallback:(void(^)())agr3;
@end

@interface SKBuiltinBuffer_t
@property (retain, nonatomic) NSData *buffer;
@property (nonatomic) int iLen;
@end

@interface BaseResponse
@property (nonatomic) int ret;
@end

@interface HongBaoRes
@property (retain, nonatomic) BaseResponse *baseResponse;
@property (retain, nonatomic) SKBuiltinBuffer_t *retText;
@property (nonatomic) int cgiCmdid;

@end

@interface WCRedEnvelopesLogicMgr : NSObject
- (void)OpenRedEnvelopesRequest:(id)dic;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2;
@end

#endif /* TDFWeChatHeader_h */
