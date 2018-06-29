#import "TDFWeChatHeader.h"
#import <UIKit/UIKit.h>

%hook MMTableViewInfo

%new
- (void)switchChange:(UISwitch *)switchView
{
    [TDFDefaults setBool:switchView.isOn forKey:TDFSWITCHKEY];
    [TDFDefaults synchronize];
}
%new
- (void)textFieldDidChangeValue:(NSNotification *)notification
{
    UITextField *sender = (UITextField *)[notification object];
    [TDFDefaults setValue:sender.text forKey:TDFTIMEKEY];
    [TDFDefaults synchronize];
}

//tableView结束编辑，让键盘消失
- (void)scrollViewWillBeginDragging:(id)arg1
{
    %orig;
    [MSHookIvar <UITableView *>(self,"_tableView") endEditing:YES];//MMTableViewInfo 是MMTableView的代理，里面有个成员变量_tableView指向MMTableView
}

//多少组
- (long long)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSMutableArray *arr = MSHookIvar<NSMutableArray *>(self, "_arrSections");
//    NSLog(@"arrSections----%ld", arr.count);
    
    if ([tableView.nextResponder.nextResponder isKindOfClass: %c(NewSettingViewController)]) { //定位设置界面
        return %orig + 1; //多搞一组
    } else {
        return %orig;
    }
}
//每组多少行
- (long long)tableView:(UITableView *)tableView numberOfRowsInSection:(long long)section
{
    if ([tableView.nextResponder.nextResponder isKindOfClass: %c(NewSettingViewController)]
        && section == [self numberOfSectionsInTableView:tableView]-1) { //定位设置界面，并且是最后一组
        return 2; //新加2行
    } else {
        return %orig;
    }
}

//每行高度
- (double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(id)indexPath
{
    if ([tableView.nextResponder.nextResponder isKindOfClass: %c(NewSettingViewController)]
        && [indexPath section] == [self numberOfSectionsInTableView:tableView]-1) { //定位设置界面，并且是最后一组
        return 44; //新行高度
    } else {
        return %orig;
    }
}

//每行cell
- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(id)indexPath
{
    if ([tableView.nextResponder.nextResponder isKindOfClass: %c(NewSettingViewController)]
        && [indexPath section] == [self numberOfSectionsInTableView:tableView]-1) { //定位设置界面，并且是最后一组
        
        UITableViewCell * cell = nil;
        if([indexPath row] == 0){
            static NSString *switchCell = @"switchCell";
            cell = [tableView dequeueReusableCellWithIdentifier:switchCell];
            if(!cell){
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
            }
            cell.textLabel.text = @"自动抢红包";
            //抢红包开关!!
            UISwitch *switchView = [[UISwitch alloc] init];
            switchView.on = [TDFDefaults boolForKey:TDFSWITCHKEY];
            [switchView addTarget:self action:@selector(switchChange:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
            
        } else {
            static NSString * waitCell = @"waitCell";
            cell = [tableView dequeueReusableCellWithIdentifier:waitCell];
            if(!cell){
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
            }
            cell.textLabel.text = @"等待时间(秒)";
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
            //监听键盘输入
            [TDFNotification addObserver:self selector:@selector(textFieldDidChangeValue:) name:UITextFieldTextDidChangeNotification object:textField];
            textField.text = [TDFDefaults valueForKey:TDFTIMEKEY];
            textField.borderStyle = UITextBorderStyleRoundedRect;
            cell.accessoryView = textField;
        }
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        
    } else {
        return %orig;
    }
}
%end


//在NewSettingViewController里面处理，键盘弹出和消失对应的UI坐标改变
%hook NewSettingViewController

//键盘弹出
%new
- (void)keyboardWillShow:(NSNotification *)notification{
    
    UIView *view = self.view;
    CGRect keyBoardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    view.frame = CGRectMake(0, -keyBoardRect.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}
//键盘消失
%new
- (void)keyboardWillHide:(NSNotification *)notification{
    UIView *view = self.view;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)viewDidLoad
{
    %orig;
    //监听键盘弹出和消失
    [TDFNotification addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [TDFNotification addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

%end





