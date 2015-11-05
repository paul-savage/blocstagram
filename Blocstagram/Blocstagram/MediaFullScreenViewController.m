//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Paul Savage on 12/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"


@interface MediaFullScreenViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;

@end


@implementation MediaFullScreenViewController

- (instancetype)initWithMedia:(Media *)media {
    
    self = [super init];
    
    if (self) {
        
        self.media = media;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.contentSize = self.media.image.size;

    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    self.tap.numberOfTapsRequired = 1;
    
    if (self.modalPresentationStyle == UIModalPresentationFormSheet)
    {
        self.tap.cancelsTouchesInView = NO;
        self.tap.delegate = self;
    }
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    if (self.modalPresentationStyle != UIModalPresentationFormSheet)
    {
        [self.scrollView addGestureRecognizer:self.tap];
    }
    
    [self.scrollView addGestureRecognizer:self.doubleTap];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.modalPresentationStyle == UIModalPresentationFormSheet)
    {
        [self.view.window addGestureRecognizer:self.tap];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}

- (void) viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    self.scrollView.frame = self.view.bounds;
    
    [self recalculateZoomScale];
}

- (void)recalculateZoomScale
{
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    scrollViewContentSize.height /= self.scrollView.zoomScale;
    scrollViewContentSize.width /= self.scrollView.zoomScale;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
}

- (void)centerScrollView {
    
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
        
    } else {
        
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
        
    } else {
        
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}


#pragma mark - Gesture Recognizers

- (void)tapFired:(UITapGestureRecognizer *)sender {
    
    if (self.modalPresentationStyle == UIModalPresentationFormSheet)
    {
        [self.view.window removeGestureRecognizer:self.tap];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doubleTapFired:(UITapGestureRecognizer *)sender {
    
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
        
    } else {

        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    [self centerScrollView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
