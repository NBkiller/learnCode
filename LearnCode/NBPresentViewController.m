//
//  NBPresentViewController.m
//  LearnCode
//
//  Created by NB_killer on 2020/7/15.
//  Copyright © 2020 NB_killer. All rights reserved.
//

#import "NBPresentViewController.h"
#import "CustomerButton.h"

@interface NBPresentViewController ()

@end

@implementation NBPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CustomerButton *tkBtn = [[CustomerButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width /2.0 -50, self.view.frame.size.height / 2.0, 100, 100)];
    tkBtn.backgroundColor = [UIColor grayColor];
    [tkBtn addTarget:self action:@selector(CustomerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tkBtn];

}

- (void)CustomerButtonClick {
    NSLog(@"CustomerButtonClick 被点击了");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
