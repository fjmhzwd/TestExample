//
//  ThirdViewController.m
//  TestExample
//
//  Created by wayne on 15-9-17.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UIView *uvBlue;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthBlue;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.widthBlue.constant = self.widthBlue.constant + 100;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnClick:(id)sender {
    
}

- (void)updateViewConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    //    if (!self.didSetupConstraints) {
    //
    //    }
    [super updateViewConstraints];//这种情况这里已装载STORYBOARD的约束
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}


@end
