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

- (UIActivityViewController *)standardServices {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (self.media.caption.length > 0) {
        [itemsToShare addObject:self.media.caption];
    }
    
    if (self.media.image) {
        [itemsToShare addObject:self.media.image];
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
