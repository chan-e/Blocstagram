//
//  SharedMedia.m
//  Blocstagram
//
//  Created by Eddy Chan on 5/12/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "SharedMedia.h"
#import "Media.h"

@implementation SharedMedia

+ (UIActivityViewController *)standardServicesWithMedia:(Media *)media {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (media.caption.length > 0) {
        [itemsToShare addObject:media.caption];
    }
    
    if (media.image) {
        [itemsToShare addObject:media.image];
    }
    
    if (itemsToShare.count > 0) {
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare
                                                                                 applicationActivities:nil];
        
        return activityVC;
    }
    else {
        return nil;
    }
}

@end
