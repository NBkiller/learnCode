//
//  ViewController.m
//  LearnCode
//
//  Created by NB_killer on 2020/7/2.
//  Copyright © 2020 NB_killer. All rights reserved.
//

#import "ViewController.h"
#import "CustomerButton.h"
#import "NBPresentViewController.h"
#import "UIViewController+PresentViewControllerOnIOS13.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";

    CustomerButton *tkBtn = [[CustomerButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width /2.0 -50, self.view.frame.size.height / 2.0, 100, 100)];
    tkBtn.backgroundColor = [UIColor grayColor];
    [tkBtn addTarget:self action:@selector(CustomerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tkBtn];

    
//    @synchronized (self) {
//        @synchronized (self) {
//            NSLog(@"aaaaaa");
//        }
//    }
}

- (void)CustomerButtonClick {
    NSLog(@"CustomerButtonClick 被点击了");
    
    NBPresentViewController *presentVC = [[NBPresentViewController alloc] init];
    [self presentViewController:presentVC animated:YES completion:nil];
}

@end
