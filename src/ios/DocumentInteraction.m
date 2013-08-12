//  DocumentInteraction.m
//
//  Created by Pierre-Emmanuel Bois on 08/08/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

#import "DocumentInteraction.h"
#import <Cordova/CDV.h>

@implementation DocumentInteraction
@synthesize callbackId;
@synthesize documentInteractionController;

- (void)preview:(CDVInvokedUrlCommand*)command
{
    callbackId = command.callbackId;
    NSString* url = [command.arguments objectAtIndex:0];
    NSString* ext = [command.arguments objectAtIndex:1];
    if (url != nil && [url length] > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURL *fileURL = [[NSBundle mainBundle] URLForResource:url withExtension:ext];
            if (fileURL) {
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
                [self.documentInteractionController setDelegate:self];
                [self.documentInteractionController presentPreviewAnimated:YES];
            }
        });
    } else {
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)openIn:(CDVInvokedUrlCommand*)command
{
    callbackId = command.callbackId;
    NSString* url = [command.arguments objectAtIndex:0];
    NSString* ext = [command.arguments objectAtIndex:1];
    if (url != nil && [url length] > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURL *fileURL = [[NSBundle mainBundle] URLForResource:url withExtension:ext];
            if (fileURL) {
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
                [self.documentInteractionController setDelegate:self];
                [self.documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:self.viewController.view animated:YES];
            }
        });
    } else {
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)optionsMenu:(CDVInvokedUrlCommand*)command
{
    callbackId = command.callbackId;
    NSString* url = [command.arguments objectAtIndex:0];
    NSString* ext = [command.arguments objectAtIndex:1];
    if (url != nil && [url length] > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURL *fileURL = [[NSBundle mainBundle] URLForResource:url withExtension:ext];
            if (fileURL) {
                self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
                [self.documentInteractionController setDelegate:self];
                [self.documentInteractionController presentOptionsMenuFromRect:CGRectZero inView:self.viewController.view animated:YES];
            }
        });
    } else {
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self.viewController;
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:application];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
