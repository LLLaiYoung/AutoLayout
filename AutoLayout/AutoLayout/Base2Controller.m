//
//  Base2Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/4.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base2Controller.h"

@interface Base2Controller ()

@end

@implementation Base2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频播放";
    /** 播放器,旋转到横屏的时候会自动填充慢整个屏幕 */
    UIView *playerView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.view);
            make.height.equalTo(view.width).multipliedBy(9.0f/16.0f);
//            make.height.equalTo(self.view).greaterThanOrEqualTo
        }];
        view.backgroundColor = [UIColor blackColor];
        view;
    });

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
