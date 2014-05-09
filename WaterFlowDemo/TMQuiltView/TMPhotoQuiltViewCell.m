//
//  TMPhotoQuiltViewCell.m
//  WaterFlowDemo
//
//  Created by shenjx on 13-6-6.
//
//


#import "TMPhotoQuiltViewCell.h"

const CGFloat kTMPhotoQuiltViewMargin = 5;

@implementation TMPhotoQuiltViewCell

@synthesize photoView = _photoView;
@synthesize titleLabel = _titleLabel;

- (void)dealloc {
    [_photoView release], _photoView = nil;
    [_titleLabel release], _titleLabel = nil;
    
    [super dealloc];
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        _photoView.clipsToBounds = YES;
        [self addSubview:_photoView];
    }
    return _photoView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (void)layoutSubviews {
    self.photoView.frame = CGRectInset(self.bounds, kTMPhotoQuiltViewMargin, kTMPhotoQuiltViewMargin);
    self.titleLabel.frame = CGRectMake(kTMPhotoQuiltViewMargin, self.bounds.size.height - 20 - kTMPhotoQuiltViewMargin,
                                       self.bounds.size.width - 2 * kTMPhotoQuiltViewMargin, 20);
}

@end
