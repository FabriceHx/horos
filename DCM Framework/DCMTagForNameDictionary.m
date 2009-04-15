/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - GPL
  
  See http://www.osirix-viewer.com/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
=========================================================================*/

#import "DCMTagForNameDictionary.h"
#import "DCM.h"

static DCMTagForNameDictionary *sharedTagForNameDictionary; 

@implementation DCMTagForNameDictionary

+(id)sharedTagForNameDictionary{
	if (!sharedTagForNameDictionary) {
	 NSBundle *bundle;
	if (DCMFramework_compile)
		bundle  = [NSBundle bundleForClass:NSClassFromString(@"DCMTagForNameDictionary")];
	else
		bundle = [NSBundle mainBundle];
	NSString *path = [bundle pathForResource:@"nameDictionary" ofType:@"plist"];
	if( path == nil) NSLog(@"Cannot find nameDictionary");
		sharedTagForNameDictionary = [[NSDictionary dictionaryWithContentsOfFile:path] retain];
		
	if (DCMDEBUG)
		NSLog(@"shared name dictionary; %@", [sharedTagForNameDictionary description]);
	}
	return sharedTagForNameDictionary;
}

- (void) dealloc {
	[sharedTagForNameDictionary release];
	[super dealloc];
}


@end
