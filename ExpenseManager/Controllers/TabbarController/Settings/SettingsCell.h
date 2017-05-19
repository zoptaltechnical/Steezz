//
//  SettingsCell.h
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lineLbl;

@property (strong, nonatomic) IBOutlet UIImageView *cellIcon;


@property (strong, nonatomic) IBOutlet UIImageView *rightIcon;
@property (strong, nonatomic) IBOutlet UILabel *tittleNameLbl;

@end
