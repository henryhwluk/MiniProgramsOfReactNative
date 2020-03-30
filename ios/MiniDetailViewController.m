//
//  MiniDetailViewController.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/30.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "MiniDetailViewController.h"
#import <React/RCTRootView.h>

@interface MiniDetailViewController ()

@end

@implementation MiniDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *jsCodeLocation;
    RCTRootView *rootView;
  
    if ([self.gid isEqualToString:@"Ge89c3ed65bf141758aa240e30e9c67ec"]) {
      jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"KitchenSink.jsbundle" ofType:nil]];
      rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                             moduleName:@"KitchenSink"
                                      initialProperties:nil
                                          launchOptions:nil];
      
    }else if ([self.gid isEqualToString:@"G604563f9155d463a8f405f09f7ac3dac"]){
      jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"tic-tac-toe.jsbundle" ofType:nil]];
      rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                             moduleName:@"tic-tac-toe"
                                      initialProperties:nil
                                          launchOptions:nil];
    }else if ([self.gid isEqualToString:@"G31f75ea1e3454e6b886ca6e4fe97971e"]){
      jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"tic-tac-toe.jsbundle" ofType:nil]];
      rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                             moduleName:@"tic-tac-toe"
                                      initialProperties:nil
                                          launchOptions:nil];
    }
    self.view = rootView;
      
//    CGFloat navigationBarAndStatusBarHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat navigationBarAndStatusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    CGFloat rSpace = 10;
    CGFloat tSpace = 5;

    CGFloat btnH = 30;
    CGFloat btnW = btnH * 2.7;
    CGFloat btnX = UIScreen.mainScreen.bounds.size.width - btnW - rSpace;
    CGFloat btnY = navigationBarAndStatusBarHeight + tSpace;

    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [close setBackgroundImage:[UIImage imageNamed:@"mini_more_close"] forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];
    // Do any additional setup after loading the view.
}
-(void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
