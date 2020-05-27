//
//  PZXCircleView.h
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PZXCircleProgressLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface PZXCircleView : UIView
@property (nonatomic, assign) CGFloat progress;
@property(nonatomic,strong)PZXCircleProgressLayer *circleProgressLayer;
@property(nonatomic,strong)UILabel *perLabel;

@end

NS_ASSUME_NONNULL_END
