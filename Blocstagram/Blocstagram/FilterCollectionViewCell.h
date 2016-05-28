//
//  FilterCollectionViewCell.h
//  Blocstagram
//
//  Created by Eddy Chan on 5/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterImage.h"

@interface FilterCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FilterImage *filterImageItem;
@property (nonatomic, assign) CGFloat thumbnailEdgeSize;

@end
