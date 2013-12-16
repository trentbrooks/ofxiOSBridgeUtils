#include "ofxActivityIndicator.h"



ofxActivityIndicator::ofxActivityIndicator(){
    
    isIndicatorAdded = false;
    activityIndicatorView = [[UIActivityIndicatorView alloc] init];
}

ofxActivityIndicator::~ofxActivityIndicator(){
    
    [activityIndicatorView release];
    activityIndicatorView = NULL;
}



void ofxActivityIndicator::add(bool useLargeIndicator, ofColor clr) {
    
    //activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(useSmallViewStyle) ? UIActivityIndicatorViewStyleWhite : UIActivityIndicatorViewStyleWhiteLarge];
   	activityIndicatorView.activityIndicatorViewStyle = (useLargeIndicator) ? UIActivityIndicatorViewStyleWhiteLarge : UIActivityIndicatorViewStyleWhite;
    activityIndicatorView.frame = CGRectMake(0, 0, ofGetWidth(), ofGetHeight());
	activityIndicatorView.color = [UIColor colorWithRed:clr.r/255.0 green:clr.g/255.0 blue:clr.b/255.0 alpha:clr.a/255.0];   
    [activityIndicatorView startAnimating];
    
    if(!isIndicatorAdded) [ofxiPhoneGetGLParentView() addSubview:activityIndicatorView];
    isIndicatorAdded = true;
    //[activityIndicatorView release];
}

void ofxActivityIndicator::remove() {

	if(isIndicatorAdded) {
        [activityIndicatorView removeFromSuperview];
        isIndicatorAdded = false;
    }
}