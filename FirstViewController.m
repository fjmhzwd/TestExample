//
//  FirstViewController.m
//  TestExample
//
//  Created by wayne on 15-8-30.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import "FirstViewController.h"
#import "zwdEXT2-Swift.h"
#import "PureLayout.h"
#import "HIGuideViewController.h"

@interface FirstViewController ()
{
    HIGuideViewController *viewController;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidth;
@end

@implementation FirstViewController
- (IBAction)btnTest:(id)sender {
    viewController = [[HIGuideViewController alloc]initWithPages:@[@"guide_1", @"guide_1", @"guide_1", @"guide_1"] completion:^{
        
    }];
    [self presentViewController:viewController animated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.txtView.linkTextAttributes = @{ NSForegroundColorAttributeName : [UIColor redColor],
//                                 NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                     NSUnderlineColorAttributeName: [UIColor blackColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternDash)};
    self.txtView.linkTextAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor],
                                          NSUnderlineColorAttributeName: [UIColor redColor],
                                          NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
/*
//    [UIView animateWithDuration:0.3 animations:^{
//        self.contentView.alpha = 0.0;
//    } completion:^(BOOL finished) {
        NSArray *subviews = self.contentView.subviews;
        for (UIView *view in subviews) {
            [view removeFromSuperview];
        }
        NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
        [self.contentWidth autoRemove];
        NSInteger pages = 10;
        self.contentWidth = [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView withMultiplier:pages];
        NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
        UILabel *prevLabel = nil;
        for (int i = 0; i < pages; ++i) {
            UILabel *pageLabel = [[UILabel alloc] initWithFrame:self.scrollView.bounds];
            pageLabel.text = [NSString stringWithFormat:@"Page %d of %d", i + 1, pages];
            pageLabel.font = [UIFont fontWithName:@"Georgia-Italic" size:18.0];
            pageLabel.textAlignment = NSTextAlignmentCenter;
            
            [self.contentView addSubview:pageLabel];
            
            [pageLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView];
            [pageLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
            [pageLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
            
            if (!prevLabel) {
                // Align to contentView
                [pageLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
            } else {
                // Align to prev label
                [pageLabel autoConstrainAttribute:ALAttributeLeading toAttribute:ALAttributeTrailing ofView:prevLabel];
            }
            
            if (i == pages - 1) {
                // Last page
                [pageLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
            }
            
            prevLabel = pageLabel;
        }
        
        self.scrollView.contentOffset = CGPointZero;
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        
//        [UIView animateWithDuration:0.3 animations:^{
//            self.contentView.alpha = 1.0;
//        }];
//    }];
    return;
    */
    
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
    [super updateViewConstraints];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
    [super viewWillLayoutSubviews];
}

@end
