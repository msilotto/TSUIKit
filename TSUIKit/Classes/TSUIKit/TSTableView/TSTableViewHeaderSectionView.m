//
//  TSTableViewHeaderSectionView.m
//  TSUIKit
//
//  Created by Viacheslav Radchenko on 8/10/13.
//
//  The MIT License (MIT)
//  Copyright © 2013 Viacheslav Radchenko
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "TSTableViewHeaderSectionView.h"
#import "TSUtils.h"
#import <QuartzCore/QuartzCore.h>

@interface TSTableViewHeaderSectionView ()


@end

@implementation TSTableViewHeaderSectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code

    }
    return self;
}

- (UILabel *)textLabel
{
    if(!_textLabel)
    {
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        _textLabel.textColor = [UIColor darkGrayColor];
        _textLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
        _textLabel.numberOfLines = 0;
        _textLabel.layer.shadowOpacity = 1;
        _textLabel.layer.shadowRadius = 1;
        _textLabel.layer.shadowOffset = CGSizeMake(1, 1);
        [self addSubview:_textLabel];
        
        [self setNeedsLayout];
    }
    return _textLabel;
}

- (UILabel *)detailsLabel
{
    if(!_detailsLabel)
    {
        _detailsLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _detailsLabel.backgroundColor = [UIColor clearColor];
        _detailsLabel.textAlignment = NSTextAlignmentCenter;
        _detailsLabel.numberOfLines = 0;
        _detailsLabel.font = [UIFont systemFontOfSize:10.0f];
        _detailsLabel.textColor = [UIColor grayColor];
        [self addSubview:_detailsLabel];
        
        [self setNeedsLayout];
    }
    return _detailsLabel;
}


- (UIImageView *)iconView
{
    if(!_iconView)
    {
        _iconView = [[UIImageView alloc] initWithFrame:self.bounds];
        _iconView.backgroundColor = [UIColor clearColor];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconView];
        
        [self setNeedsLayout];
    }
    return _iconView;
}


- (UIImageView *)backgroundImageView
{
    if(!_backgroundImageView)
    {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _backgroundImageView.backgroundColor = [UIColor clearColor];
        [self insertSubview:_backgroundImageView atIndex:0];
    }
    return _backgroundImageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 0;
    CGFloat y = 0;
    if(_iconView)
    {
        _iconView.frame = CGRectMake(0, 0, _iconView.image.size.width, self.bounds.size.height);
        x += _iconView.image.size.width;
    }
    
    if(_textLabel && _detailsLabel)
    {
        [_textLabel sizeToFit];
        [_detailsLabel sizeToFit];
        
        CGFloat offset = 2;
        CGFloat height = _textLabel.frame.size.height + offset + _detailsLabel.frame.size.height;
        y = (self.bounds.size.height - height)/2;
        y = MAX(0 , y);
        _textLabel.frame = CGRectMake(x, y, self.bounds.size.width - x, _textLabel.frame.size.height);
        y += _textLabel.frame.size.height + offset;
        _detailsLabel.frame = CGRectMake(x, y, self.bounds.size.width - x, _detailsLabel.frame.size.height);
    }
    else if(_detailsLabel)
    {
        _detailsLabel.frame = CGRectMake(x, 0, self.bounds.size.width - x, self.bounds.size.height);
    }
    else if(_textLabel)
    {
        _textLabel.frame = CGRectMake(x, 0, self.bounds.size.width - x, self.bounds.size.height);
    }
}

@end