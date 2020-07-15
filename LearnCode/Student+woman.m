//
//  Student+woman.m
//  LearnCode
//
//  Created by NB_killer on 2020/7/15.
//  Copyright © 2020 NB_killer. All rights reserved.
//

#import "Student+woman.h"
#import <objc/runtime.h>

@implementation Student (woman)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)studyEnglish {
    NSLog(@"woman -- studyEnglish");
    
    [Student invokeOriginalMethod:self selector:_cmd];
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
