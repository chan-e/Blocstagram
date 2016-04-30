//
//  MediaTableViewCell.m
//  Blocstagram
//
//  Created by Eddy Chan on 4/28/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "MediaTableViewCell.h"
#import "Media.h"
#import "Comment.h"
#import "User.h"

@interface MediaTableViewCell ()

@property (nonatomic, strong) UIImageView *mediaImageView;
@property (nonatomic, strong) UILabel *usernameAndCaptionLabel;
@property (nonatomic, strong) UILabel *commentLabel;

@end

static UIFont *lightFont;
static UIFont *boldFont;

static UIColor *usernameLabelGray;
static UIColor *commentLabelGray;
static UIColor *commentColor;
static UIColor *linkColor;

static NSParagraphStyle *paragraphStyle;
static NSParagraphStyle *rightAlignParagraphStyle;

@implementation MediaTableViewCell

- (void)setMediaItem:(Media *)mediaItem {
    _mediaItem = mediaItem;
    
    self.mediaImageView.image = _mediaItem.image;
    
    self.usernameAndCaptionLabel.attributedText = [self usernameAndCaptionString];
    self.commentLabel.attributedText            = [self commentString];
}

+ (void)load {
    lightFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:11];
    boldFont  = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
    
    usernameLabelGray = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];/*#eeeeee*/
    commentLabelGray  = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1];/*#e5e5e5*/
    commentColor      = [UIColor colorWithRed:1.000 green:0.647 blue:0.000 alpha:1];/*ffa500*/
    linkColor         = [UIColor colorWithRed:0.345 green:0.314 blue:0.427 alpha:1];/*58506d*/
    
    NSMutableParagraphStyle *mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    mutableParagraphStyle.headIndent             = 20.0;
    mutableParagraphStyle.firstLineHeadIndent    = 20.0;
    mutableParagraphStyle.tailIndent             = -20.0;
    mutableParagraphStyle.paragraphSpacingBefore = 7;
    mutableParagraphStyle.alignment              = NSTextAlignmentLeft;
    
    paragraphStyle = mutableParagraphStyle;
    
    NSMutableParagraphStyle *mutableRightAlignParagraphStyle = [mutableParagraphStyle mutableCopy];
    mutableRightAlignParagraphStyle.alignment = NSTextAlignmentRight;
    
    rightAlignParagraphStyle = mutableRightAlignParagraphStyle;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
        self.mediaImageView = [[UIImageView alloc] init];
        
        self.usernameAndCaptionLabel = [[UILabel alloc] init];
        self.usernameAndCaptionLabel.numberOfLines   = 0;
        self.usernameAndCaptionLabel.backgroundColor = usernameLabelGray;
        
        self.commentLabel = [[UILabel alloc] init];
        self.commentLabel.numberOfLines   = 0;
        self.commentLabel.backgroundColor = commentLabelGray;
        
        for (UIView *view in @[self.mediaImageView, self.usernameAndCaptionLabel, self.commentLabel]) {
            [self.contentView addSubview:view];
        }
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    if (!self.mediaItem) {
        return;
    }
    
    CGSize imageSize = self.mediaItem.image.size;
    
    CGFloat imageViewHeight = (imageSize.height / imageSize.width) * CGRectGetWidth(self.contentView.bounds);
    
    self.mediaImageView.frame = CGRectMake(0, 0,
                                           CGRectGetWidth(self.contentView.bounds),
                                           imageViewHeight);
    
    CGSize sizeOfUsernameAndCaptionLabel = [self sizeOfString:self.usernameAndCaptionLabel.attributedText];
    CGSize sizeOfCommentLabel            = [self sizeOfString:self.commentLabel.attributedText];
    
    self.usernameAndCaptionLabel.frame = CGRectMake(0, CGRectGetMaxY(self.mediaImageView.frame),
                                                    CGRectGetWidth(self.contentView.bounds),
                                                    sizeOfUsernameAndCaptionLabel.height);
    
    self.commentLabel.frame            = CGRectMake(0, CGRectGetMaxY(self.usernameAndCaptionLabel.frame),
                                                    CGRectGetWidth(self.bounds),
                                                    sizeOfCommentLabel.height);
    
    // Hide the line between cells
    self.separatorInset = UIEdgeInsetsMake(0, CGRectGetWidth(self.bounds)/2.0,
                                           0, CGRectGetWidth(self.bounds)/2.0);
}

+ (CGFloat)heightForMediaItem:(Media *)mediaItem width:(CGFloat)width {
    // Make a cell
    MediaTableViewCell *layoutCell =
    [[MediaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"layoutCell"];
    
    // Set it to the given width, and the maximum possible height
    layoutCell.frame     = CGRectMake(0, 0, width, CGFLOAT_MAX);
    
    // Give it the media item
    layoutCell.mediaItem = mediaItem;
    
    // Make it adjust the image view and labels
    [layoutCell layoutSubviews];
    
    // The height will be wherever the bottom of the comments label is
    return CGRectGetMaxY(layoutCell.commentLabel.frame);
}

- (NSAttributedString *)usernameAndCaptionString {
    CGFloat usernameFontSize  = 15;
    NSNumber *captionKernSize = [NSNumber numberWithFloat:2.0];
    
    NSString *baseString = [NSString stringWithFormat:@"%@ %@", self.mediaItem.user.userName, self.mediaItem.caption];
    
    NSMutableAttributedString *mutableUsernameAndCaptionString =
    [[NSMutableAttributedString alloc] initWithString:baseString
                                           attributes:@{NSFontAttributeName: [lightFont fontWithSize:usernameFontSize],
                                                        NSParagraphStyleAttributeName: paragraphStyle}];
    
    NSRange usernameRange = [baseString rangeOfString:self.mediaItem.user.userName];
    
    [mutableUsernameAndCaptionString addAttribute:NSFontAttributeName
                                            value:[boldFont fontWithSize:usernameFontSize]
                                            range:usernameRange];
    
    [mutableUsernameAndCaptionString addAttribute:NSForegroundColorAttributeName
                                            value:linkColor
                                            range:usernameRange];
    
    NSRange captionRange  = [baseString rangeOfString:self.mediaItem.caption];
    
    // Increase the kerning (character spacing) of the image caption
    [mutableUsernameAndCaptionString addAttribute:NSKernAttributeName
                                            value:captionKernSize
                                            range:captionRange];
    
    return mutableUsernameAndCaptionString;
}

- (NSAttributedString *)commentString {
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] init];
    
    NSUInteger index = 0;
    for (Comment *comment in self.mediaItem.comments) {
        // Make a string that says "username comment" followed by a line break
        NSString *baseString = [NSString stringWithFormat:@"%@ %@\n", comment.from.userName, comment.text];
        
        // Make an attributed string, with the "username" bold
        NSMutableAttributedString *oneCommentString =
        [[NSMutableAttributedString alloc] initWithString:baseString
                                               attributes:@{NSFontAttributeName: lightFont}];
        
        NSRange baseStringRange = NSMakeRange(0, baseString.length);
        
        // Right-align every other comment
        if ((index % 2) == 0) {
            [oneCommentString addAttribute:NSParagraphStyleAttributeName
                                     value:paragraphStyle
                                     range:baseStringRange];
        }
        else {
            [oneCommentString addAttribute:NSParagraphStyleAttributeName
                                     value:rightAlignParagraphStyle
                                     range:baseStringRange];
        }
        
        NSRange usernameRange = [baseString rangeOfString:comment.from.userName];
        
        [oneCommentString addAttribute:NSFontAttributeName
                                 value:boldFont
                                 range:usernameRange];
        
        [oneCommentString addAttribute:NSForegroundColorAttributeName
                                 value:linkColor
                                 range:usernameRange];
        
        [commentString appendAttributedString:oneCommentString];
        
        ++index;
    }
    
    NSString *firstComment    = ((Comment *)self.mediaItem.comments[0]).text;
    NSRange firstCommentRange = [commentString.mutableString rangeOfString:firstComment];
    
    // Change the color of the first comment to orange
    [commentString addAttribute:NSForegroundColorAttributeName value:commentColor range:firstCommentRange];
    
    return commentString;
}

- (CGSize)sizeOfString:(NSAttributedString *)string {
    CGSize maxSize = CGSizeMake(CGRectGetWidth(self.contentView.bounds) - 40, 0.0);
    
    CGRect sizeRect = [string boundingRectWithSize:maxSize
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                           context:nil];
    
    sizeRect.size.height += 20;
    
    sizeRect = CGRectIntegral(sizeRect);
    
    return sizeRect.size;
}

@end
