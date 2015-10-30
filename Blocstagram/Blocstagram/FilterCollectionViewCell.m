//
//  FilterCollectionViewCell.m
//  
//
//  Created by Paul Savage on 29/10/2015.
//
//

#import "FilterCollectionViewCell.h"


@implementation FilterCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    return self;
}

- (void)configureWithSize:(CGFloat)thumbnailEdgeSize filterImage:(UIImage *)image filterTitle:(NSString *)title
{
    static NSInteger imageViewTag = 1000;
    static NSInteger labelTag = 1001;
    
    UIImageView *thumbnail = (UIImageView *)[self.contentView viewWithTag:imageViewTag];
    UILabel *label = (UILabel *)[self.contentView viewWithTag:labelTag];
    
    if (!thumbnail)
    {
        thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
        thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        thumbnail.tag = imageViewTag;
        thumbnail.clipsToBounds = YES;
        
        [self.contentView addSubview:thumbnail];
    }
    
    if (!label)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
        label.tag = labelTag;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        
        [self.contentView addSubview:label];
    }
    
    thumbnail.image = image;
    label.text = title;
}


@end
