//
//  CameraToolbar.h
//  Blocstagram
//
//  Created by Eddy Chan on 5/22/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraToolbar;

@protocol CameraToolbarDelegate <NSObject>

- (void)leftButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void)cameraButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void)rightButtonPressedOnToolbar:(CameraToolbar *)toolbar;

@end

@interface CameraToolbar : UIView

- (instancetype)initWithImageNames:(NSArray *)imageNames;

@property (nonatomic, weak) NSObject <CameraToolbarDelegate> *delegate;

@end
