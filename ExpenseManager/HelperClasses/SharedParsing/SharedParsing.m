//
//  SharedParsing.m
//  Qwykr
//
//  Created by Gorav Grover on 12/9/16.
//  Copyright © 2016 Gorav. All rights reserved.

#import "SharedParsing.h"
#import "Constant.h"
#import <AssetsLibrary/AssetsLibrary.h>


@implementation SharedParsing

SINGLETON_FOR_CLASS(SharedParsing);

-(void)assignSender:(id)sender
{
    obj = sender;
}


/*
 Add Advertisement
 */

- (void)wsCallForAddAdvertisement:(NSDictionary*)dict
                     successBlock:(completionBlock)completionBlock
                     failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSString*urlStr=[NSString stringWithFormat:@"%@%@",baseUrl,kAddAddvertisement];
                       NSURL *url1 = [NSURL URLWithString:urlStr];
                       [self createNSUrlSessionLogin:url1 postDict:dict successBlock:completionBlock failureBlock:failure];
                   });
}


/*
 Contact US
 */

- (void)wsCallForContactUs:(NSDictionary*)dict
              successBlock:(completionBlock)completionBlock
              failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,kContactUs ]];
                       [self createNSUrlSessionLogin:url1 postDict:dict successBlock:completionBlock failureBlock:failure];
                       
                   });
}




/*
 Add Producer
 */

- (void)wsCallForAddProducer:(NSDictionary*)dict
                     successBlock:(completionBlock)completionBlock
                     failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSString*urlStr=[NSString stringWithFormat:@"%@%@",baseUrl,kAddProducer];
                       NSURL *url1 = [NSURL URLWithString:urlStr];
                       [self createNSUrlSessionLogin:url1 postDict:dict successBlock:completionBlock failureBlock:failure];
                   });
}




- (void)wsCallForGetAdvertisementList:(completionBlock)completionBlock
                failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,kGetAdvertisementList]];
                       [self createNSUrlSessionForGetService:url1 postDict:nil successBlock:completionBlock failureBlock:failure];
                   });
}


- (void)wsCallForGetLiveVideo:(completionBlock)completionBlock
                         failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,kGetLiveVideo]];
                       [self createNSUrlSessionForGetService:url1 postDict:nil successBlock:completionBlock failureBlock:failure];
                   });
}


- (void)wsCallForGetTVPrograms:(completionBlock)completionBlock
                         failureBlock:(failureBlock)failure
{
    dispatch_async( sharedQueue,
                   ^{
                       NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,kGetTvPrograms]];
                       [self createNSUrlSessionForGetService:url1 postDict:nil successBlock:completionBlock failureBlock:failure];
                   });
}


#pragma mark - CREATE NSURLSESSION -Method: POST

-(void)createNSUrlSessionLogin:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock
                  failureBlock:(failureBlock)failure
{
    NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    
    //[request setHTTPBody:[[dict valueForKey:@"infoStr"] dataUsingEncoding:NSUTF8StringEncoding]];

   // [request addValue:@"Basic Y2xpZW50YXBwOjEyMzQ1Ng==" forHTTPHeaderField:@"Authorization"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    //Json String
   // NSString * myString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"URL----->>>>%@",URL);
 ////   NSLog(@"PostDict----->>>>%@",myString);
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            
            //                                            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //                                            NSLog(@"result string: %@", newStr);
            
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"result json: %@", jsonArray);
            
            if (!jsonArray) {
                NSLog(@"Error is %@",[error description]);
                failure(NO,nil);
            }else
            {
                completionBlock(YES,jsonArray);
            }
            
        }
        
        else if ([data length] == 0 && error == nil){
            failure(NO,nil);
        }
        
        else if (error != nil){
            NSLog(@"Error is %@",[error description]);
            failure(NO,nil);
        }
        
    }];
    
    [postDataTask resume];
}


#pragma mark - CREATE NSURLSESSION -Method: POST

-(void)createNSUrlSession:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock
             failureBlock:(failureBlock)failure
{
    NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    
    NSString *accessToken;
    if ([UserDefaultHandler getUserAccessToken]!=nil)
        accessToken=[NSString stringWithFormat:@"bearer %@",[UserDefaultHandler getUserAccessToken]];
    else
        accessToken = @"Basic Y2xpZW50YXBwOjEyMzQ1Ng==";
    
    [request addValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    //Json String
    NSString * myString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"URL----->>>>%@",URL);
    NSLog(@"PostDict----->>>>%@",myString);
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          
                                          {
                                              
                                            //NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                            NSLog(@"result string: %@", newStr);
                                              
                                              
                                              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                              NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                              
                                              if ([httpResponse statusCode]==200||[httpResponse statusCode]==401 ||[httpResponse statusCode]==404 ) {
                                                  if ([data length] > 0 && error == nil)
                                                  {
                                                    //   NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                    //                                            NSLog(@"result string: %@", newStr);
                                                      
                                                      
                                                      NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                      NSLog(@"result json: %@", jsonArray);
                                                      
                                                      if (!jsonArray) {
                                                          NSLog(@"Error is %@",[error description]);
                                                          failure(NO,nil);
                                                      }else
                                                      {
                                                          completionBlock(YES,jsonArray);
                                                      }
                                                      
                                                  }else
                                                  {
                                                        completionBlock(YES,@[@{@"StatusCode":@"200"}]);
                                                  }
                                              }
                                           
                                              else if ([data length] == 0 && error == nil){
                                                  failure(NO,nil);
                                              }
                                              
                                              else if (error != nil){
                                                  NSLog(@"Error is %@",[error description]);
                                                  failure(NO,nil);
                                              }
                                              
                                          }];
    
    [postDataTask resume];
}

#pragma mark - CREATE NSURLSESSION -Method: GET

-(void)createNSUrlSessionForGetService:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock failureBlock:(failureBlock)failure
{
     NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
   // [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
   // [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
  //  NSString *accessToken=[NSString stringWithFormat:@"bearer %@",[UserDefaultHandler getUserAccessToken]];
  //  [request addValue:accessToken forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"GET"];
    
     // NSLog(@"Access TOken----->>>>%@",accessToken);
    
    
      //  NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    //    //Json String
    //    NSString * myString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"URL----->>>>%@",URL);
  //  [request setHTTPBody:postData];

    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
                                              if ([data length] > 0 && error == nil)
                                              {
                                                  
                                                  
                                                  //                                            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                  //                                            NSLog(@"result string: %@", newStr);
                                                  
                                                  
                                                  NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                  NSLog(@"result json: %@", jsonArray);
                                                  
                                                  if (!jsonArray) {
                                                      NSLog(@"Error is %@",[error description]);
                                                      failure(NO,nil);
                                                  }else
                                                  {
                                                      completionBlock(YES,jsonArray);
                                                  }
                                                  
                                              }
                                              
                                              else if ([data length] == 0 && error == nil){
                                                  failure(NO,nil);
                                              }
                                              
                                              else if (error != nil){
                                                  NSLog(@"Error is %@",[error description]);
                                                  failure(NO,nil);
                                              }
                                              
                                          }];
    
    [postDataTask resume];
}


#pragma mark - CREATE NSURLSESSION -Method: POST UploadMedia

-(void)createNSUrlSessionUploadMedia:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock failureBlock:(failureBlock)failure
{
    NSString *boundary = @"SportuondoFormBoundary";
    
    NSMutableData *body = [NSMutableData data];
    NSString *joinedString = [[dict objectForKey:@"captionArray"] componentsJoinedByString:@","];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"captions"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", joinedString] dataUsingEncoding:NSUTF8StringEncoding]];
    
    for (int i=0; i<[[dict objectForKey:@"MediaItem"]count]; i++) {
        
        if ([[[dict objectForKey:@"MediaItem"]objectAtIndex:i] isKindOfClass:[UIImage class]])
        {
            //image upload
            NSData *mediaData = UIImageJPEGRepresentation([[dict objectForKey:@"MediaItem"]objectAtIndex:i], 1.0);
            if (mediaData)
            {
                [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n", @"files",[NSString stringWithFormat:@"%d",i]] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:mediaData];
                [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        else if([[[dict objectForKey:@"MediaItem"]objectAtIndex:i] isKindOfClass:[NSURL class]])
        {
            //audio upload
            NSData *videoData=[NSData dataWithContentsOfURL:[[dict objectForKey:@"MediaItem"] objectAtIndex:i]];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"files\"; filename=\"%@\"\r\n",@"i.m4a"] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"Content-Type: audio/mpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];//video/quicktime for .mov format
            [body appendData:videoData];
            [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else
        {
            //video upload
            ALAsset * asset = [[dict objectForKey:@"MediaItem"]objectAtIndex:i];
            ALAssetRepresentation *rep = [asset defaultRepresentation];
            Byte *buffer = (Byte*)malloc((NSUInteger)rep.size);
            NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:(NSUInteger)rep.size error:nil];
            NSData *videoData = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
            
            // asset is a video
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"files\"; filename=\"%d\"\r\n",i] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"Content-Type: video/quicktime\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];//video/quicktime for .mov format
            [body appendData:[NSData dataWithData:videoData]];
            [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{  @"Accept"   : @"application/json", @"Content-Type"  : [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary]  };
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
    
    // Data uploading task. We could use NSURLSessionUploadTask instead of NSURLSessionDataTask if we needed to support uploads in the background
    
    NSURL *url = URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = body;
    
    NSString *accessToken=[NSString stringWithFormat:@"bearer %@",[UserDefaultHandler getUserAccessToken]];
    
    [request addValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *uploadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if ([data length] > 0 && error == nil)
        {
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"result json: %@", jsonArray);
            
            if (!jsonArray) {
                
                NSLog(@"Create User Error is %@",[error description]);
                failure(NO,nil);
                
            }else
            {
                completionBlock(YES,jsonArray);
            }
            
            
            
        }
        
        else if ([data length] == 0 && error == nil){
            
            failure(NO,nil);
            
        }
        
        else if (error != nil){
            NSLog(@"Create User Error is %@",[error description]);
            failure(NO,nil);
        }
        
    }];
    [uploadTask resume];
    
}



#pragma mark - CREATE NSURLSESSION -Method: PUT

-(void)createNSUrlSessionForUpdates:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock
                       failureBlock:(failureBlock)failure
{
    NSError *error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"PUT"];
    
    NSString *accessToken=[NSString stringWithFormat:@"bearer %@",[UserDefaultHandler getUserAccessToken]];
    [request addValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    //Json String
    NSString * myString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"URL----->>>>%@",URL);
    NSLog(@"PostDict----->>>>%@",myString);
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          
                                          {
                                              
                                              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                              NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                              
                                              if ([httpResponse statusCode]==200||[httpResponse statusCode]==401) {
                                                  if ([data length] > 0 && error == nil)
                                                  {
                                                      //   NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                      //                                            NSLog(@"result string: %@", newStr);
                                                      
                                                      
                                                      NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                      NSLog(@"result json: %@", jsonArray);
                                                      
                                                      if (!jsonArray) {
                                                          NSLog(@"Error is %@",[error description]);
                                                          failure(NO,nil);
                                                      }else
                                                      {
                                                          completionBlock(YES,jsonArray);
                                                      }
                                                      
                                                  }else
                                                  {
                                                      completionBlock(YES,@[@{@"StatusCode":@"200"}]);
                                                  }
                                              }
                                              
                                              else if ([data length] == 0 && error == nil){
                                                  failure(NO,nil);
                                              }
                                              
                                              else if (error != nil){
                                                  NSLog(@"Error is %@",[error description]);
                                                  failure(NO,nil);
                                              }
                                              
                                          }];
    
    [postDataTask resume];
}


#pragma mark - CREATE NSURLSESSION -Method: Delete

-(void)createNSUrlSessionForDeleteService:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock
                          failureBlock:(failureBlock)failure
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *accessToken=[NSString stringWithFormat:@"bearer %@",[UserDefaultHandler getUserAccessToken]];
    [request addValue:accessToken forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"DELETE"];

    NSLog(@"URL----->>>>%@",URL);
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          
                                          {
                                              
                                              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                              NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                              
                                              if ([httpResponse statusCode]==200||[httpResponse statusCode]==401) {
                                                  if ([data length] > 0 && error == nil)
                                                  {
                                                      //   NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                      //                                            NSLog(@"result string: %@", newStr);
                                                      
                                                      
                                                      NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                      NSLog(@"result json: %@", jsonArray);
                                                      
                                                      if (!jsonArray) {
                                                          NSLog(@"Error is %@",[error description]);
                                                          failure(NO,nil);
                                                      }else
                                                      {
                                                          completionBlock(YES,jsonArray);
                                                      }
                                                      
                                                  }else
                                                  {
                                                      completionBlock(YES,@[@{@"StatusCode":@"200"}]);
                                                  }
                                              }
                                              
                                              else if ([data length] == 0 && error == nil){
                                                  failure(NO,nil);
                                              }
                                              
                                              else if (error != nil){
                                                  NSLog(@"Error is %@",[error description]);
                                                  failure(NO,nil);
                                              }
                                              
                                          }];
    
    [postDataTask resume];
}

# pragma mark:Create NSURLSESSION:Refresh token

-(void)createNSUrlSessionRefreshToken:(NSURL*)URL postDict:(NSDictionary*)dict successBlock:(completionBlock)completionBlock
                         failureBlock:(failureBlock)failure
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"Basic Y2xpZW50YXBwOjEyMzQ1Ng==" forHTTPHeaderField:@"Authorization"];
    
    NSString *post =[NSString stringWithFormat:@"refresh_token=%@&grant_type=%@",[dict valueForKey:@"refresh_token"],[dict valueForKey:@"grant_type"]];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    //    NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    
    //Json String
    //    NSString * myString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    //    NSLog(@"URL----->>>>%@",URL);
    //    NSLog(@"PostDict----->>>>%@",myString);
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            
            //                                            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //                                            NSLog(@"result string: %@", newStr);
            
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"result json: %@", jsonArray);
            
            if (!jsonArray) {
                NSLog(@"Error is %@",[error description]);
                failure(NO,nil);
            }else
            {
                completionBlock(YES,jsonArray);
            }
            
        }
        
        else if ([data length] == 0 && error == nil){
            failure(NO,nil);
        }
        
        else if (error != nil){
            NSLog(@"Error is %@",[error description]);
            failure(NO,nil);
        }
        
    }];
    
    [postDataTask resume];
}


@end
