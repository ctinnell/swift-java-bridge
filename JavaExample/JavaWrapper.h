//
//  JavaWrapper.h
//  JavaExample
//
//  Created by Clay Tinnell on 2/28/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface JavaWrapper : NSObject

-(void)initialize;
-(void)connect:(NSString *)name url:(NSString *)url userid:(NSString *)userid password:(NSString *)password;
-(void) executeQuery:(NSString *)queryText;

@end
