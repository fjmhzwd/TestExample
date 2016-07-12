//
//  SecondViewController.m
//  TestExample
//
//  Created by wayne on 15-8-30.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import "SecondViewController.h"
#import "PureLayout.h"

@interface SecondViewController ()
{
    BOOL isUpate;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidth;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self enter];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
}

- (void)updateViewConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    //    if (!self.didSetupConstraints) {
    //
    //    }
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
    [super updateViewConstraints]; //这种情况这里未装载STORYBOARD的约束,可能在tabbar里的原因
    if ([self.scrollView.constraints count] > 0)
    [self enter];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
}

- (void)enter
{
    if (!isUpate)
    {
        NSInteger pageCount = 5;
        [self.contentWidth autoRemove];
        self.contentWidth = [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView withMultiplier:pageCount];
        
        UIImageView *prevImage = nil;
        for (int i = 0; i < pageCount; ++i) {
            UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide_1"]];
            imgView.frame = self.scrollView.bounds;
            
            [self.contentView addSubview:imgView];
            
            [imgView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView];
            [imgView autoPinEdgeToSuperviewEdge:ALEdgeTop];
            [imgView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
            
            if (!prevImage) {
                // Align to contentView
                [imgView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
            } else {
                // Align to prev label
                [imgView autoConstrainAttribute:ALAttributeLeading toAttribute:ALAttributeTrailing ofView:prevImage];
            }
            
            if (i == pageCount - 1) {
                // Last page
                [imgView autoPinEdgeToSuperviewEdge:ALEdgeRight];
            }
            
            prevImage = imgView;
        }
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        isUpate = YES;
    }
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (IBAction)btn2Click:(id)sender {
    
}
@end

/*
 其实在viewWillAppear这里改变UI元素不是很可靠，Autolayout发生在viewWillAppear之后，严格来说这里通常不做视图位置的修改，而用来更新Form数据。改变位置可以放在viewWilllayoutSubview或者didLayoutSubview里，而且在viewDidLayoutSubview确定UI位置关系之后设置autoLayout比较稳妥。另外，viewWillAppear在每次页面即将显示都会调用，viewWillLayoutSubviews虽然在lifeCycle里调用顺序在viewWillAppear之后，但是只有在页面元素需要调整时才会调用，避免了Constraints的重复添加。
 
 6、如果需要在控制器中动态添加或者移除视图，在控制器中为新添加的视图增加约束，在updateViewConstrains中实现，然后调用[super updateViewConstrains]；同理，在view中动态添加或者移除视图，在updateConstrains中实现，然后调用[super updateConstrains]
 
 7、控制器在其view需要重新布局时会执行以下过程：
 
 ① 控制器的视图调整到新的尺寸 - 控制器会根据当前状态栏、导航条等其它因素的状态来调整其view的位置尺寸
 
 ② 如果没有使用autolayout，所有子视图会根据autoresizeing mask调整
 
 ③ 调用viewWillLayoutSubviews
 
 ④ 调用控制器视图的layoutSubviews，如果是使用autolayout，则会调用updateViewConstrains -> 该方法的实现会调用所有子视图的updateConstraints -> 更新完约束之后，所有视图会根据计算出来的新的布局更新位置
 
 ⑤ 调用控制器的viewDidLayoutSubviews
 */
