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
    NSString *username = self.usernameLabel.text;
    NSString *password = self.passwordLabel.text;
    if (![username isEqualToString:@""] & ![password isEqualToString:@""]) {// 登录
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];
        [keychain setObject:username forKey:(__bridge id)(kSecAttrAccount)];
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
