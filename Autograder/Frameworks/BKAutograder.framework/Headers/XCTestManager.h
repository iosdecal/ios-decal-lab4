//
//  XCTestManager.h
//  BKAutograder
//
//  Created by Chris Zielinski on 1/18/18.
//  Copyright © 2018 iOS Development DeCal @ UC Berkeley. All rights reserved.
//

#import "XCTestManagerIDEServerDelegate.h"
#import "CDStructures.h"

@class XCIDESession, XCTestManagerIDEServer;

@interface UIKeyboard : UIView

+ (void)_clearActiveKeyboard;
+ (UIKeyboard *)activeKeyboard;
+ (UIKeyboard *)activeKeyboardForScreen:(id)arg1;
+ (void)clearActiveForScreen:(id)arg1;
+ (void)initImplementationNow;
+ (bool)isInHardwareKeyboardMode;
+ (bool)isOnScreen;
+ (void)makeKeyboardActive:(id)arg1 forScreen:(id)arg2;
+ (void)removeAllDynamicDictionaries;
+ (bool)respondsToProxGesture;
+ (bool)shouldMinimizeForHardwareKeyboard;
+ (bool)splitKeyboardEnabled;

- (void)_acceptCurrentCandidate;
- (id)_baseKeyForRepresentedString:(id)arg1;
- (void)_changeToKeyplane:(id)arg1;
- (void)_deactivateForBackgrounding;
- (void)_didChangeKeyplaneWithContext:(id)arg1;
- (bool)_disableTouchInput;
- (long long)_focusedSound;
- (id)_getAutocorrection;
- (id)_getCurrentKeyboardName;
- (id)_getCurrentKeyplaneName;
- (id)_getLocalizedInputMode;
- (bool)_hasCandidates;
- (bool)_isAutomaticKeyboard;
- (id)_keyplaneForKey:(id)arg1;
- (id)_keyplaneNamed:(id)arg1;
- (bool)_mayRemainFocused;
- (long long)_positionInCandidateList:(id)arg1;
- (void)_setAutocorrects:(bool)arg1;
- (void)_setDisableTouchInput:(bool)arg1;
- (void)_setInputMode:(id)arg1;
- (void)_setPasscodeOutlineAlpha:(double)arg1;
- (void)_setPreferredHeight:(double)arg1;
- (void)_setRenderConfig:(id)arg1;
- (void)_setSplit:(bool)arg1;
- (void)_setUndocked:(bool)arg1;
- (void)_setUseRecentsAlert:(bool)arg1;
- (id)_touchPoint:(CGPoint)arg1;
- (bool)_touchesInsideShouldHideCalloutBar;
- (id)_typeCharacter:(id)arg1 withError:(id)arg2 shouldTypeVariants:(BOOL)arg3 baseKeyForVariants:(BOOL)arg4;
- (bool)_useRecentsAlert;
- (void)_wheelChangedWithEvent:(id)arg1;
- (void)acceptAutocorrection;
- (void)activate;
- (bool)allowExternalChangeForFocusHeading:(unsigned long long)arg1 cursorLocation:(unsigned long long)arg2;
- (void)autoAdjustOrientation;
- (bool)canBecomeFocused;
- (bool)canDismiss;
- (bool)canHandleEvent:(id)arg1;
- (bool)caretBlinks;
- (bool)caretVisible;
- (void)clearActivePerScreenIfNeeded;
- (void)clearSnapshot;
- (unsigned long long)cursorLocation;
- (void)deactivate;
- (void)dealloc;
- (id)defaultTextInputTraits;
- (id)delegate;
- (void)didFocusGuideWithHeading:(unsigned long long)arg1;
- (void)didMoveToWindow;
- (bool)disableInteraction;
- (void)displayLayer:(id)arg1;
- (void)focusedViewDidChange;
- (void)geometryChangeDone:(bool)arg1;
- (bool)hasAutocorrectPrompt;
- (bool)hasImpendingCursorLocation;
- (id)hitTest:(CGPoint)arg1 withEvent:(id)arg2;
- (unsigned long long)impendingCursorLocation;
- (void)implBoundsHeightChangeDone:(double)arg1 suppressNotification:(bool)arg2;
- (id)initLazily;
- (id)initWithDefaultSize;
- (long long)interfaceOrientation;
- (bool)isActive;
- (bool)isActivePerScreen;
- (bool)isAutomatic;
- (bool)isMinimized;
- (long long)keyboardIdiom;
- (void)keyboardMinMaximized:(id)arg1 finished:(id)arg2 context:(id)arg3;
- (void)manualKeyboardWasOrderedIn;
- (void)manualKeyboardWasOrderedOut;
- (void)manualKeyboardWillBeOrderedIn;
- (void)manualKeyboardWillBeOrderedOut;
- (void)maximize;
- (void)minimize;
- (bool)pointInside:(CGPoint)arg1 withEvent:(id)arg2;
- (void)prepareForGeometryChange;
- (void)prepareForImplBoundsHeightChange:(double)arg1 suppressNotification:(bool)arg2;
- (void)pressesBegan:(id)arg1 withEvent:(id)arg2;
- (void)pressesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)pressesChanged:(id)arg1 withEvent:(id)arg2;
- (void)pressesEnded:(id)arg1 withEvent:(id)arg2;
- (void)remoteControlReceivedWithEvent:(id)arg1;
- (void)removeAutocorrectPrompt;
- (void)responseContextDidChange;
- (bool)returnKeyEnabled;
- (void)setCaretBlinks:(bool)arg1;
- (void)setCaretVisible:(bool)arg1;
- (void)setCorrectionLearningAllowed:(bool)arg1;
- (void)setCursorLocation:(unsigned long long)arg1;
- (void)setDefaultTextInputTraits:(id)arg1;
- (void)setDisableInteraction:(bool)arg1;
- (void)setHasImpendingCursorLocation:(bool)arg1;
- (void)setImpendingCursorLocation:(unsigned long long)arg1;
- (void)setKeyboardIdiom:(long long)arg1;
- (void)setMinimized:(bool)arg1;
- (void)setNeedsDisplay;
- (void)setOrientation:(long long)arg1;
- (void)setReturnKeyEnabled:(bool)arg1;
- (void)setShowPredictionBar:(bool)arg1;
- (void)setShowsCandidatesInline:(bool)arg1;
- (void)setTypingEnabled:(bool)arg1;
- (void)setupKeyFocusGuides;
- (bool)shouldChangeFocusedItem:(id)arg1 heading:(unsigned long long)arg2;
- (bool)shouldSaveMinimizationState;
- (bool)showPredictionBar;
- (bool)showsCandidatesInline;
- (void)syncMinimizedStateToHardwareKeyboardAttachedState;
- (void)takeSnapshot;
- (id)targetWindow;
- (int)textEffectsVisibilityLevel;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (bool)typingEnabled;
- (void)updateFocusMarginsUpToView:(id)arg1;
- (void)updateKeyFocusGuides;
- (void)updateLayout;
- (void)willMoveToWindow:(id)arg1;

@end

@interface UIKeyboardImpl : NSObject
+ (UIKeyboardImpl *)sharedInstance;
- (void)addInputString:(NSString *)string;
- (void)deleteFromInput;
@property(getter=isInHardwareKeyboardMode, nonatomic) bool inHardwareKeyboardMode;
@property(retain) UIResponder<UIKeyInput> * delegate;
@end




@interface XCTestManager : NSObject <XCTestManagerIDEServerDelegate, NSXPCListenerDelegate>
{
    NSString *_clientIdentifier;
    NSString *_clientPath;
    XCIDESession *_controlSession;
    XCTestManagerIDEServer *_server;
    NSXPCListener *_testBundleConnectionListener;
    NSMutableDictionary *_sessionsByIdentifier;
    NSMutableArray *_unidentifiedSessions;
    NSMutableArray *_testSessions;
    NSMutableDictionary *_pendingTestConnectionRequests;
}

+ (id)sharedTestManager;
@property(retain) NSMutableDictionary *pendingTestConnectionRequests; // @synthesize pendingTestConnectionRequests=_pendingTestConnectionRequests;
@property(retain) NSMutableArray *testSessions; // @synthesize testSessions=_testSessions;
@property(retain) NSMutableArray *unidentifiedSessions; // @synthesize unidentifiedSessions=_unidentifiedSessions;
@property(retain) NSMutableDictionary *sessionsByIdentifier; // @synthesize sessionsByIdentifier=_sessionsByIdentifier;
@property(retain) NSXPCListener *testBundleConnectionListener; // @synthesize testBundleConnectionListener=_testBundleConnectionListener;
@property(retain) XCTestManagerIDEServer *server; // @synthesize server=_server;
@property(retain, nonatomic) XCIDESession *controlSession; // @synthesize controlSession=_controlSession;
@property(retain) NSString *clientPath; // @synthesize clientPath=_clientPath;
@property(retain) NSString *clientIdentifier; // @synthesize clientIdentifier=_clientIdentifier;
- (void)_considerExiting:(id)arg1;
- (void)closeTestSession:(id)arg1;
- (void)closeIDESession:(id)arg1;
- (_Bool)allowUITestControlForPID:(int)arg1;
- (void)_handleRequestForSessionWithIdentifier:(id)arg1;
- (void)requestSocketForSessionIdentifier:(id)arg1 reply:(CDUnknownBlockType)arg2;
- (_Bool)listener:(id)arg1 shouldAcceptNewConnection:(id)arg2;
- (void)setIDESession:(id)arg1 forIdentifier:(id)arg2;
- (void)serverReceivedIDESession:(id)arg1;
- (void)run;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) Class superclass;

@end
