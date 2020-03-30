//
//  NetworkTool.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "NetworkTool.h"
#import <AFHTTPSessionManager.h>
#import "MiniApp.h"
#import "Response.h"

@implementation NetworkTool

#pragma mark - LIST
+ (void)fetchListOnSuccess:(successCallback)success
                 onFailure:(failureCallback)failure{
  NSString *url = [NSString stringWithFormat:@"http://mini-demo.everonet.com:8080/api/v0/miniappinstores/"];
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];

  [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSLog(@"responseObject:%@",responseObject);
    
    NSError *error;
    Response *response =
           [[Response alloc] initWithDictionary:responseObject error:&error];
    if (error != nil) {
      failure(@"deserilized_error");
    }else{
      success(response);
    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    failure(@"network_error");
  }];

}

@end
