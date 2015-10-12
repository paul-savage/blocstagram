//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Paul Savage on 12/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <UIKit/UIKit.h>

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//@class Media;
@class MediaTableViewCell;


@protocol MediaFullScreenViewControllerDelegate <NSObject>

- (void)shareCell:(MediaTableViewCell *)cell;

@end
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@property (nonatomic, weak) id <MediaFullScreenViewControllerDelegate> delegate;
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//- (instancetype)initWithMedia:(Media *)media;
- (instancetype)initWithCell:(MediaTableViewCell *)cell;
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- (void)centerScrollView;

@end
