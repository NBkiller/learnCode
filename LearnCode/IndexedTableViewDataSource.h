//
//  IndexedTableViewDataSource.h
//  webTest
//
//  Created by peng.zhou@fengjr.com on 2020/6/19.
//  Copyright © 2020 FJPH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexedTableViewDataSource <NSObject>

//获取一个tableview的字母索引条数据的方法
- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView;

@end

@interface IndexedTableViewDataSource : UITableView

@property (nonatomic, weak) id <IndexedTableViewDataSource> indexedDataSource;


@end

NS_ASSUME_NONNULL_END
