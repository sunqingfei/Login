//
//  LoginViewController.m
//  Login
//
//  Created by zfhtjs on 14-3-27.
//  Copyright (c) 2014年 zfht. All rights reserved.
//

#import "LoginViewController.h"
#import "Constant.h"
#import "RegisterViewController.h"

#define TF_X1   33
#define TF_Y1   55
#define LB_x1   58
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userTF=_userTF;
@synthesize pwdTF=_pwdTF;
@synthesize loginButton=_loginButton;
@synthesize loginIV = _loginIV;

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
	// Do any additional setup after loading the view, typically from a nib.
    float height = 480.0f;
    float height_2 = 0.0f;
    if(iPhone5){
        height = 568.0f;
        height_2 = 20.0f;
    }
    _loginIV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 320, 480)];
    //[_loginIV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.png"]]];
    _loginIV.image = [UIImage imageNamed:@"login_bg.png"];
    [_loginIV setUserInteractionEnabled:YES];
    [self.view addSubview:_loginIV];
    
    UIImageView *username = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"username.png"]];
    [username setFrame:CGRectMake(TF_X1,176+height_2, 257, 34)];
    [username setUserInteractionEnabled:YES];
    [_loginIV addSubview:username];
    _userTF = [[UITextField alloc]initWithFrame:CGRectMake(TF_X1+30, 176+height_2, 227, 34)];
    _userTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _userTF.delegate = self;
    [_userTF setPlaceholder:@"请输入用户名"];
    [_userTF setText:[[NSUserDefaults standardUserDefaults]stringForKey:KUSERNAME]];
    [_userTF setFont:[UIFont boldSystemFontOfSize:15]];
     _userTF.clearButtonMode = UITextFieldViewModeAlways;
    _userTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userTF.returnKeyType = UIReturnKeyDone;
    [_loginIV addSubview:_userTF];

    UIImageView *pwd = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"password.png"]];
    [pwd setFrame:CGRectMake(TF_X1, 220+height_2, 257, 34)];
    [pwd setUserInteractionEnabled:YES];
    [_loginIV addSubview:pwd];
    _pwdTF = [[UITextField alloc]initWithFrame:CGRectMake(TF_X1+30, 220+height_2, 227, 34)];
    _pwdTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _pwdTF.delegate = self;
    [_pwdTF setPlaceholder:@"请输入密码"];
    [_pwdTF setText:[[NSUserDefaults standardUserDefaults]stringForKey:kPASSWORD]];
    [_pwdTF setFont:[UIFont boldSystemFontOfSize:15]];
    [_pwdTF setSecureTextEntry:YES];
    _pwdTF.clearButtonMode = UITextFieldViewModeAlways;
    _pwdTF.returnKeyType = UIReturnKeyDone;
    [_loginIV addSubview:_pwdTF];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setFrame:CGRectMake(TF_X1, 310, 257, 34)];
    [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"login.png"] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [_loginIV addSubview:_loginButton];
    
    UIImageView *regIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"regsiter.png"]];
    [regIV setFrame:CGRectMake(TF_X1+180, 374, 17, 17)];
    [regIV setUserInteractionEnabled:YES];
    [_loginIV addSubview:regIV];
    UILabel *registerLab = [[UILabel alloc]initWithFrame:CGRectMake(TF_X1+200, 374, 80, 17)];
    [registerLab setBackgroundColor:[UIColor clearColor]];
    [registerLab setFont:[UIFont boldSystemFontOfSize:15]];
    [registerLab setTextColor:[UIColor whiteColor]];
    [registerLab setText:@"注册"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(TF_X1+200, 374, 90, 27)];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(registervc:) forControlEvents:UIControlEventTouchUpInside];
    
    [_loginIV addSubview:btn];
    [_loginIV addSubview:registerLab];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  页面输入合法性判断
 *
 
 *  @return
 */
-(BOOL) checkValue{
    if([@"" isEqualToString:[_userTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名不能为空！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }else if([@"" isEqualToString:[_pwdTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"警告" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return  NO;
    }
    return YES;
}

- (IBAction)loginBtnPress:(UIButton *)sender
{
    if(![self checkValue]){
        return;
    }
    NSString *userName=_userTF.text;
    NSString *userPass=_pwdTF.text;
    if(userName!=nil && userPass!=nil)
    {
        if([userName isEqualToString:@"eric"]&&[userPass isEqualToString:@"abc"])
        {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"登录成功！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"验证错误！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}

/**
 *  注册按钮被点击
 *
 *  @param sender 】
 */
-(IBAction)registervc:(id)sender {
    RegisterViewController *regViewController = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regViewController animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userTF resignFirstResponder];
    [_pwdTF resignFirstResponder];
}
@end
