//
//  ListViewController.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/29.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ListViewController.h"
#import "NetworkTool.h"
#import "MiniApp.h"
#import "Response.h"
#import <Masonry.h>
#import "ListTableViewCell.h"
#import <MBProgressHUD.h>
#import <React/RCTRootView.h>
#import "MiniDetailViewController.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView  *listTable;
@property(nonatomic,strong)NSMutableArray *miniApps;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self fetchListData];
  
    // Do any additional setup after loading the view.
}
-(void)setup{
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    [self fetchListData];
  });
}
-(void)fetchListData{
    [NetworkTool fetchListOnSuccess:^(Response * _Nonnull response) {
      dispatch_async(dispatch_get_main_queue(), ^{
          [MBProgressHUD hideHUDForView:self.view animated:YES];
          [self setupTabView];
        });
      [self.miniApps removeAllObjects];
      self.miniApps = [NSMutableArray arrayWithArray:response.mini_apps];
    } onFailure:^(NSString * _Nonnull errorMsg) {
    
    }];
}
-(void)setupTabView{
      self.listTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
      self.listTable.backgroundColor = [UIColor whiteColor];
      [self.view addSubview:self.listTable];
      [self.listTable mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(self.view);
      }];
  
      self.listTable.delegate = self;
      self.listTable.dataSource = self;
      self.listTable.showsVerticalScrollIndicator = NO;
      self.listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
      [self.listTable registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"Cell"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MiniApp *selected = self.miniApps[indexPath.row];
    MiniDetailViewController *detail = [[MiniDetailViewController alloc] init];
    detail.gid = selected.gid;
    detail.modalPresentationStyle = 0;
    [self presentViewController:detail animated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  ListTableViewCell *cell = [[ListTableViewCell alloc] initWithListCellWithTableView:tableView];
  
  MiniApp *mini = self.miniApps[indexPath.row];

  cell.modelData = mini;
  
  return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.miniApps.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 150;
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
