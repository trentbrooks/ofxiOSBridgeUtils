
#pragma once

#import <Foundation/Foundation.h>
#import "ofMain.h"

/*
 ofxAlertView
 - native ios UIAlertView's in OF
 - includes a delegate for the button events and handles the view
 - can load a normal alert view with 1 or 2 buttons
 - can create a text input alert view with 1 or 2 buttons
 
 */

class ofxAlertView;

@interface AlertViewDelegate : NSObject <UIAlertViewDelegate> {
    ofxAlertView* alertViewCpp;
    //UIAlertView * _alert;
}

- (id) init:(ofxAlertView *)avCpp;
//@property (nonatomic, retain) UIAlertView* _alert;

@end


// OF event args
class ofAlertViewEventArgs : public ofEventArgs {
public:
	int buttonIndex;
	string text;
};

// OF alert
class ofxAlertView {
    
public:
    
    ofxAlertView();
    ~ofxAlertView();
    
    // ios delegate
    AlertViewDelegate* alertViewDelegate;
    
    
    // create alerts with options- max 2 buttons for now, eg. 'ok' and 'cancel'
    void add(string title, string message, string buttonLabel, bool hasTextInput=false, bool isTextNumeric=false);
    void add(string title, string message, string buttonLabel, string otherButtonLabel, bool hasTextInput=false, bool isTextNumeric=false);
    void remove();
    
    ofEvent<ofAlertViewEventArgs> alertClosedEvent;
    void alertClosed(int buttonIndex, string text);
    
    // set alert view style- default=0, secure text=1, plain text=2, login/password=3
    void setAlertViewStyle(int style);
    UIAlertViewStyle alertViewStyle; //UIAlertViewStylePlainTextInput

protected:

};