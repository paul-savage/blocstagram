//
//  UIImage+ImageUtilities.h
//  
//
//  Created by Paul Savage on 26/10/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *)imageWithFixedOrientation;
- (UIImage *)imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *)imageCroppedToRect:(CGRect)cropRect;
- (UIImage *)imageByScalingToSize:(CGSize)size andCroppingWithRect:(CGRect)rect;

@end
