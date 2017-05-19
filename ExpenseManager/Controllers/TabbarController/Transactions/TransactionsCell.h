//
//  TransactionsCell.h
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UILabel *categoryDescriptionLbl;
@property (strong, nonatomic) IBOutlet UILabel *amountLbl;
@property (strong, nonatomic) IBOutlet UIImageView *categoryImg;
@property (strong, nonatomic) IBOutlet UIImageView *calenderImage;

@end
