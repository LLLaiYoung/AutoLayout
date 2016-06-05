//
//  LYView.m
//  AutoLayout
//
//  Created by chairman on 16/6/4.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "LYView.h"

@implementation LYView

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    NSLog(@"%@",NSStringFromCGSize(size));
    return self.innerSize;
}

@end
