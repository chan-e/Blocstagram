//
//  MediaTableViewCellTests.m
//  Blocstagram
//
//  Created by Eddy Chan on 6/1/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MediaTableViewCell.h"
#import "Media.h"

@interface MediaTableViewCellTests : XCTestCase

@end

@implementation MediaTableViewCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatHeightForMediaItemWorks {
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
                                       @"comments"      : @{@"data": @[]},
                                       @"user_has_liked": @"0"};
    
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGRect bounds        = [mainScreen bounds];
    CGFloat width        = CGRectGetWidth(bounds);
    CGFloat height       = CGRectGetHeight(bounds);
    CGFloat cellHeight;
    
    
    Media *item = [[Media alloc] initWithDictionary:sourceDictionary];
    
    // With no image
    cellHeight = [MediaTableViewCell heightForMediaItem:item
                                                  width:width
                                        traitCollection:[mainScreen traitCollection]];
    
    XCTAssertEqual(cellHeight, 138.0, @"The cell height should be equal");
    
    // With an image
    item.image = [UIImage imageNamed:@"10.jpg"];
    
    if ([[mainScreen traitCollection] horizontalSizeClass] == UIUserInterfaceSizeClassCompact)
    {
        cellHeight = [MediaTableViewCell heightForMediaItem:item
                                                      width:width
                                            traitCollection:[mainScreen traitCollection]];
        
        XCTAssertGreaterThanOrEqual(cellHeight, MIN(width, height),
                                    @"The cell height should be greater than or equal");
    }
    else if ([[mainScreen traitCollection] horizontalSizeClass] == UIUserInterfaceSizeClassRegular)
    {
        cellHeight = [MediaTableViewCell heightForMediaItem:item
                                                      width:CGRectGetWidth(bounds)
                                            traitCollection:[mainScreen traitCollection]];
        
        XCTAssertEqual(cellHeight, 458.0, @"The cell height should be equal");
    }
    
}

@end
