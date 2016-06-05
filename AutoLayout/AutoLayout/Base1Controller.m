//
//  Base1Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/4.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base1Controller.h"
#import "LYView.h"
#import "LYLabel.h"
@interface Base1Controller ()
@property (nonatomic, strong) UILabel *centerLabel;
@end

@implementation Base1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view1 = ({
//        UIView *view = [UIView new];
//        [self.view addSubview:view];
//        [view makeConstraints:^(MASConstraintMaker *make) {
//            make.size.equalTo(CGSizeMake(50, 50));
////            //* 等价 */
////            make.width.equalTo(@50);
////            make.height.equalTo(@50);
////            //* 等价 */
////            make.width.mas_equalTo(@50);
////            make.height.mas_equalTo(@50);
//            
//            make.left.top.equalTo(self.view);
//            
//            //* 不设置edgesForExtendedLayout为UIRectEdgeNone 则需要这么写 */
////            make.top.equalTo(self.mas_topLayoutGuide);
//            
//        }];
//        view.backgroundColor = [UIColor blueColor];
//        view;
//    });
//    //* 如果设置了layoutMargin就是相当于给这个View加了一个透明的一个宽度,用处不大 */
//    UIView *view2 = ({
//        UIView *view = [UIView new];
//        [self.view addSubview:view];
//        [view makeConstraints:^(MASConstraintMaker *make) {
//            make.size.equalTo(CGSizeMake(50, 50));
//            make.left.equalTo(view1.right);
//            make.top.equalTo(view1.bottom);
//        }];
//        view.backgroundColor = [UIColor blueColor];
//        view.layoutMargins = UIEdgeInsetsMake(-20, -20, -20, -20);
//        view;
//    });
    
//    UIView *view3 = ({
//        LYView *view = [LYView new];
//        [self.view addSubview:view];
//        [view makeConstraints:^(MASConstraintMaker *make) {
////            make.size.equalTo(CGSizeMake(50, 50));
////            make.centerY.equalTo(view2);
////            make.left.equalTo(view2.mas_rightMargin);
//            make.center.equalTo(self.view);
//            make.width.equalTo(@50);
//        }];
//        /*
//         如果不设置view的大小,只设置View的position,然后公开一个属性innerSize,设置这个innerSize,重写view的intrinsicContentSize 然后返回自己设置的innerSize,这个innerSize则是这个view的大小.
//         设置View的大小(系统,并不是自己公开的属性),则会返回这个大小,哪怕intrinsicContentSize返回的是自己设置的属性的这个变量
//         不指定width和height的时候会使用它系统的intrinsicContentSize值
//        */
//        view.innerSize = CGSizeMake(100, 100);
//        view.backgroundColor = [UIColor redColor];
//        view;
//    });
    
//    UIView *view4 = ({
//        LYLabel *label = [LYLabel new];
//        [self.view addSubview:label];
//        /*
//          没有给label指定高度的时候自己也会通过intrinsicContentSize计算出高度
//         */
//        [label makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.view);
//            make.width.equalTo(@150);
//        }];
//        label.text = @"sdsssssssssndnfkjhsdfkhkdfhkewhrkjewhkjrhkewjh";
//        label.numberOfLines = 0;
//        label.backgroundColor = [UIColor darkGrayColor];
//        
//        label;
//    });
    
    
    UILabel *label1 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(self.view);
        }];
        label.text = @"左边文字";
        label.backgroundColor = [UIColor darkGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        //* 设置不被拉宽 */
        [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        //* 设置不被压缩 */
        [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });
    
    UILabel *label2 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.left.equalTo(label1.right);
        }];
        label.text = @"中间文字";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.backgroundColor = [UIColor yellowColor];
        label;
    });
    self.centerLabel = label2;
    UILabel *label3 = ({
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view);
            make.left.equalTo(label2.right);
            make.right.equalTo(self.view);
        }];
        label.text = @"右边文字";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor darkGrayColor];
        label.textColor = [UIColor cyanColor];
        //* 设置不被压缩 */
        [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        label;
    });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  self.centerLabel.text = [self.centerLabel.text stringByAppendingString:@"Test"];
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
