//
//  MPTableViewSearchBarBackgroundView.m
//  SearchableTableViewController
//
//  Copyright (c) 2012 Matthias Plappert <matthiasplappert@me.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "MPTableViewSearchBarBackgroundView.h"


@implementation MPTableViewSearchBarBackgroundView

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame])) {
		// Configure view
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor  = [UIColor colorWithRed:226.0f / 255.0f
                                                green:231.0f / 255.0f
                                                 blue:237.0f / 255.0f
                                                alpha:1.0f];
	}
	return self;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    // Get current context
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Draw top border
	[[UIColor colorWithRed:160.0f / 255.0f green:173.0f / 255.0f blue:183.0f / 255.0f alpha:1.0f] set];
	CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - 1.0f, rect.size.width, 1.0f));
}

@end
