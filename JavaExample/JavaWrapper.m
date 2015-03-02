//
//  JavaWrapper.m
//  JavaExample
//
//  Created by Clay Tinnell on 2/28/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//
#import "JavaWrapper.h"
#import "JavaCWrapper.h"

@implementation JavaWrapper

- (void)initializeVM {
    initialize_vm();
}

@end
