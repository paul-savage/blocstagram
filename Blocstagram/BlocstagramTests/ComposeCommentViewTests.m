//
//  ComposeCommentViewTests.m
//  
//
//  Created by Paul Savage on 10/11/2015.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface ComposeCommentViewTests : XCTestCase

@end

@implementation ComposeCommentViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsWritingYes
{
    ComposeCommentView *testCommentView = [[ComposeCommentView alloc] init];
    
    [testCommentView setText:@"Test string"];
    
    XCTAssertTrue(testCommentView.isWritingComment, @"isWritingComment should be YES");
}

- (void)testIsWritingNo
{
    ComposeCommentView *testCommentView = [[ComposeCommentView alloc] init];
    
    [testCommentView setText:@""];
    
    XCTAssertFalse(testCommentView.isWritingComment, @"isWritingComment should be NO");
}

@end
