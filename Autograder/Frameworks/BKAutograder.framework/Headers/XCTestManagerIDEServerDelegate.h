//
//  XCTestManagerIDEServerDelegate.h
//  BKAutograder
//
//  Created by Chris Zielinski on 1/18/18.
//  Copyright © 2018 iOS Development DeCal @ UC Berkeley. All rights reserved.
//

@class XCIDESession;

@protocol XCTestManagerIDEServerDelegate <NSObject>
- (void)serverReceivedIDESession:(XCIDESession *)arg1;
@end
