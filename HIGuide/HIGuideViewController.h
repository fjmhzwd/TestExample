//
//  HIGuideViewController.h
//  HIME
//
//  Created by wayne on 15-9-16.
//  Copyright (c) 2015年 wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIGuideViewController : UIViewController

- (instancetype)initWithPages:(NSArray*)array completion:(dispatch_block_t)completion;

@end
