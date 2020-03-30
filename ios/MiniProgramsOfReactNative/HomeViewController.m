//
//  HomeViewController.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.title = @"Home";
    UILabel *show = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    show.textAlignment = NSTextAlignmentCenter;
    show.text = @"My home page";
    [self.view addSubview:show];
    // Do any additional setup after loading the view.
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
