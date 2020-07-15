//
//  UIViewController+PresentViewControllerOnIOS13.h
//  LearnCode
//
//  Created by NB_killer on 2020/7/15.
//  Copyright © 2020 NB_killer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PresentViewControllerOnIOS13)

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
