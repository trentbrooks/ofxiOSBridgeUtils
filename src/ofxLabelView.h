
#pragma once

#import <Foundation/Foundation.h>
#import "ofMain.h"
#import "ofxiOSExtras.h"

/*
 ofxLabelView
 - native ios UILabel's in OF
 - drop-in text replacement instead of OF/opengl text
 */


// OF label
class ofxLabelView {
    
public:
    
    enum TextAlignment { LEFT,CENTRE,RIGHT } textAlign;
    
    ofxLabelView();
    ~ofxLabelView();
    
    void add(string text, int posX, int posY, int width, int height=-1);
    void remove();
    
    void printSystemFonts();
    void setFont(string name, int size);
    void setColor(ofColor clr);
    void setAlignment(TextAlignment align);
    
    bool isAdded() { return isLabelAdded; };
    
protected:
    
    string fontName;
    int fontSize;
    bool isLabelAdded;
    UILabel* label;
    ofColor textClr;
    
};