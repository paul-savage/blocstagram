//
//  Comment.h
//  Blocstagram
//
//  Created by Paul Savage on 08/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

@end
