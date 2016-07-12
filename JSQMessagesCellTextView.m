//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesCellTextView.h"

@implementation JSQMessagesCellTextView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.textColor = [UIColor whiteColor];
    self.editable = NO;
    //    self.selectable = YES;
//    self.selectable = NO;   //添加表情后包含表情时无法选择，改成默认不允许选中 by wayne 2014.12.30  //modify - wayne
    self.userInteractionEnabled = YES;
    self.dataDetectorTypes = UIDataDetectorTypeAll;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
//    self.delaysContentTouches = NO;
    self.scrollEnabled = NO;
    self.backgroundColor = [UIColor clearColor];
    self.contentInset = UIEdgeInsetsZero;
    self.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.contentOffset = CGPointZero;
    self.textContainerInset = UIEdgeInsetsZero;
    self.textContainer.lineFragmentPadding = 0;
    self.linkTextAttributes = @{ NSForegroundColorAttributeName : [UIColor redColor],
                                 NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
}

- (void)setSelectedRange:(NSRange)selectedRange
{
    //  attempt to prevent selecting text
    [super setSelectedRange:NSMakeRange(NSNotFound, 0)];
}

- (NSRange)selectedRange
{
    //  attempt to prevent selecting text
    return NSMakeRange(NSNotFound, NSNotFound);
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //  ignore double-tap to prevent copy/define/etc. menu from showing
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)gestureRecognizer;
        if (tap.numberOfTapsRequired == 2) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //  ignore double-tap to prevent copy/define/etc. menu from showing
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)gestureRecognizer;
        if (tap.numberOfTapsRequired == 2) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)canBecomeFirstResponder
{
//    self.selectable = NO;
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:NO];
//        self.selectable = YES;
//    }];
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender //modify - wayne 2016.3.14 避免弹出其它菜单
{
    return NO;
    if (action == @selector(copy:) || action == @selector(paste:)) {
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
    self.selectable = NO;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:NO];
        self.selectable = YES;
    }];
    
    return [super canPerformAction:action withSender:sender];
    return NO;
    if (action == @selector(paste:))
        return NO;
    return [super canPerformAction:action withSender:sender];
//    [UIMenuController sharedMenuController].menuVisible = NO;  //do not display the menu
//    [self resignFirstResponder];                      //do not allow the user to selected anything
//    return NO;
    if (action == @selector(paste:))
    {
//        UITextRange *range = [[UITextRange alloc]init];
//        range.start = [self beginningOfDocument];
//        range.end = [self beginningOfDocument];
//        self.selectedTextRange = range;
//        DLog(@"%d-%d", self.selectedRange.location, self.selectedRange.location);
        return NO;
    }
    else
    {
        return YES;
    }
}

@end
