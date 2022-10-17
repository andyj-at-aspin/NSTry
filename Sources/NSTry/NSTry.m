//
//  NSTry.m
//  
//
//  Created by Andy Johnson on 17/10/2022.
//

#import <Foundation/Foundation.h>

#import "NSTry.h"

@implementation NSTry

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end
