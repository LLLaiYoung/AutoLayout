//
//  Base5Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/5.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base5Controller.h"

@interface Base5Controller ()

@end

@implementation Base5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ScrollVoew";
    UIScrollView *scrollView = ({
        UIScrollView *view = [UIScrollView new];
        [self.view addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
//            make.edges.equalTo(self.view);
        }];
        
        view.backgroundColor = [UIColor lightGrayColor];
        view;
    });
    
    UIView *containerView = ({
        UIView *view = [UIView new];
        [scrollView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
        }];
        view;
    });
    
    
    CGSize size = CGSizeMake(100, 100);
    
    UIView *v1 = ({
        UIView *view = [UIView new];
        [containerView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    UIView *v2 = ({
        UIView *view = [UIView new];
        [containerView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.left.equalTo(v1.right);
            make.top.equalTo(v1.bottom);
        }];
        view.backgroundColor = [UIColor yellowColor];
        view;
    });
    UIView *v3 = ({
        UIView *view = [UIView new];
        [containerView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.right.equalTo(v2.left );
            make.top.equalTo(v2.bottom);
        }];
        view.backgroundColor = [UIColor greenColor];
        view;
    });
    UIView *v4 = ({
        UIView *view = [UIView new];
        [containerView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.right.equalTo(v3.left);
            make.top.equalTo(v3.bottom);
        }];
        view.backgroundColor = [UIColor blueColor];
        view;
    });
    UIView *v5 = ({
        UIView *view = [UIView new];
        [containerView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(size);
            make.left.equalTo(v4.right);
            make.top.equalTo(v4.bottom);
        }];
        view.backgroundColor = [UIColor orangeColor];
        view;
    });
    
    
    [containerView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(v1);
        make.left.equalTo(v4);
        make.bottom.equalTo(v5);
        make.right.equalTo(v2);
    }];
    [self.view layoutIfNeeded];
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
