//
//  MediaTests.m
//  
//
//  Created by Paul Savage on 08/11/2015.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Media.h"
#import "LikeButton.h"


@interface MediaTests : XCTestCase

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"user" : @{@"id": @"8675309",
                                                   @"username" : @"d'oh",
                                                   @"full_name" : @"Homer Simpson",
                                                   @"profile_picture" : @"http://www.example.com/example.jpg"
                                                   },
                                       @"comments": @{@"count": @0,
                                                      @"data": @[]
                                                      },
                                       @"caption": @{@"from": @{@"username": @"p.a.savage",
                                                                @"id": @"123456789",
                                                                @"profile_picture": @"http://www.example.com/example.jpg",
                                                                @"full_name": @"Paul Savage"
                                                                },
                                                     @"id": @"1104673829",
                                                     @"created_time": @"1446110661",
                                                     @"text": @"Beautiful sunset"
                                                     },
                                       @"images": @{@"standard_resolution": @{@"url": @"http://www.example.com/example.jpg",
                                                                              @"width": @640,
                                                                              @"height": @640
                                                                              }
                                                    },
                                       @"user_has_liked": @0,
                                       
                                       };
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];

    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertNotNil(testMedia.user, @"The user should not be nil");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"][@"url"]], @"The media URL should be equal");
    XCTAssertEqual(testMedia.downloadState, MediaDownloadStateNeedsImage, @"The downloadState should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqual(testMedia.comments.count, [NSArray arrayWithArray: sourceDictionary[@"comments"][@"data"]].count, @"The number of comments should be equal");
    XCTAssertEqual(testMedia.likeState, LikeStateNotLiked, @"The likedState should be equal");
    
    sourceDictionary = @{@"id": @"8675309",
                         @"user" : @{@"id": @"8675309",
                                     @"username" : @"d'oh",
                                     @"full_name" : @"Homer Simpson",
                                     @"profile_picture" : @"http://www.example.com/example.jpg"
                                     },
                         @"comments": @{@"count": @1,
                                        @"data": @[@{@"from":@{@"username": @"p.a.savage",
                                                               @"id": @"123456789",
                                                               @"profile_picture": @"http://www.example.com/example.jpg",
                                                               @"full_name": @"Paul Savage"
                                                               },
                                                     @"id": @"1104673829",
                                                     @"created_time": @"1446110661",
                                                     @"text": @"Absolutely fabulous!"
                                                    }
                                                   ]
                                        },
                         @"caption": @{@"from": @{@"username": @"p.a.savage",
                                                  @"id": @"123456789",
                                                  @"profile_picture": @"http://www.example.com/example.jpg",
                                                  @"full_name": @"Paul Savage"
                                                  },
                                       @"id": @"1104673829",
                                       @"created_time": @"1446110661",
                                       @"text": @"Beautiful sunset"
                                       },
                         @"images": @{@"standard_resolution": @{@"url": @"http://www.example.com/example.jpg",
                                                                @"width": @640,
                                                                @"height": @640
                                                                }
                                      },
                         @"user_has_liked": @1,
                         
                         };
    
    testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertNotNil(testMedia.user, @"The user should not be nil");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"][@"url"]], @"The media URL should be equal");
    XCTAssertEqual(testMedia.downloadState, MediaDownloadStateNeedsImage, @"The downloadState should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqual(testMedia.comments.count, [NSArray arrayWithArray: sourceDictionary[@"comments"][@"data"]].count, @"The number of comments should be equal");
    XCTAssertEqual(testMedia.likeState, LikeStateLiked, @"The likedState should be equal");
}

@end
