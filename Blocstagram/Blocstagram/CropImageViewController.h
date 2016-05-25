//
//  CropImageViewController.h
//  Blocstagram
//
//  Created by Eddy Chan on 5/24/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "MediaFullScreenViewController.h"

@class CropImageViewController;

@protocol CropImageViewControllerDelegate <NSObject>

- (void)cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end

@interface CropImageViewController : MediaFullScreenViewController

@property (nonatomic, weak) NSObject <CropImageViewControllerDelegate> *delegate;

- (instancetype)initWithImage:(UIImage *)sourceImage;

@end
