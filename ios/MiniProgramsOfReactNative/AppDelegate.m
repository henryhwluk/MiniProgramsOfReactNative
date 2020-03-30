/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "MainViewController.h"
#import "HomeViewController.h"
#import "MiniDevViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

//  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"tic-tac-toe.jsbundle" ofType:nil]];
//  jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"KitchenSink.jsbundle" ofType:nil]];

  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"tic-tac-toe"
//                                                      moduleName:@"KitchenSink"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [UIColor blackColor];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  UITabBarController *tabBarVC = [[UITabBarController alloc] init];
  
  HomeViewController *home = [HomeViewController new];
  UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController: home];
  homeNav.tabBarItem.title = @"Home";
  homeNav.tabBarItem.image = [[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
  homeNav.view.backgroundColor = [UIColor whiteColor];
  [tabBarVC addChildViewController: homeNav];

  MiniDevViewController *miniDev = [MiniDevViewController new];
  UINavigationController *miniDevNav = [[UINavigationController alloc] initWithRootViewController: miniDev];
  miniDevNav.tabBarItem.title = @"Mini Dev";
  miniDevNav.tabBarItem.image = [[UIImage imageNamed:@"mini_dev.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  miniDevNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"mini_dev.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
  miniDevNav.view.backgroundColor = [UIColor whiteColor];
  [tabBarVC addChildViewController: miniDevNav];
  
  MainViewController *miniPros = [MainViewController new];
  UINavigationController *miniNav = [[UINavigationController alloc] initWithRootViewController: miniPros];
  miniNav.tabBarItem.image = [[UIImage imageNamed:@"mini_pros.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  miniNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"mini_pros.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
  miniNav.tabBarItem.title = @"Mini Programs";
  miniNav.view.backgroundColor = [UIColor whiteColor];
  [tabBarVC addChildViewController: miniNav];

  //rootViewController.view = rootView;
  self.window.rootViewController = tabBarVC;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
