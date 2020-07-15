//
//  ViewReusePool.m
//  webTest
//
//  Created by peng.zhou@fengjr.com on 2020/6/18.
//  Copyright © 2020 FJPH. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()

//等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitUsedqueue;

//使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end
/*
   数据源同步解决方案:
   1、并发访问，数据拷贝：可以实时显示修改后的UI，但需要记录同步删除动作和数据拷贝，会增加内存开销。
 
   2、串行访问：对内存消耗不大，但是修改数据的显示有延迟。
  如：在子线程中进行网络请求、数据解析，会把请求回来的数据在串行队列做新增数据预排版，这时在主线程中删除某一行数据，需要调用同步的方式在串行队列中进行处理，那么就需要等待一小会儿，完成删除同步之后再去主线程中更新UI。
      缺点：在子线程处理比较耗时的操作时，删除某一行动作会有一定延迟。
 */

@implementation ViewReusePool

- (instancetype)init {
    self = [super init];
    if (self) {
        _waitUsedqueue = [NSMutableSet set];
        _usingQueue    = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReuseableView {
    UIView *view = [_waitUsedqueue anyObject];
    if (view == nil) {
        return nil;
    }
    else{
        //进行队列的移动
        [_waitUsedqueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)addUsingView:(UIView *)view{
    if (view == nil) {
        return;
    }
    [_usingQueue addObject:view];
}

- (void)reset {
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        //从使用中队列删除
        [_usingQueue removeObject:view];
        //加入等待使用的队列
        [_waitUsedqueue addObject:view];
    }
}


@end
