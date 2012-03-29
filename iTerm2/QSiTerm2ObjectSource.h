//
//  QSiTerm2ObjectSource.h
//  iTerm2
//
//  Created by Andreas Johansson on 2012-03-27.
//  Copyright (c) 2012 stdin.se. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSiTerm2Definitions.h"

@interface QSiTerm2ObjectSource : QSObjectSource

// QS method that loads the children when right arrowing into an object
- (BOOL) loadChildrenForObject:(QSObject *)object;

@end
