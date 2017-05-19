//
//  SignInViewController.m
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "ForgotPassViewController.h"
#import "Constant.h"
#import "MainTabBarController.h"



@interface SignInViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTxtFld;
@property (strong, nonatomic) IBOutlet UITextField *passTxtFld;
@property (strong, nonatomic) IBOutlet UIButton *keepSignedBtn;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)keepSignedBtnPressed:(UIButton*)sender
{
    
    
}
- (IBAction)signInBtnPressed:(id)sender
{
    if ([self signInValidations])
    {
        [KAppdelegate startLoader:self.view withTitle:@"Loading..."];
        [self performSelector:@selector(hideandPush) withObject:nil afterDelay:5.0];
    }
    
    
}


-(void)hideandPush
{
    [KAppdelegate stopLoader:self.view];
    
    MainTabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarControllerID"];
    [KAppdelegate.window setRootViewController:tabBarController];
    
}


#pragma mark signup new charity
-(BOOL)signInValidations
{
    if (![_userNameTxtFld.text isValid])
    {
        [[SingletonClass sharedInstance]showAlert:@"Please enter UserName" withDelegate:self withCancelTitle:@"OK" otherTitle:nil];
        return NO;
    }
    if (![_passTxtFld.text isValid])
    {
        [[SingletonClass sharedInstance]showAlert:@"Please enter Valid Password" withDelegate:self withCancelTitle:@"OK" otherTitle:nil];
        return NO;
    }
    
    return YES;
}




- (IBAction)signUpBtnPressed:(id)sender
{
    SignUpViewController *HomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerID"];
    
    [self.navigationController pushViewController:HomeViewController animated:YES];

}
- (IBAction)forgotPassBtnPressed:(id)sender
{
    ForgotPassViewController *HomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPassViewControllerID"];
    
    [self.navigationController pushViewController:HomeViewController animated:YES];
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
