#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxiOSBridgeUtils.h"

class ofApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);

    
    ofxAlertView* alertView;
    void onAlertClosed(ofAlertViewEventArgs& args);
    
    ofxActionSheet* actionSheet;
    void onActionSheetClosed(ofActionSheetEventArgs& args);
    
    ofxLabelView* labelView;
    
    ofxActivityIndicator* activityIndicatorView;
    int addedTime;
};


