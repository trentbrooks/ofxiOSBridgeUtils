
#pragma once

#import <Foundation/Foundation.h>
#import "ofMain.h"
#import "ofxiOSExtras.h"

/*
 ofxActionSheet
 - native ios ActionSheet in OF
 - includes a delegate for the button events and handles the view
 - very similar to ofxAlertView
 */

class ofxActionSheet;


// OBJC
@interface ActionSheetDelegate : NSObject <UIActionSheetDelegate> {
    ofxActionSheet* actionSheetCpp;
}

- (id) init:(ofxActionSheet *)asCpp;

@end


// OF event args
class ofActionSheetEventArgs : public ofEventArgs {
public:
	int buttonIndex;
};


// OF action sheet
class ofxActionSheet {
    
public:
    
    ofxActionSheet();
    ~ofxActionSheet();

	// ios delegate
    ActionSheetDelegate* actionSheetDelegate;

    // create action sheet with options
    void add(string title, string buttonLabel, string otherButtonLabel);
    void add(string title, vector<string>& buttonLabels);
    void remove();

    ofEvent<ofActionSheetEventArgs> actionSheetClosedEvent;
    void actionSheetClosed(int buttonIndext);

protected:

};