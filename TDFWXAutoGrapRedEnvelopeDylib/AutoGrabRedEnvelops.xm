#import "TDFWeChatHeader.h"
#import <UIKit/UIKit.h>


//分析思路
//1.找到聊天界面VC（BaseMsgContentViewController） HOOK这VC里面所有方法 -- 找到和message相关的方法 -- 分析发现进入VC里面，老消息或新接到消息会调用方法addMessageNode:layout:addMoreMsg: -- 分析函数调用栈，发现调用前面的方法有CMessageMgr里面的MainThreadNotifyToExt:，但是这个方法会调用多次，而且进入消息页面，每条老消息都会调用这方法 -- hook CMessageMgr里面所有方法，发现onNewSyncAddMessage:方法，只要来了消息，不管在不在消息页面，都会调用这个方法，且进入消息页面，老消息不会触发这个方法。
//2.分析点开的红包页面，最终点击 开 红包会触发WCRedEnvelopesReceiveHomeView里面的OnOpenRedEnvelopes方法，但是OnOpenRedEnvelopes方法的触发是依赖于页面点击的，不能做到自动抢红包，所以要进一步静态分析OnOpenRedEnvelopes方法内部代码(通过IDA看汇编代码)，看看最终抢红包调用的是哪个方法 --- 静态分析得出OnOpenRedEnvelopes方法里面其实是调用了WCRedEnvelopesReceiveHomeViewDelegate协议的WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes方法，WCRedEnvelopesReceiveControlLogic类实现了这个协议方法
//3.点击了 开 红包，会调用到WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes方法。静态分析该方法，汇编代码转成OC代码，用转化后OC代码重新实现该方法。发现可以抢红包成功，到这里离成功就差一步了。这一步就是 现在还是手动点击 开 触发了这个方法的调用，只要在来了红包消息能自动触发这个方法调用就能现实自动抢红包。


%hook BaseMsgContentViewController
- (void)addMessageNode:(id)arg1 layout:(_Bool)arg2 addMoreMsg:(_Bool)arg3
{
    %orig;
}
%end

%hook CMessageMgr
- (void)MainThreadNotifyToExt:(id)arg1
{
    %orig;
}
//不管在不在消息页面，来了新消息，都会调用这个方法
- (void)onNewSyncAddMessage:(id)arg1
{
    %orig;
    //arg1里面有个字段type标示消息类型，type=49是红包消息
}
%end

%hook WCRedEnvelopesReceiveHomeView
//点击红包页面 开 按钮触发的方法
- (void)OnOpenRedEnvelopes
{
    //通过分析汇编代码，恢复oc代码如下
    NSDictionary *dict = MSHookIvar<NSDictionary *>(self, "m_dicBaseInfo");
    WCRedEnvelopesReceiveControlLogic *delegate = MSHookIvar<WCRedEnvelopesReceiveControlLogic *>(self, "m_delegate");
    [delegate WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes];
}
%end

%hook WCRedEnvelopesReceiveControlLogic
//通过汇编代码还原OC代码
- (void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes
{
//    %orig;
    
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self , "m_data");
    CMessageWrap *msgWrap = MSHookIvar<CMessageWrap *>(m_data, "m_oSelectedMessageWrap");
    WCPayInfoItem *payInfoItem = [msgWrap m_oWCPayInfoItem];
    
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    //调用类方法的时候，直接用类名调有问题，需要用 %c(类名称) 方式调用。
    NSDictionary *url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];

    //下面开始拼接调开红包接口，需要的参数
    NSMutableDictionary *mutable_dic = [%c(NSMutableDictionary) dictionary];
    [mutable_dic setObject:@"1" forKey:@"msgType"];
    [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
    [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
    
    MMServiceCenter *mmserCent = [%c(MMServiceCenter) defaultCenter];
    Class ccmgr = [%c(CContactMgr) class];
    CContactMgr *contactMgr = [mmserCent getService:ccmgr];
    CContact *selfContact = [contactMgr getSelfContact];
    NSString *displayName = [selfContact getContactDisplayName];
    [mutable_dic setObject:displayName forKey:@"nickName"];
    [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
    
    if (msgWrap) {
        NSString *nativeUrl = c2cNativeUrl;
        [mutable_dic setObject:nativeUrl forKey:@"nativeUrl"];
    }
    
    MMMsgLogicManager *reLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(MMMsgLogicManager) class]];
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
    
    WCPayLogicMgr *payLogic = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCPayLogicMgr) class]];
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^(){
        WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEnvelopesLogicMgr OpenRedEnvelopesRequest:mutable_dic];
    } denyCallback:^(){
        
    }];
}
%end




