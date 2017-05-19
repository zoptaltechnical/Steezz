//
//  Constants.h
//  Qwykr
//
//  Created by Gorav Grover on 12/9/16.
//  Copyright © 2016 Gorav. All rights reserved.

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"


#define WEBSERVER 0

#if(WEBSERVER==0)
static NSString *const baseUrl = @"http://yallatv.gamimarketdev.com/web/";
static NSString *const mediaUrl = @"";


#elif(WEBSERVER==1)
static NSString *const baseUrl =  @"";
static NSString *const mediaUrl = @"";


#elif(WEBSERVER==2)
 static NSString *const baseUrl = @"";
 static NSString *const mediaUrl = @"";

#elif(WEBSERVER==3)
static NSString *const baseUrl = @"";
static NSString *const mediaUrl = @"";

#endif


/*
 Contact Us
 */

#define kContactUs @"contactUs"

/*
Add Addvertisement
 */
#define kAddAddvertisement @"addAdvertisement"


/*
 Add Producer
 */
#define kAddProducer  @"addProducer"

/*
 Get AboutUs Page
 */
#define kAboutUsPage @"aboutUsPage"

/*
 Get Get AdvertisementList
 */
#define kGetAdvertisementList @"getAdvertisementList"

/*
 Get Get LiveVideo
 */
#define kGetLiveVideo @"getLiveVideo"





/*
 Get Get AdvertisementList
 */
#define kGetTvPrograms @"getTvPrograms"



/**
 * THIS HELPTS US TO DEFINE THE STATIC URL PATHS.
 * Call this in your class and see the magic.
 */



/**************************************************
 **                                             **
 **                                             **
 *************************************************/


/**
 * THIS HELPTS US TO DEFINE THE SHARED QUEUE.
 * CALL THIS IN YOUR GCD.
 */
#define sharedQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


#define NSStubLog()                             NSLog(@"%s", __PRETTY_FUNCTION__)¹


#ifndef PX_SHOW_ALERT
#define PX_SHOW_ALERT(title,message,cancelButton) [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButton otherButtonTitles:nil]
#endif

/**
 * THIS HELPTS US TO DEFINE THE BUNDLE PATH.
 * Call this in your class and see the magic.
 */
#ifndef PX_IMAGE_PATH
#define PX_IMAGE_PATH(name)  [[NSBundle mainBundle]pathForResource:name ofType:@"png"]
#endif


/**
 * THIS HIDES THE NAVIGATION BAR
 *
 */
#ifndef PX_HIDENAVIGATIONBAR
#define PX_HIDENAVIGATIONBAR  self.navigationController.navigationBarHidden=YES;
#endif

/**
 * THIS UNHIDES THE NAVIGATION BAR
 *
 */
#ifndef PX_UNHIDENAVIGATIONBAR
#define PX_UNHIDENAVIGATIONBAR  self.navigationController.navigationBarHidden=NO;
#endif



/**
 * THIS POP THE VIEW CONTROLLER
 *
 */
#ifndef PX_POPVIEWCONTROLLER
#define PX_POPVIEWCONTROLLER [self.navigationController popViewControllerAnimated:YES];
#endif


/**
 * This helps to define color for your status bar.
 * Call this in your class and see the magic.
 */
#define BARTYPE_BLACKOPAQUE [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleBlackOpaque]


/**
 * THIS ALLOCS BUTTON WITH THE SPECIFIED FRAME
 * BUTTONS.
 */
#ifndef PX_IMAGEVIEW_N_FRAME
#define PX_IMAGEVIEW_N_FRAME(x,y,w,h) [[UIImageView alloc] initWithFrame:CGRectMake(x,y,w,h)];
#endif


/**
 * THIS DEFINES NIB OF YOUR TABLE VIEW CELL.
 * JUST PASS THE NIB TO OWNER OF CELL.
 */
#ifndef PX_LOADNIB
#define PX_LOADNIB(nib) [[NSBundle mainBundle] loadNibNamed:nib owner:self options:nil]
#endif



/**
 * THIS DEFINES BOLD FONT FOR YOUR CONTROLS.
 * JUST PASS THE FONT SIZE.
 */
#ifndef PX_BOLDFONT
#define PX_BOLDFONT(font) [UIFont boldSystemFontOfSize:font]
#endif


/**
 * THIS DEFINES TITLE FOR YOUR BUTTON.
 * YOU CAN CALL THIS IN YOUR CLASS TO DEFINE TITLE FOR BUTTONS.
 */
#ifndef PX_BUTTONTITLE
#define PX_BUTTONTITLE(button,title) [button setTitle:title forState:UIControlStateNormal];
#endif


/**
 * THIS DEFINES ACTION FOR SELECTOR WITH AND THE FRAME FOR YOUR BUTTON.
 * YOU CAN CALL THIS IN YOUR CLASS TO DEFINE ACTIONS FOR BUTTONS.
 */
#ifndef PX_BUTTONACTION
#define PX_BUTTONACTION(button,selector) [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside]
#endif


/**
 * THIS DEFINES BACKGROUND IMAGE FOR YOUR BUTTON.
 * YOU CAN CALL THIS IN YOUR CLASS TO DEFINE IMAGE FOR BUTTONS.
 */
#ifndef PX_BUTTON_IMAGE
#define PX_BUTTON_IMAGE(button,image) [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
#endif


/**
 * THIS ALLOCS BUTTON WITH THE SPECIFIED FRAME
 * BUTTONS.
 */
#ifndef PX_CUSTOMBUTTON_N_FRAME
#define PX_CUSTOMBUTTON_N_FRAME(x,y,w,h) [[UIButton buttonWithType:UIButtonTypeCustom] initWithFrame:CGRectMake(x,y,w,h)];
#endif


/**
 * THIS ALLOCS AUTORELEASE CUSTOM BUTTON
 *
 */
#ifndef PX_CUSTOMBUTTON
#define PX_CUSTOMBUTTON [UIButton buttonWithType:UIButtonTypeCustom];
#endif



/**
 * THIS ALLOCS BUTTON WITH THE SPECIFIED FRAME
 * BUTTONS.
 */
#ifndef PX_BUTTON_N_FRAME
#define PX_BUTTON_N_FRAME(x,y,w,h) [[UIButton alloc] initWithFrame:CGRectMake(x,y,w,h)];
#endif

/**
 * THIS helps to define boundary of your contorls or frame.
 * Simply pass all the 4 co ordinates to set the frame of your view.
 */
#ifndef PX_SETFRAME
#define PX_SETFRAME(x,y,w,h) CGRectMake(x,y,w,h)
#endif


/**
 * This defines custom view for your bar button item.
 * Pass the custom view as parameter.
 */
#ifndef PX_CUSTOMBARBUTTON
#define PX_CUSTOMBARBUTTON(view) [[UIBarButtonItem alloc] initWithCustomView:view]
#endif




/**
 * This helps to define background color for your view.
 * call this and pass the color which you want for your view.
 */
#ifndef PX_BACKGROUNDCOLOR
#define PX_BACKGROUNDCOLOR(aColor) [UIColor aColor]
#endif



/**
 * This defines view background color with RGB values.
 * Just pass RGB values of the color to set.
 */
#ifndef PX_GREYVIEWBACKGROUNDCOLOR
#define PX_GREYVIEWBACKGROUNDCOLOR [UIColor colorWithRed:215.0/255.0 green:217.0/255.0 blue:223.0/255.0 alpha:1.0]
#endif

#define SCREEN_WIDTH			[[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT			[[UIScreen mainScreen] bounds].size.height

/**
 * This defines image and selector for you bar button.
 * Pass image and selector with action.
 */
#define IMGBUTTON(FILENAME, SELECTOR) [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:FILENAME] style:UIBarButtonItemStylePlain target:self action:SELECTOR]

#define showAlert(format, ...) myShowAlert(__LINE__, (char *)__FUNCTION__, format, ##__VA_ARGS__)


/**
 * This defines Add style bar button for your view.
 * Just pass the selector for you bar button.
 */
#define ADD_BARBUTTON(SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:SELECTOR]



/**
 * This defines Done style bar button for your view.
 * Just pass the selector for you bar button.
 */
#define DONE_BARBUTTON(SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:SELECTOR]


/**
 * This defines Cancel style bar button for your view.
 * Just pass the selector for you bar button.
 */
#define CANCEL_BARBUTTON(SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:SELECTOR]


/**
 * This defines Save style bar button for your view.
 * Just pass the selector for you bar button.
 */
#define SAVE_BARBUTTON(SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:SELECTOR]



/**
 * This defines color properties for you view with RGB component.
 * Just pass RGB of the color.
 */
#ifndef PX_RGBCOLOR
#define PX_RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#endif

#ifndef PX_RGBACOLOR
#define PX_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif




/**
 * This defines font for your control titles or texts.
 * Just pass font size and type.
 */
#define  PX_FONT(fontType,fontSize) [UIFont fontWithName:fontType size: fontSize]


/**
 * This helps to check your device version.
 * Just call this.
 */
#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
#define IOS_NEWER_OR_EQUAL_TO_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] >= 6.0 )




/**
 * This gets the string value from your rect.
 * Just pass the frame.
 */
#define RSTRING(X) NSStringFromCGRect(X)



/**
 * This helps to set image for your view.
 * Just pass the image.
 */
#define SETIMAGE(X) [(UIImageView *)self.view setImage:X];


/**
 * This helps to find button subview with tag.
 * Just pass the view and tag.
 */
#define CELLBUTTON_WITH_TAG(CELL,X) (UIButton *)[CELL viewWithTag:X];


/**
 * This helps to resign your text fields.
 * Just pass the the textfield.
 */
#define LINE_RESIGNFIRSTRESPONDER(textField)  [textField resignFirstResponder];


/**
 * This helps to become first responder text fields.
 * Just pass the the textfield.
 */
#define PX_BECOMEFIRSTRESPONDER(textField)  [textField becomeFirstResponder];



/**
 * This defines Add style bar button for your view.
 * Just pass the selector for you bar button.
 */




#define FEQUAL(a,b) (fabs((a) - (b)) < FLT_EPSILON)
#define FEQUALZERO(a) (fabs(a) < FLT_EPSILON)
#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_4_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_4_0 550.32
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
#define BW_IF_IOS4_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_4_0) \
{ \
__VA_ARGS__ \
}
#else
#define BW_IF_IOS4_OR_GREATER(...)
#endif

#define BW_IF_PRE_IOS4(...)  \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iPhoneOS_4_0)  \
{ \
__VA_ARGS__ \
}

//@end



