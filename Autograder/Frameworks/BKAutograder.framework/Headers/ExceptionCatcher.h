//
//  ExceptionCatcher.h
//  AutograderLab
//
//  Created by Chris Zielinski on 7/11/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

#ifndef ExceptionCatcher_h
#define ExceptionCatcher_h

#import <Foundation/Foundation.h>

/*! Catches NSExceptions without imploding
 [From SO. For more information, see](https://stackoverflow.com/questions/34956002/how-to-properly-handle-nsfilehandle-exceptions-in-swift-2-0)
 */
NS_INLINE NSException * _Nullable tryBlock(void(^_Nonnull tryBlock)(void)) {
    @try {
        tryBlock();
    }
    @catch (NSException *exception) {
        return exception;
    }
    return nil;
}

#endif /* ExceptionCatcher_h */
