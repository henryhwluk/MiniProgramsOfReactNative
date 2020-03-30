//
//  Response.h
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/30.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiniApp.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MiniApp

@end

@interface Response : JSONModel

@property (nonatomic, strong) NSArray<MiniApp> *mini_apps;

@end

NS_ASSUME_NONNULL_END
