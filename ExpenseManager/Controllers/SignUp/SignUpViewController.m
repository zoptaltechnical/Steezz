//
//  SignUpViewController.m
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignInViewController.h"
#import "Constant.h"
#import "MainTabBarController.h"

@interface SignUpViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTxtFld;
@property (strong, nonatomic) IBOutlet UITextField *emailTxtFld;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxtFld;
@property (strong, nonatomic) IBOutlet UIButton *countryBtn;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeTxtFld;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumTxtFld;
@property (strong, nonatomic) IBOutlet UIButton *signUpBtn;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signUpBtnPressed:(id)sender
{
    [KAppdelegate startLoader:self.view withTitle:@"Loading..."];
    [self performSelector:@selector(hideandPush) withObject:nil afterDelay:5.0];
    

}
- (IBAction)signInBtnPressed:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)hideandPush
{
    [KAppdelegate stopLoader:self.view];
    
    MainTabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabBarControllerID"];
    [KAppdelegate.window setRootViewController:tabBarController];
    
}



- (IBAction)faceBookBtnPressed:(id)sender
{
    [[SingletonClass sharedInstance]showAlert:@"Coming Soon" withDelegate:self withCancelTitle:@"OK" otherTitle:nil];
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
