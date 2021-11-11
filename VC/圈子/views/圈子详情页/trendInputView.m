//
//  trendInputView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import "trendInputView.h"

@implementation trendInputView
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.frame = frame;
        [self addSubview:self.sendButton];
        [self addSubview:self.inputField];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(UITextField*)inputField{
    if (!_inputField) {
        _inputField = [[UITextField alloc] initWithFrame:CGRectMake(12, 7.5, ScreenWidth-12*2-14.5-20, 34)];
        _inputField.placeholder = @"请输入您的留言";
        _inputField.borderStyle = 3;
//        _inputField.textColor = CommonColor;
        _inputField.clipsToBounds = YES;
        _inputField.layer.cornerRadius = 5;
        _inputField.keyboardType =UIKeyboardTypeDefault ;
        _inputField.returnKeyType = UIReturnKeyDone;
        _inputField.enablesReturnKeyAutomatically = YES;
    }
    return _inputField;
}
-(UIButton*)sendButton{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.frame = CGRectMake(ScreenWidth-12-30, 14.5, 30, 20);
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        _sendButton.titleLabel.font = FontSize(14);
        [_sendButton setTitleColor:CommonColor forState:UIControlStateNormal];
    }
    return _sendButton;
}
@end
