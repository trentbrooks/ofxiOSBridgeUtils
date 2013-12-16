#include "ofxLabelView.h"



ofxLabelView::ofxLabelView(){
    
    //printSystemFonts();
    
    label = [[UILabel alloc] init];
    isLabelAdded = false;
    fontName = "Helvetica";
    fontSize = 18;
    textAlign = LEFT;
    textClr = ofColor(0);
}

ofxLabelView::~ofxLabelView(){
    
    remove();
    [label release];
    label = NULL;
}

void ofxLabelView::printSystemFonts() {
    
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"%@", fontName);
        }
    }
}


// this creates/adds the label, and adds to superview if required
void ofxLabelView::add(string text, int posX, int posY, int width, int height) {
    
    label.frame = CGRectMake(posX, posY, width, height);    
    label.text = [NSString stringWithUTF8String:text.c_str()];
    label.numberOfLines = 0;
    label.textAlignment = (UITextAlignment)textAlign;
    //label.opaque = NO;
    //label.alpha = 0.5;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:textClr.r/255.0 green:textClr.g/255.0 blue:textClr.b/255.0 alpha:textClr.a/255.0];
    label.font = [UIFont fontWithName:[NSString stringWithUTF8String:fontName.c_str()] size:fontSize];
    if(height == -1) [label sizeToFit];
    
    if(!isLabelAdded) [ofxiPhoneGetGLParentView() addSubview:label];
    isLabelAdded = true;
}

void ofxLabelView::remove() {
    
    if(isLabelAdded) [label removeFromSuperview];
}


//TODO: check if font exists first
// fonts and alignment must be set before createLabel
void ofxLabelView::setFont(string name, int size) {
    
    NSString* nsFontName = [NSString stringWithUTF8String:name.c_str()];
    bool doesFontExist = false;
    for (NSString *familyName in [UIFont familyNames]) {        
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            if([nsFontName isEqualToString:fontName]) {
                doesFontExist = true;
                this->fontName = name;
                fontSize = size;
                break;
            }
        }
    }
    
    if(!doesFontExist) {
        ofLogError() << name << " font does not exist in system fonts.";
    }
    
}

void ofxLabelView::setColor(ofColor clr) {
    
    textClr = clr;
    if(isLabelAdded) {
        label.textColor = [UIColor colorWithRed:textClr.r/255.0 green:textClr.g/255.0 blue:textClr.b/255.0 alpha:textClr.a/255.0];
    }
}

void ofxLabelView::setAlignment(TextAlignment align) {
    textAlign = align;
}
