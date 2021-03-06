//
// Copyright 2012 Jeff Verkoeyen
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "NICellCatalog.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NITitleCellObject

@synthesize title = _title;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  [_title release];

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCellClass:(Class)cellClass userInfo:(id)userInfo {
  return [super initWithCellClass:cellClass userInfo:userInfo];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTitle:(NSString *)title {
  if ((self = [self initWithCellClass:[NITextCell class] userInfo:nil])) {
    _title = [title copy];
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)cellWithTitle:(NSString *)title {
  return [[[self alloc] initWithTitle:title] autorelease];
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NISubtitleCellObject

@synthesize subtitle = _subtitle;
@synthesize cellStyle = _cellStyle;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  [_subtitle release];

  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
  if ((self = [super initWithTitle:title])) {
    _subtitle = [subtitle copy];
    _cellStyle = UITableViewCellStyleSubtitle;
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)cellWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
  return [[[self alloc] initWithTitle:title subtitle:subtitle] autorelease];
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NITextCell


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:[reuseIdentifier stringByAppendingFormat:@"%d", style]])) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForReuse {
  [super prepareForReuse];

  self.textLabel.text = nil;
  self.detailTextLabel.text = nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldUpdateCellWithObject:(id)object {
  if ([object isKindOfClass:[NITitleCellObject class]]) {
    NITitleCellObject* titleObject = object;
    self.textLabel.text = titleObject.title;
  }
  if ([object isKindOfClass:[NISubtitleCellObject class]]) {
    NISubtitleCellObject* subtitleObject = object;
    self.detailTextLabel.text = subtitleObject.subtitle;
  }
  return YES;
}

@end
