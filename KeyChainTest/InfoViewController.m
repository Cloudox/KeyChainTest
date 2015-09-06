//
//  InfoViewController.m
//  KeyChainTest
//
//  Created by csdc-iMac on 15/8/31.
//  Copyright (c) 2015年 csdc. All rights reserved.
//

#import "InfoViewController.h"
#import "KeychainItemWrapper.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 通过同样的标志创建keychain
    // 获取对应Key里保存的用户名和密码
    NSString *username = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *password = [keychain objectForKey:(__bridge id)(kSecValueData)];
    // 显示
    self.usernameLabel.text = username;
    self.passwordLabel.text = password;
}

- (IBAction)changePW:(id)sender {
    NSString *nPW = self.nPWText.text;// 获取新密码输入框的值
    if (![nPW isEqualToString:@""]) {// 非空则修改
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 找到keychain
        [keychain setObject:nPW forKey:(__bridge id)(kSecValueData)];// 设置密码对应Key的值
        
        //重新读取并显示
        NSString *nPassword = [keychain objectForKey:(__bridge id)(kSecValueData)];
        self.nPWLabel.text = nPassword;
    }
    [self.nPWText resignFirstResponder];// 收起键盘
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
