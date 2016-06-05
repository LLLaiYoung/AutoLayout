//
//  Base6Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/5.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base6Controller.h"
#import "MMPlaceHolder.h"
@interface Base6Controller ()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation Base6Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"StackView";
    UIStackView *stackView = ({
        UIStackView *view = [UIStackView new];
        [self.view addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.centerY.equalTo(self.view);
            make.height.equalTo(@200);
        }];
        //* 设置方向 */
        view.axis = UILayoutConstraintAxisHorizontal;
        //* 设置对齐格式 */
        view.alignment = UIStackViewAlignmentCenter;
        //* 分布 */
        view.distribution = UIStackViewDistributionFill;
        //* 间距 */
//        view.spacing = 5;
        
        view;
    });
    self.stackView = stackView;
    
    UIView *backView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(stackView);
        }];
        view.backgroundColor = [UIColor grayColor];
        view;
    });
    
    [self.view sendSubviewToBack:backView];
    
//    NSArray *array = @[[UIView new],[UIView new],[UIView new],[UIView new]];
//    for (NSInteger i=0 ; i <array.count ; i++) {
//        UIView *view = array[i];
//        [view makeConstraints:^(MASConstraintMaker *make) {
//            //* 约束冲突,降低优先级 */
//            make.size.equalTo(CGSizeMake(10 + i * 10, 80 - i * 10)).priorityLow();
//        }];
//        [view showPlaceHolder];
//        view.backgroundColor = [UIColor redColor];
//        view.layer.borderColor = [UIColor blackColor].CGColor;
//        view.layer.borderWidth = 2.0;
//        /** 添加到stackView */
//        [stackView addArrangedSubview:view];
//    }
    
    /** 手动修改变stackView的约束 */
//    UIView *v1 = array[0];
//    [v1 makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(array[1]).priority(UILayoutPriorityRequired);
//    }];
    
    
    
    //* 解决拉伸问题、1.可以设置label的content priority 2.添加一个view直接添加到stackView里面 */
    
//    UILabel *label = ({
//        UILabel *label = [UILabel new];
//        [stackView addArrangedSubview:label];
//        label.text = @"testtest";
//        label.textColor = [UIColor blackColor];
//        label.backgroundColor = [UIColor cyanColor];
////        [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
//        label;
//    });
//    UILabel *label2 = ({
//        UILabel *label = [UILabel new];
//        [stackView addArrangedSubview:label];
//        label.text = @"tttttttttttttt";
//        label.textColor = [UIColor blackColor];
//        label.backgroundColor = [UIColor orangeColor];
//        label;
//    });
//    
//    
//    UIView *spacer = ({
//        UIView *view = [UIView new];
//        [stackView addArrangedSubview:view];
//        view.backgroundColor = [UIColor greenColor];
//        [view makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@30);
//        }];
//        NSLog(@"size = %@",NSStringFromCGSize(view.intrinsicContentSize));
//        
//        view;
//    });
    
    
    //* 善用spacer */
    UIView *spacer = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@30);
        }];
//        view.backgroundColor = [UIColor purpleColor];
        view;
    });
    
    UIView *v1 = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(30, 50)).priorityLow();
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    
    UIView *v2 = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(10, 30)).priorityLow();
        }];
        view.backgroundColor = [UIColor blueColor];
        view;
    });
    
    UIView *v3 = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(60, 70)).priorityLow();
        }];
        view.backgroundColor = [UIColor cyanColor];
        view;
    });
    UIView *spacer2 = ({
        UIView *view = [UIView new];
        [stackView addArrangedSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@30);
        }];
//        view.backgroundColor = [UIColor blackColor];
        view;
    });
    /** 需要手动设置约束让他们宽相等 */
    [spacer makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(spacer2);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (NSLayoutConstraint *constraint in self.stackView.constraints) {
        NSLog(@"%@",constraint);
    }
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
