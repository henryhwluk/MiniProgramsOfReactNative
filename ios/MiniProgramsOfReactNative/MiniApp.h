//
//  MiniApp.h
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface MiniApp : JSONModel

@property (nonatomic, strong) NSString *gid;

@property (nonatomic, strong) NSString *version;
  
@property (nonatomic, strong) NSString *module_name;

@property (nonatomic, strong) NSString *display_name;

@property (nonatomic, strong) NSString *icon_uri;

@property (nonatomic, strong) NSString *bundle_uri;

@property (nonatomic, strong) NSString *icon_digest;

@property (nonatomic, strong) NSString *bundle_digest;

@end

NS_ASSUME_NONNULL_END
