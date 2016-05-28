//
//  FilterCollectionViewCell.m
//  Blocstagram
//
//  Created by Eddy Chan on 5/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "FilterCollectionViewCell.h"

@interface FilterCollectionViewCell ()

@property (nonatomic, strong) UIImageView *thumbnail;
@property (nonatomic, strong) UILabel *label;

@end

@implementation FilterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.thumbnail = [[UIImageView alloc] init];
        self.thumbnail.contentMode   = UIViewContentModeScaleAspectFill;
        self.thumbnail.clipsToBounds = YES;
        
        self.label = [[UILabel alloc] init];
        self.label.font          = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        self.label.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.thumbnail];
        [self.contentView addSubview:self.label];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.filterImageItem) {
        return;
    }
    
    self.thumbnail.frame = CGRectMake(0, 0, self.thumbnailEdgeSize, self.thumbnailEdgeSize);
    self.label.frame     = CGRectMake(0, self.thumbnailEdgeSize, self.thumbnailEdgeSize, 20);
}

- (void)setFilterImageItem:(FilterImage *)filterImageItem {
    _filterImageItem     = filterImageItem;
    self.thumbnail.image = _filterImageItem.image;
    self.label.text      = _filterImageItem.text;
}

@end
