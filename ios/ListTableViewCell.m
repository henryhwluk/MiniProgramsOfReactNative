//
//  ListTableViewCell.m
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/30.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ListTableViewCell.h"
#import <Masonry.h>
#import <SDWebImage.h>
@interface ListTableViewCell()

@property(nonatomic,strong)UIImageView *appLogoView;

@property(nonatomic,strong)UILabel *appName;

@end

@implementation ListTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithListCellWithTableView:(UITableView*)tableView{
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"]) {
        
        [self customCell];
    }
    return self;
}
-(void)customCell{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"list_bg"];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview: bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.contentView).offset(20);
      make.right.equalTo(self.contentView).offset(-20);
      make.height.equalTo(self.contentView).multipliedBy(0.9);
      make.centerY.equalTo(self.contentView);
    }];
    self.appLogoView = [[UIImageView alloc] init];
    self.appLogoView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview: self.appLogoView];
    [self.appLogoView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.width.equalTo(bgView.mas_height).multipliedBy(0.7);
      make.height.equalTo(bgView.mas_height).multipliedBy(0.6);
      make.centerY.equalTo(bgView);
      make.left.equalTo(bgView.mas_left).offset(30);
    }];
    
    UIImageView *arrowView = [[UIImageView alloc] init];
    arrowView.image = [UIImage imageNamed:@"arrow"];
    [self.contentView addSubview:arrowView];
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.right.equalTo(bgView.mas_right).offset(-20);
      make.width.height.equalTo(@10);
      make.centerY.equalTo(bgView);
    }];
    
    self.appName = [[UILabel alloc] init];
    self.appName.backgroundColor = [UIColor clearColor];
    self.appName.textAlignment = NSTextAlignmentRight;
    self.appName.textColor = [UIColor whiteColor];
    [self.contentView addSubview: self.appName];
    [self.appName mas_makeConstraints:^(MASConstraintMaker *make) {
      make.right.equalTo(arrowView.mas_left).offset(-10);
      make.left.equalTo(self.appLogoView.mas_right).offset(20);
      make.height.equalTo(@50);
      make.centerY.equalTo(bgView);
    }];
}

- (void)setModelData:(MiniApp *)modelData{
//    NSString *logoURL = modelData.icon_uri;
    NSString *logoURL = @"https://s1.ax1x.com/2020/03/30/GnVxsA.png";
    
    [self.appLogoView sd_setImageWithURL:[NSURL URLWithString:logoURL] placeholderImage:[UIImage imageNamed:@"listDefault"] options:SDWebImageDelayPlaceholder];
    self.appName.text = modelData.display_name;
    
}


- (UIColor *)RandomColor {
  NSInteger aRedValue = arc4random() %255;
  NSInteger aGreenValue =arc4random() %255;
  NSInteger aBlueValue =arc4random() %255;
  UIColor *randColor = [UIColor colorWithRed:aRedValue /255.0f green:aGreenValue /255.0f blue:aBlueValue /255.0f alpha:1.0f];
  return randColor;

}

@end
