//
//  Media.h
//  Blocstagram
//
//  Created by Paul Savage on 08/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface Media : NSObject

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments;

@end
