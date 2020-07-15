//
//  UIViewController+PresentViewControllerOnIOS13.m
//  LearnCode
//
//  Created by NB_killer on 2020/7/15.
//  Copyright © 2020 NB_killer. All rights reserved.
//

#import "UIViewController+PresentViewControllerOnIOS13.h"

#import <objc/runtime.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation UIViewController (PresentViewControllerOnIOS13)

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    NSLog(@"分类方法被调用");
    
    [UIViewController invokeOriginalMethod:self selector:_cmd];
}

+ (void)invokeOriginalMethod:(id)target selector:(SEL)selector {
    // Get the class method list
    uint count;
    Method *list = class_copyMethodList([target class], &count);

    // Find and call original method .
    for ( int i = count - 1 ; i >= 0; i--) {
        Method method = list[i];
        SEL name = method_getName(method);
        IMP imp = method_getImplementation(method);
        if (name == selector) {
            ((void (*)(id, SEL))imp)(target, name);
            NSLog(@"调回宿主类方法");
            break;
        }
    }
    free(list);
}


#pragma clang diagnostic pop

@end
