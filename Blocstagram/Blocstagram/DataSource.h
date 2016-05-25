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

@property (nonatomic, strong, readonly) NSString *accessToken;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

+ (NSString *)instagramClientID;
+ (instancetype)sharedInstance;

- (void)deleteMediaItem:(Media *)item;

- (void)requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void)requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;

- (void)downloadImageForMediaItem:(Media *)mediaItem;

- (void)toggleLikeOnMediaItem:(Media *)mediaItem withCompletionHandler:(void (^)(void))completionHandler;
- (void)commentOnMediaItem:(Media *)mediaItem withCommentText:(NSString *)commentText;

@end
