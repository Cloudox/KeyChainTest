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
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];
    NSString *username = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *password = [keychain objectForKey:(__bridge id)(kSecValueData)];
    self.usernameLabel.text = username;
    self.passwordLabel.text = password;
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
