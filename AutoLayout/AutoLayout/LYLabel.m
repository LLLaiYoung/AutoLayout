//
//  LYLabel.m
//  AutoLayout
//
//  Created by chairman on 16/6/4.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "LYLabel.h"

@implementation LYLabel

- (CGSize)intrinsicContentSize {
    NSLog(@"%@",NSStringFromCGSize([super intrinsicContentSize]));
    return [super intrinsicContentSize];
}
@end
