//
//  AppDelegate.h
//  ExpenseManager
//
//  Created by Gorav Grover on 19/05/17.
//  Copyright © 2017 Zoptal Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "GMDCircleLoader.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;



//Internet Connection
-(BOOL)hasInternetConnection;

-(void)startLoader:(UIView*)view withTitle:(NSString*)message;
- (void)stopLoader:(UIView*)view;


@end

