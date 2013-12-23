//
//  AKObjectManager.m
//  RestKitBoilerplate
//
//  Created by Alex Kurkin on 12/23/13.
//  Copyright (c) 2013 Brilliant Consulting Inc. All rights reserved.
//

#import "AKObjectManager.h"
#import <RestKit/RestKit.h>

static AKObjectManager *sharedManager = nil;

@implementation AKObjectManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://api.github.com/"];
        
        sharedManager = [self managerWithBaseURL:url];
        sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
        /*
         THIS CLASS IS MAIN POINT FOR CUSTOMIZATION:
         - setup HTTP headers that should exist on all HTTP Requests
         - override methods in this class to change default behavior for all HTTP Requests
         - define methods that should be available across all object managers
         */
    });
    
    return sharedManager;
}

@end