//
//  PZXCircleProgressLayer.m
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "PZXCircleProgressLayer.h"

@implementation PZXCircleProgressLayer

- (void)drawInContext:(CGContextRef)ctx {
    
    
    
    CGFloat radius = self.bounds.size.width / 2;
    CGFloat lineWidth = 10.0;
    
    


//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle:0.f endAngle:M_PI * 2 * self.progress clockwise:YES];
    //从底部开始
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle: M_PI / 2 endAngle: (M_PI / 2)+(M_PI * 2)*self.progress clockwise:YES];
//下方有缺口的类型
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle:3*M_PI / 4  endAngle:(3*M_PI / 4)+((6*M_PI)/4)*self.progress clockwise:YES];

    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
    CGContextSetLineWidth(ctx, lineWidth);//线条宽度
    CGContextSetLineCap(ctx, kCGLineCapRound);//圆弧
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
- (instancetype)initWithLayer:(PZXCircleProgressLayer *)layer {
    NSLog(@"initLayer");
    if (self = [super initWithLayer:layer]) {
        self.progress = layer.progress;
    }
    return self;
}

@end
