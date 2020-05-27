//
//  PZXSharpCircleView.m
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "PZXSharpCircleView.h"

@implementation PZXSharpCircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
        CGFloat lineWidth = 10.0;
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:(rect.size.width - lineWidth) /2 startAngle:M_PI / 4 + M_PI / 2 endAngle:M_PI / 4 clockwise:YES];
        //先画一个背景环
        CAShapeLayer *bgLayer = [CAShapeLayer layer];
        bgLayer.frame = self.bounds;
    //    bgLayer.position = self.center;
        bgLayer.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明色
        bgLayer.lineWidth = lineWidth;
        bgLayer.strokeColor = [UIColor lightGrayColor].CGColor;//线条颜色
        bgLayer.strokeStart = 0;
        bgLayer.strokeEnd = 1;
        bgLayer.lineCap = kCALineCapRound;
        bgLayer.path = circlePath.CGPath;
        [self.layer addSublayer:bgLayer];
    
    
        //一个红色进度

        _pzx_shapeLayer = [CAShapeLayer layer];
        _pzx_shapeLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        _pzx_shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _pzx_shapeLayer.lineWidth = lineWidth;
        _pzx_shapeLayer.lineCap = kCALineCapRound;
        _pzx_shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        _pzx_shapeLayer.strokeStart = 0;
        _pzx_shapeLayer.strokeEnd = 0;
        _pzx_shapeLayer.path = circlePath.CGPath;
        [self.layer addSublayer:_pzx_shapeLayer];
    
    self.gradientLayer = [CAGradientLayer layer];
    
    //左边的渐变图层
    CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
    leftGradientLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [leftGradientLayer setColors:[NSArray arrayWithObjects:(id)[UIColor yellowColor].CGColor,(id)[UIColor orangeColor].CGColor,(id)[UIColor redColor].CGColor, nil]];
    [leftGradientLayer setLocations:@[@0,@0.6]];
//    [leftGradientLayer setStartPoint:CGPointMake(0, 0)];
//    [leftGradientLayer setEndPoint:CGPointMake(0.8, -0.2)];//x  y
    [leftGradientLayer setStartPoint:CGPointMake(0.2, 0)];
    [leftGradientLayer setEndPoint:CGPointMake(1, 0)];//x  y
    [_gradientLayer addSublayer:leftGradientLayer];

    //用两个实现
    //    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
    //    rightGradientLayer.frame = CGRectMake(rect.size.width / 2, 0, rect.size.width / 2, rect.size.height);
    //    [rightGradientLayer setColors:[NSArray arrayWithObjects:(id)[UIColor orangeColor].CGColor, (id)[UIColor redColor].CGColor, nil]];
    //    [rightGradientLayer setLocations:@[@0.1, @1]];
    //    [rightGradientLayer setStartPoint:CGPointMake(0.5, 0)];
    //    [rightGradientLayer setEndPoint:CGPointMake(0.5, 1)];
    //    [_gradientLayer addSublayer:rightGradientLayer];

    [self.gradientLayer setMask:_pzx_shapeLayer];//使用之后渐变layer只显示圆环部分，不然会显示整个view
    self.gradientLayer.frame = self.bounds;//设置layer frame
    //渐变图层映射到进度条路径上面
    [self.layer addSublayer:self.gradientLayer];//给view添加layer

}

- (void)setPzx_progress:(CGFloat)pzx_progress{
    //关闭隐式动画
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
    _pzx_shapeLayer.strokeEnd = pzx_progress;
//    [CATransaction commit];

}
@end
