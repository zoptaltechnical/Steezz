//
//  SettingsViewController.m
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsCell.h"
#import "SignInViewController.h"
#import "Constant.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController
{
    NSMutableArray*tittlesArray,*tittleiconsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tittlesArray=[NSMutableArray arrayWithObjects:@"Account",@"Notification Center",@"Support",@"Talk About Us",@"About Us",@"Disclaimer", nil];
    tittleiconsArray=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"AccountSettings"],[UIImage imageNamed:@"Notification-CenterSettings"],[UIImage imageNamed:@"SupportSettings"],[UIImage imageNamed:@"Talk-About-UsSettings"],[UIImage imageNamed:@"aboutUsSettings"],[UIImage imageNamed:@"DisclaimerSettings"], nil];
    
    [_settingsTableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (IBAction)logOutPressed:(id)sender {
    
    
    UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Alert!"  message:@"Are you sure to logout."  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        
        SignInViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllerID"];
        [KAppdelegate.window setRootViewController:tabBarController];

        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alert addAction:yes];
    [alert addAction:no];
    
    [self presentViewController:alert animated:YES completion:nil];

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"SettingsCellID";
    SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        cell = [[SettingsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell.tittleNameLbl.text=[tittlesArray objectAtIndex:indexPath.row];
    cell.cellIcon.image=[tittleiconsArray objectAtIndex:indexPath.row];
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
