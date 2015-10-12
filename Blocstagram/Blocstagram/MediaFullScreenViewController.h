//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Paul Savage on 12/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;


@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype)initWithMedia:(Media *)media;
- (void)centerScrollView;

@end
