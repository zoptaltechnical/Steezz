//
//  SharedParsing.h
//  Qwykr
//
//  Created by Gorav Grover on 12/9/16.
//  Copyright © 2016 Gorav. All rights reserved.


#import <Foundation/Foundation.h>
#import "SingeltonMacro.h"

typedef void (^completionBlock) (BOOL succeeded, NSArray *resultArray);
typedef void (^failureBlock) (BOOL succeeded, NSArray *failureArray);

@interface SharedParsing : NSObject{
    id obj;
}


-(void)assignSender:(id)sender;


// Driver Profile Module 


- (void)wsCallForAddAdvertisement:(NSDictionary*)dict
                     successBlock:(completionBlock)completionBlock
                     failureBlock:(failureBlock)failure;

- (void)wsCallForContactUs:(NSDictionary*)dict
              successBlock:(completionBlock)completionBlock
              failureBlock:(failureBlock)failure;

- (void)wsCallForAddProducer:(NSDictionary*)dict
                         successBlock:(completionBlock)completionBlock
                         failureBlock:(failureBlock)failure;


- (void)wsCallForGetAdvertisementList:(completionBlock)completionBlock
                      failureBlock:(failureBlock)failure;

- (void)wsCallForGetTVPrograms:(completionBlock)completionBlock
                  failureBlock:(failureBlock)failure;


- (void)wsCallForGetLiveVideo:(completionBlock)completionBlock
                 failureBlock:(failureBlock)failure;


SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(SharedParsing);


@end

