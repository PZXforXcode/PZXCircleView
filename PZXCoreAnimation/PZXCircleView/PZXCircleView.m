//
//  PZXCircleView.m
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "PZXCircleView.h"

@interface PZXCircleView ()<CAAnimationDelegate>

@end

@implementation PZXCircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleProgressLayer = [PZXCircleProgressLayer layer];
        self.circleProgressLayer.frame = self.bounds;        //像素大小比例
        self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleProgressLayer];

        self.perLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        self.perLabel.center = self.center;
        self.perLabel.textAlignment = NSTextAlignmentCenter;
        self.perLabel.font = [UIFont systemFontOfSize:20.f];
        self.perLabel.textColor = [UIColor blueColor];
        [self addSubview:self.perLabel];

    }
    return self;
}




- (void)setProgress:(CGFloat)progress {

    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"progress"];
//    ani.duration = 5.0 * fabs(progress - _progress);
    ani.toValue = @(progress);
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.delegate = self;
    [self.circleProgressLayer addAnimation:ani forKey:@"progressAni"];
    _progress = progress;
    self.perLabel.text = [NSString stringWithFormat:@"%%%.0f",progress*100];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.circleProgressLayer.progress = self.progress;
}




- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"rect = %f,%f,%f,%f",rect.origin.x,rect.origin.x,rect.size.width,rect.size.height);
    CGFloat lineWidth = 10.0;
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:(rect.size.width - lineWidth) /2 startAngle:0 endAngle:M_PI*2*self.progress clockwise:YES];
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:(rect.size.width - lineWidth) /2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    //下方有缺口的类型
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:(rect.size.width - lineWidth) /2 startAngle:M_PI / 4 + M_PI / 2 endAngle:M_PI / 4 clockwise:YES];

    path.lineCapStyle = kCGLineCapRound;
    [[UIColor lightGrayColor] setStroke];
    [path setLineWidth:lineWidth];
    [path stroke];
    
    
}
@end
