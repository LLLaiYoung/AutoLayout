//
//  Base4Controller.m
//  AutoLayout
//
//  Created by chairman on 16/6/5.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "Base4Controller.h"
#import "POP.h"
#import "MMTweenAnimation.h"
@interface Base4Controller ()
@property (nonatomic, strong) UIView *blockView;
@end

@implementation Base4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POP Animation";
    self.blockView = ({
        UIView *view = [UIView new];
        [self.view addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom).offset(-300);
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        view.backgroundColor = [UIColor darkGrayColor];
        view.layer.cornerRadius = 100;
        view;
    });
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    WEAKSELF
//    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"test" initializer:^(POPMutableAnimatableProperty *prop) {
//        prop.writeBlock = ^(id obj,const CGFloat values[]){
//            UIView *ball = obj;
//            [ball updateConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(weakSelf.view.bottom).offset(values[0]);
//            }];
//        };
////        prop.readBlock = ^(id obj, CGFloat *value) {
////            UIView *ball = obj;
////            for (MASLayoutConstraint *constaint in ball.constraints) {
////                if (constaint.firstAttribute == NSLayoutAttributeCenterY) {
////                    value[0] = constaint.constant;
////                }
////            }
////        };
//    }];
    
//    POPSpringAnimation *animation = [POPSpringAnimation animation];
//    animation.property = prop;
//    animation.fromValue = @(-300);
//    animation.toValue = @(0);
//    animation.springBounciness = 20;
//    animation.springSpeed = 10;
//    [self.blockView pop_addAnimation:animation forKey:@"test"];
    
    MMTweenAnimation *tweenAnimation = [MMTweenAnimation animation];
    tweenAnimation.functionType = MMTweenFunctionBounce;
    tweenAnimation.duration = 1.0f;
    tweenAnimation.fromValue = @[@(-300)];
    tweenAnimation.toValue = @[@(0)];
    tweenAnimation.animationBlock = ^(double c,   //current time offset(0->duration)
                                    double d,   //duration
                                    NSArray *v, //current value
                                    id target,
                                    MMTweenAnimation *animation
                                      )
    {
        double value = [v[0] doubleValue];
        
        [self.blockView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view.mas_bottom).offset(value);
        }];
    };
    
    [self.blockView pop_addAnimation:tweenAnimation forKey:@"test"];
}
- (void)dealloc {
    [self.blockView pop_removeAllAnimations];
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
