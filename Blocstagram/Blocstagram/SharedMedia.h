//
//  SharedMedia.h
//  Blocstagram
//
//  Created by Eddy Chan on 5/12/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface SharedMedia : NSObject

@property (nonatomic, strong) Media* media;

- (UIActivityViewController *)standardServices;

@end
