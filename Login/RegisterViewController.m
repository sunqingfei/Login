//
//  RegisterViewController.m
//  Login
//
//  Created by zfhtjs on 14-3-28.
//  Copyright (c) 2014年 zfht. All rights reserved.
//

#import "RegisterViewController.h"
#import "Constant.h"
#define TF_X   33
#define TF_W   20
#define FONT_W 30
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize userTF = _userTF;
@synthesize pwdTF = _pwdTF;
@synthesize phoneTF = _phoneTF;
@synthesize regIB = _regIB;
@synthesize regIV =_regIV;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"注 册";
    [ApplicationDelegate.rootNavigationController setNavigationBarHidden:YES animated:YES ];
    
    float height = 480.0f;
    float height_2 = 0.0f;
    if(iPhone5){
        height = 568.0f;
        height_2 = 20.0f;
    }
    _regIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320,height)];
    [_regIV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"reg_bg.png"]]];
    [_regIV setUserInteractionEnabled:YES];
    [self.view addSubview:_regIV];
    
    UIImageView *username = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"username.png"]];
    [username setFrame:CGRectMake(TF_X,100, 257, 34)];
    [username setUserInteractionEnabled:YES];
    [_regIV addSubview:username];
    _userTF = [[UITextField alloc]initWithFrame:CGRectMake(TF_X+FONT_W, 100, 227, 34)];
    _userTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _userTF.delegate = self;
    [_userTF setPlaceholder:@"请输入用户名"];
    [_userTF setFont:[UIFont boldSystemFontOfSize:15]];
    _userTF.returnKeyType = UIReturnKeyDone;
    [_regIV addSubview:_userTF];
    
    UIImageView *phoneIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone.png"]];
    [phoneIV setFrame:CGRectMake(TF_X,134+TF_W, 257, 34)];
    [phoneIV setUserInteractionEnabled:YES];
    [_regIV addSubview:phoneIV];
    _phoneTF = [[UITextField alloc]initWithFrame:CGRectMake(TF_X+FONT_W,134+TF_W, 227, 34)];
    _phoneTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneTF.delegate = self;
    [_phoneTF setPlaceholder:@"请输入手机号码"];
    [_phoneTF setFont:[UIFont boldSystemFontOfSize:15]];
    _phoneTF.returnKeyType = UIReturnKeyDone;
    [_regIV addSubview:_phoneTF];
    
    UIImageView *pwd = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"password.png"]];
    [pwd setFrame:CGRectMake(TF_X,183+TF_W, 257, 34)];
    [pwd setUserInteractionEnabled:YES];
    [_regIV addSubview:pwd];
    _pwdTF = [[UITextField alloc]initWithFrame:CGRectMake(TF_X+FONT_W, 183+TF_W, 227, 34)];
    _pwdTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _pwdTF.delegate = self;
    [_pwdTF setPlaceholder:@"请输入密码"];
    [_pwdTF setSecureTextEntry:YES];
    [_pwdTF setFont:[UIFont boldSystemFontOfSize:15]];
    _pwdTF.returnKeyType = UIReturnKeyDone;
    [_regIV addSubview:_pwdTF];
    
    _regIB = [UIButton buttonWithType:UIButtonTypeCustom];
    [_regIB setFrame:CGRectMake(TF_X, 271+TF_W, 257, 34)];
    [_regIB setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [_regIB setTitle:@"注 册" forState:UIControlStateNormal];
    
    [_regIV addSubview:_regIB];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userTF resignFirstResponder];
    [_pwdTF resignFirstResponder];
    [_phoneTF resignFirstResponder];
}

@end
