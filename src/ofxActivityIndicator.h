
#pragma once

#import <Foundation/Foundation.h>
#import "ofMain.h"
#import "ofxiOSExtras.h"

/*
 ofxActivityIndicator
 - native ios UIActivityIndicatorView in OF
 */


// OF activity idicator
class ofxActivityIndicator {
    
public:
    
    ofxActivityIndicator();
    ~ofxActivityIndicator();

    // create activity window with options
    void add(bool useLargeIndicator, ofColor clr= ofColor(255));
    void remove();
    
    bool isAdded() { return isIndicatorAdded; };

protected:

	UIActivityIndicatorView *activityIndicatorView;
	bool isIndicatorAdded;

};