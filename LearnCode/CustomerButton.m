//
//  CustomerButton.m
//  webTest
//
//  Created by peng.zhou@fengjr.com on 2020/6/18.
//  Copyright © 2020 FJPH. All rights reserved.
//

#import "CustomerButton.h"

@implementation CustomerButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     if (!self.userInteractionEnabled ||
        [self isHidden] ||
        self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
    // 倒叙遍历当前对象的子视图
    __block UIView *hit = nil;
    [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse
    usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull
    stop) {
        // 坐标转换
        CGPoint vonertPoint = [self convertPoint:point toView:obj];
        // 调用子视图的hittest方法
        hit = [obj hitTest:vonertPoint withEvent:event];
        // 如果找到了接受事件的对象，则停止遍历
        if (hit) {
            *stop = YES;
          }
    }];
           
        if (hit) {
                return hit;
            } else {
                return self;
                }
    } else {
        
    return nil;
        
    }
}

//扩大button的点击范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    bounds = CGRectInset(bounds, -50, -50);
    return CGRectContainsPoint(bounds, point);
}


//设置button的点击范围
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//
//    CGFloat x = point.x;
//    CGFloat y = point.y;
//    CGFloat centerX = self.frame.size.width / 2;
//    CGFloat centerY = self.frame.size.height / 2;
//
//    double dis = sqrt((x - centerX) * (x - centerX) + (y - centerY) * (y -
//  centerY));
//
//      if (dis <= self.frame.size.width / 2) {
//          return YES;
//      } else {
//          return NO;
//      }
//
//}


@end
