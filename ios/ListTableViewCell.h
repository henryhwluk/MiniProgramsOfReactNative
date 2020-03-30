//
//  ListTableViewCell.h
//  MiniProgramsOfReactNative
//
//  Created by henvy on 2020/3/30.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListTableViewCell : UITableViewCell

@property(nonatomic,strong)MiniApp  *modelData;

-(instancetype)initWithListCellWithTableView:(UITableView*)tableView;

@end

NS_ASSUME_NONNULL_END
