//
//  HIGuideViewController.m
//  HIME
//
//  Created by wayne on 15-9-16.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import "HIGuideViewController.h"
#import "PureLayout.h"

@interface HIGuideViewController ()
{
    NSMutableArray *imgArray;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidth;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (copy, nonatomic) dispatch_block_t finish;

@end

@implementation HIGuideViewController

- (instancetype)initWithPages:(NSArray*)array completion:(dispatch_block_t)completion
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self.finish = completion;
        imgArray = [NSMutableArray arrayWithArray:array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initPage
{
    NSInteger pageCount = [imgArray count];
    
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
    
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
    
    self.pageControl.numberOfPages = pageCount;
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

- (void)updateViewConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    //    if (!self.didSetupConstraints) {
    //
    //    }
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
    [self initPage];
    [super updateViewConstraints];
    NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
}

-(void)gestureAction:(UITapGestureRecognizer *)tap{
    
    UIView *tapView = tap.view;
    
    //禁用
    tapView.userInteractionEnabled = NO;
    
    if(UIGestureRecognizerStateEnded == tap.state) [self dismiss];
}

-(void)dismiss{
    
    if (!self.finish)
    {
        self.finish();
        self.finish = nil;
    }
}


@end
