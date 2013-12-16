#include "ofxAlertView.h"


// OF
ofxAlertView::ofxAlertView(){
    
    // setup objc style delegate
    alertViewDelegate = [[AlertViewDelegate alloc] init:this ];
}

ofxAlertView::~ofxAlertView(){
    
    [alertViewDelegate release];
    alertViewDelegate = NULL;
}

void ofxAlertView::alertClosed(int buttonIndex, string text) {
    
    ofAlertViewEventArgs event;
    event.buttonIndex = buttonIndex;
    event.text = text;
    ofNotifyEvent(alertClosedEvent, event);
}

void ofxAlertView::add(string title, string message, string buttonLabel, bool hasTextInput, bool isTextNumeric) {
    
    
    UIAlertView * _alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithUTF8String:title.c_str()]
                                                      message:[NSString stringWithUTF8String:message.c_str()]
                                                     delegate:alertViewDelegate
                                            cancelButtonTitle:[NSString stringWithUTF8String:buttonLabel.c_str()]
                                            otherButtonTitles:nil];
    if(hasTextInput) {
        _alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        if(isTextNumeric) {
            UITextField * alertTextField = [_alert textFieldAtIndex:0];
            alertTextField.keyboardType = UIKeyboardTypeNumberPad;
        }        
    }
    [_alert show];
    [_alert release];
}

void ofxAlertView::add(string title, string message, string buttonLabel, string otherButtonLabel, bool hasTextInput, bool isTextNumeric) {
    
    UIAlertView * _alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithUTF8String:title.c_str()]
                                                      message:[NSString stringWithUTF8String:message.c_str()]
                                                     delegate:alertViewDelegate
                                            cancelButtonTitle:[NSString stringWithUTF8String:buttonLabel.c_str()]
                                            otherButtonTitles:[NSString stringWithUTF8String:otherButtonLabel.c_str()], nil];
    if(hasTextInput) {
        _alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        if(isTextNumeric) {
            UITextField * alertTextField = [_alert textFieldAtIndex:0];
            alertTextField.keyboardType = UIKeyboardTypeNumberPad;
        }
    }
    [_alert show];
    [_alert release];
}


void ofxAlertView::remove() {

    ofLogVerbose() << "no need to remove ofxAlertView, it's automatically released after use.";
}


// OBJC
@implementation AlertViewDelegate


- (id) init :(ofxAlertView *)avCpp {
    if(self = [super init])        {
        NSLog(@"ofxAlertViewDelegate initiated");
        
        // ref to OF instance
        alertViewCpp = avCpp;
    }
    return self;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    //NSLog(@"something... %ld", (long)buttonIndex);
    string text = "";
    if(alertView.alertViewStyle == UIAlertViewStylePlainTextInput) {
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        text = string([alertTextField.text UTF8String]);
    }
    
    alertViewCpp->alertClosed(buttonIndex, text);
    
}

@end
