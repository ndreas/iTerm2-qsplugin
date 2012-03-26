//
//  QSiTerm2TerminalMediator.m
//  QSiTerm2
//
//  Created by Andreas Johansson on 2012-03-20.
//  Copyright (c) 2012 stdin.se. All rights reserved.
//

#import "QSiTerm2TerminalMediator.h"

@implementation QSiTerm2TerminalMediator


- (id) init {
	if (self = [super init]) {
        iTerm = [[SBApplication applicationWithBundleIdentifier:@"com.googlecode.iterm2"] retain];
	}
	return self;
}


- (void) dealloc {
    [iTerm release];
    [super dealloc];
}


- (void) performCommandInTerminal: (NSString *)command {
    // iTerm2 does not run the command if there are trailing spaces in the command
    NSString *trimmedCommand = [command stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];

    iTermTerminal *terminal = [[[[iTerm classForScriptingClass:@"terminal"] alloc] init] autorelease];
    [[iTerm terminals] addObject:terminal];
    iTermSession *session = [terminal launchSession:@"Default"];

    // execCommand does not work, this does, don't know why...
    [session writeContentsOfFile:nil text:trimmedCommand];
}


@end
