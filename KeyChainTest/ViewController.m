//
//  ViewController.m
//  KeyChainTest
//
//  Created by csdc-iMac on 15/8/31.
//  Copyright (c) 2015年 csdc. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    NSString *username = self.usernameLabel.text;// 获取输入的用户名
    NSString *password = self.passwordLabel.text;// 获取输入的密码
    if (![username isEqualToString:@""] && ![password isEqualToString:@""]) {// 非空则保存
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 1
        [keychain setObject:username forKey:(__bridge id)(kSecAttrAccount)];// 2
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];// 3
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
