#include "ofxActionSheet.h"



ofxActionSheet::ofxActionSheet(){
    
    actionSheetDelegate = [[ActionSheetDelegate alloc] init:this];
}

ofxActionSheet::~ofxActionSheet(){
    
    [actionSheetDelegate release];
    actionSheetDelegate = NULL;
}

void ofxActionSheet::actionSheetClosed(int buttonIndex) {
    
    ofActionSheetEventArgs event;
    event.buttonIndex = buttonIndex;
    ofNotifyEvent(actionSheetClosedEvent, event);
}


// default 2 buttons
void ofxActionSheet::add(string title, string buttonLabel, string otherButtonLabel) {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:(title == "") ? nil : [NSString stringWithUTF8String:title.c_str()]
                                                         delegate:actionSheetDelegate
                                                cancelButtonTitle:nil
                                           destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    [actionSheet addButtonWithTitle:[NSString stringWithUTF8String:buttonLabel.c_str()]];
    [actionSheet addButtonWithTitle:[NSString stringWithUTF8String:otherButtonLabel.c_str()]];
    [actionSheet showInView:ofxiPhoneGetGLParentView()];
    //actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
    [actionSheet release];

}

// vector of buttons
void ofxActionSheet::add(string title, vector<string>& buttonLabels) {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:(title == "") ? nil : [NSString stringWithUTF8String:title.c_str()]
                                                             delegate:actionSheetDelegate
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    for(int i = 0; i < buttonLabels.size(); i++) {
        [actionSheet addButtonWithTitle:[NSString stringWithUTF8String:buttonLabels[i].c_str()]];
    }
    
    [actionSheet showInView:ofxiPhoneGetGLParentView()];
    //actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
    [actionSheet release];
}

void ofxActionSheet::remove() {

	ofLogVerbose() << "no need to remove ofxActionSheet, it's automatically released after use.";
}


// OBJC
@implementation ActionSheetDelegate


- (id) init :(ofxActionSheet *)asCpp {
    if(self = [super init])        {
        NSLog(@"ofxActionSheet initiated");
        
        // ref to OF instance
        actionSheetCpp = asCpp;
    }
    return self;
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    //NSLog(@"The %@ button was tapped.", [actionSheet buttonTitleAtIndex:buttonIndex]);
    NSLog(@"something... %ld", (long)buttonIndex);
    actionSheetCpp->actionSheetClosed(buttonIndex);
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {

    NSLog(@"Action sheet cancelled.");
    // need to notify OF with -1 button index
    actionSheetCpp->actionSheetClosed(-1);
}

@end