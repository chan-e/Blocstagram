//
//  DataSource.h
//  Blocstagram
//
//  Created by Eddy Chan on 4/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void(^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

+ (NSString *)instagramClientID;

+ (instancetype)sharedInstance;
- (void)retryMediaItem:(Media *)item;
- (void)deleteMediaItem:(Media *)item;
- (void)requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void)requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;

@property (nonatomic, strong, readonly) NSString *accessToken;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
