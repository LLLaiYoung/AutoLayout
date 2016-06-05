//
//  BaseController.h
//  AutoLayout
//
//  Created by chairman on 16/6/4.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;
#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface BaseController : UIViewController

@end
