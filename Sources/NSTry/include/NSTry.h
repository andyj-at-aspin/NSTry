//
//  NSTry.h
//  
//
//  Created by Andy Johnson on 17/10/2022.
//

#ifndef NSTry_h
#define NSTry_h

#import <Foundation/Foundation.h>

@interface NSTry : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end

#endif /* NSTry_h */
