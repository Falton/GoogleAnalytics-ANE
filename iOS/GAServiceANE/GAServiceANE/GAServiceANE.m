//
//  GAServiceANE.m
//  GAServiceANE
//
//  Created by Dima on 2014-03-21.
//  Copyright (c) 2014 Dima Svetov. All rights reserved.
//

#import "GAServiceANE.h"
#import "FlashRuntimeExtensions.h"
#import "Library/GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@implementation GAServiceANE

FREObject trackView(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    uint32_t string1Length;
    const uint8_t *value1;
    FREGetObjectAsUTF8(argv[0], &string1Length, &value1);
    
    NSString *trackingId;
    @try {
        trackingId = [NSString stringWithUTF8String:(char *) value1];
    }
    @catch (NSException *exception) {}
    
    uint32_t string2Length;
    const uint8_t *value2;
    FREGetObjectAsUTF8(argv[1], &string2Length, &value2);
    
    NSString *screen;
    @try {
        screen = [NSString stringWithUTF8String:(char *) value2];
    }
    @catch (NSException *exception) {}
    
    id tracker = [[GAI sharedInstance] trackerWithTrackingId:trackingId];
    
    [tracker set:kGAIScreenName value:screen];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    [tracker set:kGAIScreenName value:nil];
    // Return data back to ActionScript
    return NULL;
}

FREObject trackEvent(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
{
    
    uint32_t string1Length;
    const uint8_t *value1;
    FREGetObjectAsUTF8(argv[0], &string1Length, &value1);
    
    NSString *trackingId;
    @try {
        trackingId = [NSString stringWithUTF8String:(char *) value1];
    }
    @catch (NSException *exception) {}
    
    uint32_t string2Length;
    const uint8_t *value2;
    FREGetObjectAsUTF8(argv[1], &string2Length, &value2);
    
    NSString *category;
    @try {
        category = [NSString stringWithUTF8String:(char *) value2];
    }
    @catch (NSException *exception) {}
    
    uint32_t string3Length;
    const uint8_t *value3;
    FREGetObjectAsUTF8(argv[2], &string3Length, &value3);
    
    NSString *action;
    @try {
        action = [NSString stringWithUTF8String:(char *) value3];
    }
    @catch (NSException *exception) {}
    
    uint32_t string4Length;
    const uint8_t *value4;
    FREGetObjectAsUTF8(argv[3], &string4Length, &value4);
    
    NSString *lable;
    @try {
        lable = [NSString stringWithUTF8String:(char *) value4];
    }
    @catch (NSException *exception) {}

    
    double value5;
    FREGetObjectAsDouble(argv[4], &value5);
    NSNumber *value = [NSNumber numberWithDouble:value5];
   
    
    id tracker = [[GAI sharedInstance] trackerWithTrackingId:trackingId];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                          action:action
                                                           label:lable
                                                           value:value] build]];
    
   

    // Return data back to ActionScript
    return NULL;
}


// ContextInitializer()
// The context initializer is called when the runtime creates the extension context instance.
void GAServiceANEContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 2;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    
	func[0].name = (const uint8_t*)"trackView";
	func[0].functionData = NULL;
	func[0].function = &trackView;
    
    func[1].name = (const uint8_t*)"trackEvent";
	func[1].functionData = NULL;
	func[1].function = &trackEvent;
    
	*functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

// ContextFinalizer()
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void GAServiceANEContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering ContextFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ContextFinalizer()");
    
	return;
}

// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void GAServiceANEInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                             FREContextFinalizer* ctxFinalizerToSet) {
    
    NSLog(@"Entering ExtInitializer()");
    
	*extDataToSet = NULL;
	*ctxInitializerToSet = &GAServiceANEContextInitializer;
	*ctxFinalizerToSet = &GAServiceANEContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void GAServiceANEFinalizer(void* extData) {
    
    NSLog(@"Entering ExtFinalizer()");
    
	// Nothing to clean up.
    
    NSLog(@"Exiting ExtFinalizer()");
    
	return;
}

@end
