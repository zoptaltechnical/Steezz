//
//  TransactionsViewController.m
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import "TransactionsViewController.h"
#import "TransactionsCell.h"

@interface TransactionsViewController ()
@property (strong, nonatomic) IBOutlet UIButton *plusBtn;
@property (strong, nonatomic) IBOutlet UIButton *filterBtn;
@property (strong, nonatomic) IBOutlet UITableView *transactionsTableView;

@end

@implementation TransactionsViewController
{
    NSMutableArray*namesArray,*categoryArray,*categoryImageArray,*amountArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    namesArray=[NSMutableArray arrayWithObjects:@"John Doe",@"Steave Smith",@"Gorav",@"Arnold",@"George Bush",@"Salman",@"John Doe",@"Steave Smith",@"Gorav",@"Arnold",@"George Bush",@"Salman", nil];
    categoryArray=[NSMutableArray arrayWithObjects:@"Education",@"Home Loan",@"Education",@"Home Loan",@"Education",@"Home Loan",@"Education",@"Home Loan",@"Education",@"Home Loan",@"Education",@"Home Loan", nil];
    amountArray=[NSMutableArray arrayWithObjects:@"& 10120",@"& 12",@"& 1521",@"& 1600",@"& 54574",@"& 1000",@"& 54652",@"& 2521",@"& 142",@"& 62",@"& 200",@"& 1521442", nil];

    [_transactionsTableView reloadData];

    
    
    
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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"TransactionsCellID";
    TransactionsCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        cell = [[TransactionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    cell.nameLbl.text=[namesArray objectAtIndex:indexPath.row];
    cell.categoryDescriptionLbl.text=[categoryArray objectAtIndex:indexPath.row];
    cell.amountLbl.text=[amountArray objectAtIndex:indexPath.row];


 
    
    
    
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
