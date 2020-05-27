//
//  PZXSharpCircleView.h
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PZXSharpCircleView : UIView

@property (nonatomic, assign) CGFloat pzx_progress;
//进度圆环
@property (nonatomic, strong) CAShapeLayer *pzx_shapeLayer;
@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end

NS_ASSUME_NONNULL_END
