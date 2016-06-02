//
//  ComposeCommentViewTests.m
//  Blocstagram
//
//  Created by Eddy Chan on 6/1/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

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

- (void)testThatSetTextWorks {
    ComposeCommentView* composeCommentView = [[ComposeCommentView alloc] init];
    
    XCTAssertFalse(composeCommentView.isWritingComment, @"isWritingComment should be false");
    
    composeCommentView.text = @"a sample comment";
    XCTAssertTrue(composeCommentView.isWritingComment, @"isWritingComment should be true");
}

@end
