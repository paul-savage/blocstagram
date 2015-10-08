//
//  DataSource.h
//  Blocstagram
//
//  Created by Paul Savage on 08/10/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

+  (instancetype)sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
