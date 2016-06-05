//
//  Base3Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/5.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base3Controller.h"
/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;

@interface Base3Controller ()
@property (nonatomic, strong) UIView *blockView;
@end

@implementation Base3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry Animation";
    self.blockView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view).centerOffset(CGPointMake(0, -300));
            make.size.equalTo(CGSizeMake(100, 100));
        }];
        //* 缩放效果 */
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3, 0.3);
        view.backgroundColor = [UIColor darkGrayColor];
        view;
    });
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    WEAKSELF
    /** 弹簧动画效果 */
    [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations:^{
        [weakSelf.blockView updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf.view);
        }];
        //* 更新或者重置约束需要调用layoutIfNeeded重新布局 */
        [weakSelf.view layoutIfNeeded];
        
        weakSelf.blockView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
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
