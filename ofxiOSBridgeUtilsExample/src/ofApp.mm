#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	

    ofSetFrameRate(60);
    ofBackground(40);
    ofEnableAlphaBlending();
    
    alertView = new ofxAlertView();
    ofAddListener(alertView->alertClosedEvent, this, &ofApp::onAlertClosed);
    
    actionSheet = new ofxActionSheet();
    ofAddListener(actionSheet->actionSheetClosedEvent, this, &ofApp::onActionSheetClosed);
    
    labelView = new ofxLabelView();
    labelView->setColor(ofColor(255));
    
    activityIndicatorView = new ofxActivityIndicator();
    addedTime=0;
    
}

void ofApp::onAlertClosed(ofAlertViewEventArgs& args) { //const void* sender, int &buttonId) {
    
    ofLog() << "Closed alert: " << args.buttonIndex << ", " << args.text;
}

void ofApp::onActionSheetClosed(ofActionSheetEventArgs& args) {
    
    ofLog() << "Closed action sheet:  " << args.buttonIndex;
}
//--------------------------------------------------------------
void ofApp::update(){

    if(activityIndicatorView->isAdded()) {
        // activity views block any interaction - so just forcing it off after 3 seconds
        int elapsed = ofGetElapsedTimeMillis() - addedTime;
        if(elapsed > 3000) activityIndicatorView->remove();
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
	
    ofDrawBitmapStringHighlight("1. Tap to launch alert view", 25,25);
    
    ofDrawBitmapStringHighlight("2. Tap to launch action sheet view", 25,25+(ofGetHeight()/4));
    
    ofDrawBitmapStringHighlight("3. Tap to add label text field", 25,25+(ofGetHeight()/2));
    
    ofDrawBitmapStringHighlight("4. Tap to add activity indicator", 25,25+(ofGetHeight()/2)+(ofGetHeight()/4));
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

    // add an alert view
    if(touch.y < ofGetHeight()/4) {
        alertView->add("Hello Alert", "Make a decision?", "Ok", "Cancel", false, false);
    }
    
    // add an action sheet view
    else if(touch.y < ofGetHeight()/2) {
        vector<string> labelOptions;
        labelOptions.push_back("Yes");
        labelOptions.push_back("No");
        labelOptions.push_back("Maybe");
        actionSheet->add("Hello Action sheet", labelOptions);
    }
    
    // add a label text field
    else if(touch.y < ofGetHeight() - (ofGetHeight()/4)) {
        if(labelView->isAdded())
            labelView->remove();
        else
            labelView->add("I am a native UILabel", 25, ofGetHeight()/2 + 50, ofGetWidth());
        
    }
    
    // add an activity view
    else {
        activityIndicatorView->add(true);
        addedTime = ofGetElapsedTimeMillis();
    }
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}

