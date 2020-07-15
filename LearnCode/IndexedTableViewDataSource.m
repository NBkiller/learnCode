//
//  IndexedTableViewDataSource.m
//  webTest
//
//  Created by peng.zhou@fengjr.com on 2020/6/19.
//  Copyright © 2020 FJPH. All rights reserved.
//

#import "IndexedTableViewDataSource.h"
#import "ViewReusePool.h"

@interface IndexedTableViewDataSource ()
{
    UIView *containerVeiw;
    ViewReusePool *reusePool;
}

@end

@implementation IndexedTableViewDataSource


- (void)reloadData {
    [super reloadData];
    
    //懒加载
    if (containerVeiw == nil) {
        containerVeiw = [[UIView alloc] initWithFrame:CGRectZero];
        containerVeiw.backgroundColor = [UIColor whiteColor];
        
        //避免索引条跟随tableview一起滚动
        [self.superview insertSubview:containerVeiw aboveSubview:self];
    }
    
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc] init];
    }
    
    //标记所有可重用视图状态
    [reusePool reset];
    
    [self reloadIndexedBar];
}

- (void)reloadIndexedBar{
    
    //获取字母索引显示的内容
    NSArray <NSString *> *arrayTitles = nil;
    
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    
    if (!arrayTitles || arrayTitles.count <= 0) {
        [containerVeiw setHidden:YES];
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (int i = 0; i < count ; i++) {
        NSString *title = [arrayTitles objectAtIndex:i];
        
        //从重用池中取出可用的buton
        UIButton *button = (UIButton *)[reusePool dequeueReuseableView];
        
        //如果没有重用的可取就创建一个
        if (button == nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            
            //注册Button到重用池中
            [reusePool addUsingView:button];
            
            NSLog(@"新建一个Button");
        }
        else {
            NSLog(@"button 重用了");
        }
        
        [containerVeiw addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];
    }
    
    [containerVeiw setHidden:NO];
    
    containerVeiw.frame = CGRectMake(self.frame.origin.x, self.frame.size.width - buttonWidth, buttonWidth, self.frame.size.height);
    
    
}



@end
