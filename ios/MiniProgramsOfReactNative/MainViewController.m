//
//  MainViewController.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "MainViewController.h"
#import "ListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];;
    self.title = @"Mini Programs";

    [self render];
  
    [self setup];
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  UIViewController *touch = [[UIViewController alloc] init];
  touch.view.backgroundColor = [UIColor blueColor];
  touch.modalPresentationStyle = 0;
  [self presentViewController:touch animated:YES completion:nil];
}

-(void)render{
  CAShapeLayer *layer = [CAShapeLayer new];
  layer.lineWidth = 10;
  UIColor *fillColor =  [UIColor colorWithRed:0/255.0 green:104/255.0 blue:105/255.0 alpha:1.0];
  layer.strokeColor = fillColor.CGColor;
  layer.fillColor = fillColor.CGColor;
  CGFloat radius = UIScreen.mainScreen.bounds.size.width*0.75;
  BOOL clockWise = true;
  UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(UIScreen.mainScreen.bounds.size.width/2,0) radius:radius startAngle:0 endAngle:2.0f*M_PI clockwise:clockWise];
  layer.path = [path CGPath];
  [self.view.layer addSublayer:layer];
}

-(void)setup{
  CGFloat navigationBarAndStatusBarHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
  CGFloat leftSpace = 50;
  CGFloat topSpace = 80;
  CGFloat btnW  = UIScreen.mainScreen.bounds.size.width - leftSpace*2;
  CGFloat btnH  = btnW * 380 / 582;

  UIButton *scan = [[UIButton alloc] initWithFrame:CGRectMake(leftSpace, navigationBarAndStatusBarHeight + topSpace, btnW, btnH)];
  [scan setBackgroundImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
  [scan addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:scan];
  
  UIButton *list = [[UIButton alloc] initWithFrame:CGRectMake(leftSpace, scan.frame.origin.y + btnH, btnW, btnH)];
  [list setBackgroundImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
  [list addTarget:self action:@selector(listAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:list];
  
}
-(void)scanAction{
  NSLog(@"scanAction");
  
}
-(void)listAction{
  NSLog(@"listAction");
  ListViewController *list = [[ListViewController alloc] init];
  [self.navigationController pushViewController:list animated:YES];
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
