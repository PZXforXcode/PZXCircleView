//
//  ViewController.m
//  PZXCoreAnimation
//
//  Created by quark123321 on 2020/5/26.
//  Copyright © 2020 pengzuxin. All rights reserved.
//

#import "ViewController.h"
#import "PZXCircleView.h"

#import "PZXSharpCircleView.h"

@interface ViewController ()

@property(strong,nonatomic)PZXCircleView *circleProgressView;
@property(strong,nonatomic)PZXSharpCircleView *pzxsharpCircleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self pathKeyframeAni];
    
    [self initPZXCircle];
    [self initPZXSharpCircle];

    
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 400, 275, 10)];
    [slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.f;
    slider.value = self.circleProgressView.progress;
    [self.view addSubview:slider];

}
-(void)initPZXSharpCircle{
    
    self.pzxsharpCircleView = [[PZXSharpCircleView alloc]initWithFrame:CGRectMake(150, 200, 200, 200)];
    self.pzxsharpCircleView.pzx_progress = 0.0;
    self.pzxsharpCircleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pzxsharpCircleView];
    
}
-(void)initPZXCircle{
    
    self.circleProgressView = [[PZXCircleView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.circleProgressView.progress = 0.0;
    self.circleProgressView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.circleProgressView];
}

- (void)changeProgress:(UISlider *)slider {
    
    self.circleProgressView.progress = slider.value;
    self.pzxsharpCircleView.pzx_progress = slider.value;
//    [self.circleProgressView setNeedsDisplay];
}
@end
