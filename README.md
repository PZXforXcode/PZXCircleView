# PZXCircleView
圆环进度条，渐变圆环进度条
![在makrdown上生成gif动画](https://github.com/PZXforXcode/PZXCircleView/blob/master/圆环.gif)
```
@property(strong,nonatomic)PZXCircleView *circleProgressView;
@property(strong,nonatomic)PZXSharpCircleView *pzxsharpCircleView;


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


```

