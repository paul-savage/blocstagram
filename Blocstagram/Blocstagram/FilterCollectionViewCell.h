//
//  FilterCollectionViewCell.h
//  
//
//  Created by Paul Savage on 29/10/2015.
//
//

#import <UIKit/UIKit.h>


@interface FilterCollectionViewCell : UICollectionViewCell

- (void)configureWithSize:(CGFloat)thumbnailEdgeSize filterImage:(UIImage *)image filterTitle:(NSString *)title;

@end
