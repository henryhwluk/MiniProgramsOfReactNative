//
//  NetworkTool.h
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiniApp.h"
#import "Response.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^successCallback)(Response * response);
typedef void (^failureCallback)(NSString *errorMsg);

@interface NetworkTool : NSObject

#pragma mark -  LIST
+ (void)fetchListOnSuccess:(successCallback)success
                 onFailure:(failureCallback)failure;
@end

NS_ASSUME_NONNULL_END
