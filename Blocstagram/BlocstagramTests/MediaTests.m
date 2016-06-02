//
//  MediaTests.m
//  Blocstagram
//
//  Created by Eddy Chan on 6/1/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Media.h"

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

- (void)testThatInitializationWorks {
    NSDictionary *userDictionary      = @{@"id"              : @"8675309",
                                          @"username"        : @"d'oh",
                                          @"full_name"       : @"Homer Simpson",
                                          @"profile_picture" : @"http://www.example.com/example.jpg"};
    
    NSDictionary *otherUserDictionary = @{@"id"              : @"9035768",
                                          @"username"        : @"MSimpson",
                                          @"full_name"       : @"Marge Simpson",
                                          @"profile_picture" : @"http://www.example.com/example.jpg"};
    
    NSArray *commentsArray = @[@{@"id"  : @"123",
                                 @"from": otherUserDictionary,
                                 @"text": @"comment 1"}];
    
    NSDictionary *sourceDictionary = @{@"id"            : @"1234567",
                                       @"user"          : userDictionary,
                                       @"images"        : @{@"standard_resolution": @{@"url": @"image_url"}},
                                       @"caption"       : @{@"text": @"Homer is eating doughnuts"},
                                       @"comments"      : @{@"data": commentsArray},
                                       @"user_has_liked": @"0"};
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The media ID number should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:sourceDictionary[@"images"][@"standard_resolution"]
                                               [@"url"]], @"The media URL should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
    
    XCTAssertNotNil(testMedia.user, @"The user should not be nil");
    XCTAssertNotNil(testMedia.comments, @"The comments should not be nil");
    
    XCTAssertNil(testMedia.temporaryComment, @"The temporary comment should be nil");
    
    XCTAssertEqual(testMedia.downloadState, MediaDownloadStateNeedsImage, @"The download state should be equal");
    XCTAssertEqual(testMedia.likeState, LikeStateNotLiked, @"The like state should be equal");
}

@end
