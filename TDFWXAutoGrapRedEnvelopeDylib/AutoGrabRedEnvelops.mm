#line 1 "/Users/tangdanfeng/Documents/iOS/TDFWXAutoGrapRedEnvelope/TDFWXAutoGrapRedEnvelopeDylib/AutoGrabRedEnvelops.xm"
#import "TDFWeChatHeader.h"
#import <UIKit/UIKit.h>








#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WCRedEnvelopesReceiveHomeView; @class CMessageMgr; @class MMMsgLogicManager; @class NSMutableDictionary; @class MMServiceCenter; @class BaseMsgContentViewController; @class WCRedEnvelopesLogicMgr; @class CContactMgr; @class WCBizUtil; @class WCRedEnvelopesReceiveControlLogic; @class WCPayLogicMgr; 
static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, _Bool, _Bool); static void _logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, _Bool, _Bool); static void (*_logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCPayLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMMsgLogicManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMMsgLogicManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMServiceCenter(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMServiceCenter"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }
#line 10 "/Users/tangdanfeng/Documents/iOS/TDFWXAutoGrapRedEnvelope/TDFWXAutoGrapRedEnvelopeDylib/AutoGrabRedEnvelops.xm"


static void _logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, _Bool arg3) {
    _logos_orig$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$(self, _cmd, arg1, arg2, arg3);
}




static void _logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, arg1);
    
}





static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    NSDictionary *dict = MSHookIvar<NSDictionary *>(self, "m_dicBaseInfo");
    WCRedEnvelopesReceiveControlLogic *delegate = MSHookIvar<WCRedEnvelopesReceiveControlLogic *>(self, "m_delegate");
    [delegate WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes];
}





static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

    
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self , "m_data");
    CMessageWrap *msgWrap = MSHookIvar<CMessageWrap *>(m_data, "m_oSelectedMessageWrap");
    WCPayInfoItem *payInfoItem = [msgWrap m_oWCPayInfoItem];
    
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    
    NSDictionary *url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];

    
    NSMutableDictionary *mutable_dic = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    [mutable_dic setObject:@"1" forKey:@"msgType"];
    [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
    [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
    
    MMServiceCenter *mmserCent = [_logos_static_class_lookup$MMServiceCenter() defaultCenter];
    Class ccmgr = [_logos_static_class_lookup$CContactMgr() class];
    CContactMgr *contactMgr = [mmserCent getService:ccmgr];
    CContact *selfContact = [contactMgr getSelfContact];
    NSString *displayName = [selfContact getContactDisplayName];
    [mutable_dic setObject:displayName forKey:@"nickName"];
    [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
    
    if (msgWrap) {
        NSString *nativeUrl = c2cNativeUrl;
        [mutable_dic setObject:nativeUrl forKey:@"nativeUrl"];
    }
    
    MMMsgLogicManager *reLogicMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$MMMsgLogicManager() class]];
    WeixinContentLogicController *currentLogicController = [reLogicMgr GetCurrentLogicController];
    if (currentLogicController) {
        CBaseContact *m_contact = [currentLogicController m_contact];
        if (m_contact) {
            CBaseContact *contact = [currentLogicController m_contact];
            NSString *nsUsrName = [contact m_nsUsrName];
            if (nsUsrName) {
                [mutable_dic setObject:nsUsrName forKey:@"sessionUserName"];
            }
        }
    }
    
    NSDictionary *m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString *timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    if ([timingIdentifier length]) {
        [mutable_dic setObject:timingIdentifier forKey:@"timingIdentifier"];
    }
    
    WCPayLogicMgr *payLogic = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^(){
        WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        [redEnvelopesLogicMgr OpenRedEnvelopesRequest:mutable_dic];
    } denyCallback:^(){
        
    }];
}





static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BaseMsgContentViewController = objc_getClass("BaseMsgContentViewController"); MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(addMessageNode:layout:addMoreMsg:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$);Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(MainThreadNotifyToExt:), (IMP)&_logos_method$_ungrouped$CMessageMgr$MainThreadNotifyToExt$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$MainThreadNotifyToExt$);MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncAddMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$);Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(OnOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes);Class _logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic = objc_getClass("WCRedEnvelopesReceiveControlLogic"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic, @selector(WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes);} }
#line 110 "/Users/tangdanfeng/Documents/iOS/TDFWXAutoGrapRedEnvelope/TDFWXAutoGrapRedEnvelopeDylib/AutoGrabRedEnvelops.xm"
