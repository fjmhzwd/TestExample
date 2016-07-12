//
//  ViewController.m
//  AutoLayout
//
//  Created by Allen Hsu on 11/17/14.
//  Copyright (c) 2014 Glow, Inc. All rights reserved.
//

#import "ViewController.h"
#import "PureLayout.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidthConstraint;
@property (assign, nonatomic) int pageBeforeRotation;
@property (assign, nonatomic) int totalPages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self generateRandomPages];
//    [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.xxx"]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    int page = roundf(self.scrollView.contentOffset.x / self.scrollView.frame.size.width);
    page = MIN(MAX(page, 0), self.totalPages);
    self.pageBeforeRotation = page;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * self.pageBeforeRotation, 0.0);
}

- (IBAction)didClickRegenerate:(id)sender {
    [self generateRandomPages];
}

- (void)generateRandomPages
{
    int pages = arc4random() % 10 + 10;
    self.contentView.backgroundColor = [UIColor blueColor];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    [self setupPages:pages];
}

- (void)setupPages:(int)pages
{
    
//    [UIView animateWithDuration:0.3 animations:^{
//        self.contentView.alpha = 0.0;
//    } completion:^(BOOL finished) {
    self.totalPages = pages;
        NSArray *subviews = self.contentView.subviews;
        for (UIView *view in subviews) {
            [view removeFromSuperview];
        }
            NSLog(@"%@=%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.scrollView.frame) );
        [self.contentWidthConstraint autoRemove];
        self.contentWidthConstraint = [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.scrollView withMultiplier:pages];
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
//        
//        [UIView animateWithDuration:0.3 animations:^{
//            self.contentView.alpha = 1.0;
//        }];
//    }];
}

- (UIStoryboard*)getMainStoryBoard
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return storyBoard;
}

- (UIViewController*) getMainViewController
{
    UIStoryboard *storyBoard = [self getMainStoryBoard];
    return [storyBoard instantiateInitialViewController];
}

- (UIViewController*) getViewControllerByIdentifier:(NSString*)identifier
{
    UIStoryboard *storyBoard = [self getMainStoryBoard];
    return [storyBoard instantiateViewControllerWithIdentifier:identifier];
}

- (IBAction)btnClick:(id)sender {
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
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
    [super updateViewConstraints];
}

@end
