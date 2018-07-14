#import "TDFWeChatHeader.h"
#import <UIKit/UIKit.h>


//分析思路
//1.找到聊天界面VC（BaseMsgContentViewController） HOOK这VC里面所有方法 -- 找到和message相关的方法 -- 分析发现进入VC里面，老消息或新接到消息会调用方法addMessageNode:layout:addMoreMsg: -- 分析函数调用栈，发现调用前面的方法有CMessageMgr里面的MainThreadNotifyToExt:，但是这个方法会调用多次，而且进入消息页面，每条老消息都会调用这方法 -- hook CMessageMgr里面所有方法，发现onNewSyncAddMessage:方法，只要来了消息，不管在不在消息页面，都会调用这个方法，且进入消息页面，老消息不会触发这个方法。
//2.分析点开的红包页面，最终点击 开 红包会触发WCRedEnvelopesReceiveHomeView里面的OnOpenRedEnvelopes方法，但是OnOpenRedEnvelopes方法的触发是依赖于页面点击的，不能做到自动抢红包，所以要进一步静态分析OnOpenRedEnvelopes方法内部代码(通过IDA看汇编代码)，看看最终抢红包调用的是哪个方法。

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
    
}
%end
