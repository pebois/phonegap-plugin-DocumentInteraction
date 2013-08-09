//  DocumentInteraction.h
//
//  Created by Pierre-Emmanuel Bois on 08/08/13.
//
//  Copyright 2012-2013 Pierre-Emmanuel Bois. All rights reserved.
//  MIT Licensed

#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@interface DocumentInteraction : CDVPlugin <UIDocumentInteractionControllerDelegate> {
  NSString* callbackId;
  UIDocumentInteractionController* documentInteractionController;
}
@property (nonatomic, copy) NSString* callbackId;
@property (strong, nonatomic) UIDocumentInteractionController* documentInteractionController;

- (void)preview:(CDVInvokedUrlCommand*)command;
- (void)openIn:(CDVInvokedUrlCommand*)command;
- (void)optionsMenu:(CDVInvokedUrlCommand*)command;

@end
