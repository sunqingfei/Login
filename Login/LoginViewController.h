//
//  LoginViewController.h
//  Login
//
//  Created by zfhtjs on 14-3-27.
//  Copyright (c) 2014年 zfht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *userTF;
@property (nonatomic,strong) UITextField *pwdTF;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIImageView *loginIV;
@end
