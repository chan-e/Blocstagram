//
//  DataSource.h
//  Blocstagram
//
//  Created by Eddy Chan on 4/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+ (instancetype)sharedInstance;
- (void)deleteMediaItem:(Media *)item;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
