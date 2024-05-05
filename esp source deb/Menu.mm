


#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

#define UIColorFromHex(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "Menu.h"
#import "AVKit/AVKit.h"
#import "AVFoundation/AVFoundation.h"
#import "UIKit/UIKit.h"
float RainbowSwitchWidth = 300;

@interface Menu ()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@property (assign, nonatomic) CGPoint lastMenuLocation;
@property (strong, nonatomic) UILabel *menuTitle;
@property (strong, nonatomic) UIView *header;
@property /*(strong, nonatomic)*/UIView *leftview;
@property (strong, nonatomic) UIView *hide;
@property (strong, nonatomic) UIView *footer;
@property (strong, nonatomic) UIView *border;
 

@property /*(nonatomic, retain)*/  UISwitch *privateSwitch;
@end





@implementation Menu


NSUserDefaults *defaults;


UIScrollView *scrollView;
UIScrollView *scrollView2;
UIScrollView *scrollView3;
UIScrollView *scrollView4;
UIScrollView *scrollView5;
UIScrollView *scrollViewMus;
CGFloat menuWidth;
CGFloat scrollViewX;
NSData *poloskadata;
NSData *poloskadata1;
NSData *playerdata;
NSData *player1data;
NSData *poloskawmdata;
NSData *settingsdata;
NSData *knivesdata;
NSData *skinsdata;
NSData *donedata;
NSString *credits;
UIColor *switchOnColor;
NSString *switchTitleFont;
UIColor *switchTitleColor;
UIColor *infoButtonColor;
NSString *menuIconBase64;
NSString *menuButtonBase64;
float scrollViewHeight = 0;
float scrollViewHeight2 = 0;
float scrollViewHeight3 = 0;
float scrollViewHeight4 = 0;
float scrollViewHeight5 = 0;
float scrollViewHeightMus = 0;
BOOL hasRestoredLastSession = false;


const char *frameworkName = NULL;
UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *buttonmus = [UIButton buttonWithType:UIButtonTypeCustom];
UIButton *geo  = [UIButton buttonWithType:UIButtonTypeCustom];

UIWindow *mainWindow;
NSString *poloskaBase64;
UIView *menuTopBorder;
UIView *menuBottomBorder;
UIView *menuLeftBorder;
UIView *menuLeftBorderXyi;
UIView *menuRightBorder;
UIButton *menuButton;
UILabel *crosshair;
UILabel *watermark;
UIDevice *myDevice;
NSDateFormatter *ttime;
UIView *menuRightBorder1;
UIView *menuRightBorder2;
UIView *menuRightBorder11;
UIView *menuRightBorder22;
// init the menu
// global variabls, extern in Macros.h
Menu *menu = [[Menu alloc]init];
Switches *switches = [[Switches alloc]init];


-(id)initWithTitle:(NSString *)title_ titleColor:(UIColor *)titleColor_ titleFont:(NSString *)titleFont_ credits:(NSString *)credits_ headerColor:(UIColor *)headerColor_ switchOffColor:(UIColor *)switchOffColor_ switchOnColor:(UIColor *)switchOnColor_ switchTitleFont:(NSString *)switchTitleFont_ switchTitleColor:(UIColor *)switchTitleColor_ infoButtonColor:(UIColor *)infoButtonColor_ maxVisibleSwitches:(int)maxVisibleSwitches_ menuWidth:(CGFloat )menuWidth_ menuIcon:(NSString *)menuIconBase64_ menuButton:(NSString *)menuButtonBase64_ { 
    mainWindow = [UIApplication sharedApplication].keyWindow; 
    defaults = [NSUserDefaults standardUserDefaults];

    menuWidth = menuWidth_;
    switchOnColor = switchOnColor_;
    credits = credits_;
    switchTitleFont = switchTitleFont_;
    switchTitleColor = switchTitleColor_;
    infoButtonColor = infoButtonColor_; 
 menuButtonBase64 = menuButtonBase64_;



NSString *bat = @"%";


    myDevice = [UIDevice currentDevice];
       [myDevice setBatteryMonitoringEnabled:YES];
           double batLeft = (float)[myDevice batteryLevel] * 100;

   ttime = [[NSDateFormatter alloc] init];
      [ttime setDateFormat:@"HH:mm:ss"];

watermark = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 255, 25)];

watermark.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
watermark.layer.borderColor = [UIColor clearColor].CGColor;
watermark.layer.borderWidth = 2.0f;
watermark.layer.cornerRadius = 1.0;
watermark.text = [NSString stringWithFormat:@"Brutaltrip ➤ %.0f%@ ➤ %@",batLeft,bat,[ttime stringFromDate:[NSDate date]]];
watermark.textColor = [UIColor blackColor];
watermark.adjustsFontSizeToFitWidth = YES;
watermark.layer.opacity = 0;
watermark.font = [UIFont fontWithName:@"GillSans-BoldItalic" size:13.0f];
watermark.layer.masksToBounds = true;
watermark.layer.cornerRadius = 7;
watermark.center = CGPointMake(CGRectGetMaxX(mainWindow.frame)-(watermark.frame.size.width/2)-[[switches getValueFromSwitch:@"Watermark X:"] floatValue], CGRectGetMinY(mainWindow.frame)+(watermark.frame.size.height/2)+[[switches getValueFromSwitch:@"Watermark Y:"] floatValue]);
[mainWindow addSubview:watermark];
[NSTimer scheduledTimerWithTimeInterval:0.001f target:self selector:@selector(CC) userInfo:nil repeats:YES];


        [UIView animateWithDuration:0.45 animations:^ {
if([switches isSwitchOn:@"Watermark"]){

watermark.layer.opacity = 1;
}else{
watermark.layer.opacity = 0;
}
}];


CATransition *animations = [CATransition animation];
animations.timingFunction = [CAMediaTimingFunction
    functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
animations.type = kCATransitionPush;
animations.subtype = kCATransitionFromTop;
animations.duration = 1.7;
[watermark.layer addAnimation:animations forKey:@"kCATransitionPush"];



UIColor *dark = UIColorFromHex (0x000000);



    NSArray *gey = @[(id)[UIColor cyanColor].CGColor,(id) UIColorFromHex(0x000000),
(id)[UIColor magentaColor].CGColor];

    



   


    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation.toValue = gey;
animation.duration = 0;
animation.autoreverses = YES;
animation.repeatCount = INFINITY;
    animation.removedOnCompletion   = NO;
    animation.fillMode              = kCAFillModeBackwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //animation.delegate              = self;

 

    





/*
UILabel *chunky;

chunky = [[UILabel alloc]initWithFrame:CGRectMake(0, 350, mainWindow.frame.size.width / 3.3, 70)];
chunky.text = @"brutaltrip";
chunky.font = [UIFont fontWithName:@"GillSans-BoldItalic" size:17.0f];
chunky.textColor = [UIColor colorWithRed:0.1 green:0.5 blue:0.5 alpha:0.6];
chunky.backgroundColor = [UIColor clearColor];
NSUInteger characterCount = [chunky.text length];

CGFloat randColor = arc4random_uniform(256) / 200.0;
int charsFinished;
CGFloat extraHue;

// making this value smaller will make the transition of color between charcters less noticeable (smoother)
// making this value bigger will make the transition of color between charcters more noticeable (less smooth)
CGFloat smoothness = 0.03;

NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: chunky.attributedText];

for (charsFinished = 0, extraHue = 0.0; charsFinished != characterCount; charsFinished = charsFinished + 1, extraHue = extraHue + smoothness) {
  [text addAttribute: NSForegroundColorAttributeName
    value: [UIColor colorWithHue:randColor + extraHue saturation:1.0 brightness:1.0 alpha:0.8]
    range: NSMakeRange(charsFinished, 1)];
}

[chunky setAttributedText: text];
[mainWindow addSubview: chunky];
*/
/*
CAGradientLayer *grad=[CAGradientLayer layer];
grad.frame=chunky.bounds;


UIColor *ac3=[UIColor darkColor];
grad.colors=@[(id)[ac3 CGColor]];

CABasicAnimation *anim2=[CABasicAnimation animationWithKeyPath:@"colors"];
anim2.toValue=@[(id)ac3.CGColor];
anim2.duration=4.0;
anim2.autoreverses=YES;
anim2.repeatCount=1e100;
[grad addAnimation:anim2 forKey:@"colors"];

[ba.layer insertSublayer:grad atIndex:0];


CABasicAnimation *animation5 = [CABasicAnimation animationWithKeyPath:@"position.x"];
animation5.fromValue = @-300;
animation5.toValue = @1300;
animation5.duration = 9;
animation5.autoreverses = YES;
animation5.repeatCount = INFINITY;
[chunky.layer addAnimation:animation5 forKey:@"basic"];

NSURL *playerurl = [NSURL URLWithString:@"https://i.ibb.co/1Lbj3Wj/1-EB02-E4-B-96-A6-4965-BD0-E-3-AE63-D31-C689-removebg-preview.png"];
playerdata = [NSData dataWithContentsOfURL: playerurl];


NSURL *playerurl1 = [NSURL URLWithString:@"https://i.ibb.co/ykcFQgY/imgonline-com-ua-Negativ-Vd4-N1-Nqggj-G1-Fut.png"];
player1data = [NSData dataWithContentsOfURL: playerurl1];

https://i.ibb.co/JxBYKv7/B2915539-26-D2-46-D0-97-FB-51770-F6-F6-FAA-removebg-preview.png
NSURL *settingsurl = [NSURL URLWithString:@"https://i.ibb.co/YRzK30W/imgonline-com-ua-Negativ-o-XF0z-NLRc6.png"];
settingsdata = [NSData dataWithContentsOfURL: settingsurl];


NSURL *knivesurl = [NSURL URLWithString:@"https://i.ibb.co/DwyqS6z/imgonline-com-ua-Negativ-k-Mr-Ud-Cf7-Bvak.png"];
knivesdata = [NSData dataWithContentsOfURL: knivesurl];



NSURL *skinsurl = [NSURL URLWithString:@"https://i.ibb.co/7Qz4xcV/imgonline-com-ua-Negativ-r889-RI5gq-P.png"];
skinsdata = [NSData dataWithContentsOfURL: skinsurl];*/


/*NSURL *poloskaurl = [NSURL URLWithString:@"https://i.ibb.co/NrYrfky/pngtree-color-abstract-gradient-blurred-halo-background-image-120001.jpg"];
poloskadata = [NSData dataWithContentsOfURL: poloskaurl];*/

    // Base of the Menu UI.


 self = [super initWithFrame:CGRectMake(20,40,menuWidth_+100,230)];
    self.center = mainWindow.center;
    self.layer.opacity = 0.0f;
    self.backgroundColor = UIColorFromHex(0x000000);
[self   setClipsToBounds:YES];
[self.layer setMasksToBounds:YES]; 
    self.transform = CGAffineTransformMakeScale(0.001, 0.001);
    self.layer.cornerRadius = 15;
[NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(CC) userInfo:nil repeats:YES];

UIColor *gol = UIColorFromHex(0x000000);
UIColor *roz = UIColorFromHex(0x000000);

CAGradientLayer *gradientself = [CAGradientLayer layer];

gradientself.frame = self.bounds;
gradientself.colors = @[(id)
gol.CGColor, (id)roz.CGColor];

[self.layer insertSublayer:gradientself atIndex:0];

 NSArray *bebroidq = gradientself.colors;




    CABasicAnimation *animation7 = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation7.toValue = bebroidq;
animation7.duration = 7.0;
animation7.autoreverses = YES;
animation7.repeatCount = INFINITY;
    animation7.removedOnCompletion   = NO;
    animation7.fillMode              = kCAFillModeBackwards;
    animation7.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
     [gradientself addAnimation:animation7 forKey:@"animateGradient"];






self.header = [[UIView alloc]initWithFrame:CGRectMake(-100, -100, 400, 400)];
    self.header.backgroundColor = [UIColor clearColor];
    self.header.layer.opacity = 0.0f;
    CAShapeLayer *headerLayer = [CAShapeLayer layer];
    headerLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.header.bounds byRoundingCorners: 
    UIRectCornerTopRight  | UIRectCornerBottomRight cornerRadii: (CGSize){15, 15}].CGPath;
    self.header.layer.mask = headerLayer;
    [self addSubview:self.header];


    self.leftview = [[UIView alloc]initWithFrame:CGRectMake(20, 0, 100, 230)];
    //self.leftview.backgroundColor = UIColorFromHex(0x000000);
self.leftview.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    self.leftview.layer.opacity = 0.0f;
    CAShapeLayer *leftviewLayer = [CAShapeLayer layer];
    leftviewLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.leftview.bounds byRoundingCorners: 
    UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: (CGSize){15, 15}].CGPath;
    self.leftview.layer.mask = leftviewLayer;
    [self addSubview: self.leftview];




/*UIImage *playerimage1 = [UIImage imageWithData: playerdata];
UIImageView *playerimage = [[UIImageView alloc] initWithImage: playerimage1];
playerimage.frame = CGRectMake (-65,85,245,245);
[_header addSubview: playerimage];*/


    NSData* data = [[NSData alloc] initWithBase64EncodedString:menuIconBase64_ options:0];
    UIImage* menuIconImage = [UIImage imageWithData:data];

    UIButton *menuIcon = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuIcon.frame = CGRectMake(0, 0, 40, 40);
    menuIcon.backgroundColor = [UIColor clearColor];
    [menuIcon setBackgroundImage:menuIconImage forState:UIControlStateNormal];

    [menuIcon addTarget:self action:@selector(menuIconTapped) forControlEvents:UIControlEventTouchDown];
    [self.header addSubview:menuIcon];

    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    //scrollView.backgroundColor = UIColorFromHex(0x1e1f24);
scrollView.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollView.alpha = 1.0f;
scrollView.showsVerticalScrollIndicator = NO;
    //scrollView.layer.cornerRadius = 15;
    [self addSubview:scrollView];

    scrollView2 = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    scrollView2.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollView2.alpha = 0.0f;
scrollView2.showsVerticalScrollIndicator =  NO;
    //scrollView2.layer.cornerRadius = 15;
    [self addSubview:scrollView2];

    scrollView3 = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    scrollView3.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollView3.alpha = 0.0;
scrollView3.showsVerticalScrollIndicator =  NO;
    //scrollView3.layer.cornerRadius = 15;
    [self addSubview:scrollView3];

    scrollView4 = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    scrollView4.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollView4.alpha = 0.0;
scrollView4.showsVerticalScrollIndicator =  NO;
    //scrollView4.layer.cornerRadius = 15;
    [self addSubview:scrollView4];

    scrollView5 = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    scrollView5.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollView5.alpha = 0.0;
scrollView5.showsVerticalScrollIndicator =  NO;
    //scrollView5.layer.cornerRadius = 15;
    [self addSubview:scrollView5];




    scrollViewMus = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 0, menuWidth_, 230)];
    scrollViewMus.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0.0];
    scrollViewMus.alpha = 0.0;
    //scrollViewMus.layer.cornerRadius = 15;
    [self addSubview:scrollViewMus];

/*menuTopBorder = [[UIView alloc]initWithFrame:CGRectMake(105, -0.5, 505, 2.5)];
   menuTopBorder.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1.0 alpha:1];
   [self addSubview:menuTopBorder];

   menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(100 , 0.0, 2.5, self.bounds.size.height - 40)];
  menuLeftBorder.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
   [self addSubview: menuLeftBorder];


menuLeftBorderXyi = [[UIView alloc]initWithFrame:CGRectMake(100 , 0.0, 25, self.bounds.size.height - 40)];
  menuLeftBorderXyi.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
   [self addSubview: menuLeftBorderXyi];


   menuRightBorder = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width, 0.0, 2.5, self.bounds.size.height - 40)];
   menuRightBorder.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
   [self addSubview: menuRightBorder];


   menuBottomBorder = [[UIView alloc]initWithFrame:CGRectMake(-2.5, 230, 505, 2.5)];
   menuBottomBorder.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
   [self addSubview: menuBottomBorder];
*/










menuRightBorder1 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 12,2)];
menuRightBorder1.backgroundColor = [UIColor blackColor];     
menuRightBorder1.center = mainWindow.center;
    menuRightBorder1.alpha = 0.0;
     [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(CC) userInfo:nil repeats:YES];
   [mainWindow addSubview: menuRightBorder1];

   menuRightBorder2 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 2, 12)];
menuRightBorder2.backgroundColor = [UIColor blackColor];  
   menuRightBorder2.center = mainWindow.center;
menuRightBorder2.alpha = 0.0;
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(CC) userInfo:nil repeats:YES];
   [mainWindow addSubview: menuRightBorder2];


menuRightBorder11 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 4, 4)];
   
menuRightBorder11.backgroundColor = [UIColor blackColor];  
   menuRightBorder11.center = mainWindow.center;
    menuRightBorder11.alpha = 0.0;
    menuRightBorder11.layer.cornerRadius = 2.5;
     [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(CC) userInfo:nil repeats:YES];
   [mainWindow addSubview: menuRightBorder11];

   menuRightBorder22 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 4, 4)];
menuRightBorder22.backgroundColor = [UIColor blackColor];  
menuRightBorder22.center = mainWindow.center;
menuRightBorder22.alpha = 0.0;
    menuRightBorder22.layer.cornerRadius = 2.5;
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(CC) userInfo:nil repeats:YES];
   [mainWindow addSubview: menuRightBorder22];

        [UIView animateWithDuration:0.5 animations:^ {
if([switches isSwitchOn:@"Crosshair"]){

menuRightBorder1.alpha = 1.0;

menuRightBorder2.alpha = 1.0;

}
else{

menuRightBorder1.alpha = 0.0;

menuRightBorder2.alpha = 0.0;
}
}];


        [UIView animateWithDuration:0.5 animations:^ {
if([switches isSwitchOn:@"Crosshair Point"]){

menuRightBorder11.alpha = 1.0;

menuRightBorder22.alpha = 1.0;

}
else{

menuRightBorder11.alpha = 0.0;

menuRightBorder22.alpha = 0.0;
}
}];


[button addTarget:self 
 action:@selector(ButtonClicked:)
 forControlEvents:UIControlEventTouchUpInside];
[button setTitle:@" Main" forState:UIControlStateNormal];
[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
button.frame = CGRectMake(-10, 30, 70, 60);
button.layer.cornerRadius = 3.0;
button.layer.masksToBounds = true;
button.tintColor = [UIColor greenColor];
button.layer.borderColor = [UIColor clearColor].CGColor;
button.layer.borderWidth = 0.0f;
UITapGestureRecognizer *buttonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ButtonClicked)];
[button addGestureRecognizer:buttonTap];

[_leftview addSubview:button];


[button2 addTarget:self 
 action:@selector(ButtonClicked2:)
 forControlEvents:UIControlEventTouchUpInside];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitle:@"Misc" forState:UIControlStateNormal];
button2.frame = CGRectMake(-5, 63, 65, 45);
button2.layer.cornerRadius = 3.0;
button2.layer.masksToBounds = true;
button2.tintColor = UIColorFromHex(0x989699);
button2.layer.borderColor =[UIColor clearColor].CGColor;
button2.layer.borderWidth = 0.0f;
UITapGestureRecognizer *buttonTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ButtonClicked2)];
[button2 addGestureRecognizer:buttonTap2];
UIImage *playerimage2 = [UIImage imageWithData: player1data];
UIImageView *vis2image = [[UIImageView alloc] initWithImage: playerimage2];
vis2image.frame = button2.bounds;
[button2 addSubview: vis2image];
[_leftview addSubview:button2];

[button6 addTarget:self 
 action:@selector(ButtonClicked6:)
 forControlEvents:UIControlEventTouchUpInside];
[button6 setTitle:@"🌑" forState:UIControlStateNormal];
[button6 setTitleColor: UIColorFromHex(0xff0000) forState:UIControlStateNormal];
button6.frame = CGRectMake(395, 2.5, 30, 30);
button6.layer.cornerRadius = 5.0;
button6.layer.masksToBounds = true;
button6.backgroundColor =  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
button6.layer.borderColor = [UIColor clearColor].CGColor;
button6.layer.borderWidth = 2.0f;
UITapGestureRecognizer *buttonTap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (ButtonClicked6)];
[button6 addGestureRecognizer:buttonTap6];
[self addSubview:button6];
    

// we need this for the switches, do not remove.
    scrollViewX = CGRectGetMinX(scrollView.self.bounds);

    self.menuTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, -17, 80, 85)];
    self.menuTitle.text = title_;
    self.menuTitle.textColor = [UIColor whiteColor];
    self.menuTitle.font = [UIFont fontWithName:@"Avenir-BlackOblique" size:12.0f];
    self.menuTitle.adjustsFontSizeToFitWidth = false;
self.menuTitle.adjustsFontSizeToFitWidth = YES;
    self.menuTitle.textAlignment = NSTextAlignmentCenter;
    [_leftview addSubview: self.menuTitle];


   

 

   UIPanGestureRecognizer *dragMenuRecognizer  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(menuDragged:)];
    [self.leftview addGestureRecognizer:dragMenuRecognizer];

   UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenu:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [button6 addGestureRecognizer:tapGestureRecognizer];

    [mainWindow addSubview:self];
    [self showMenuButton];

UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu:)];
    tapGestureRecognizer2.numberOfTapsRequired = 2;
    tapGestureRecognizer2.numberOfTouchesRequired = 3;
    [mainWindow addGestureRecognizer:tapGestureRecognizer2];

    return self;
}



// Detects whether the menu is being touched and sets a lastMenuLocation.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.lastMenuLocation = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame));
    [super touchesBegan:touches withEvent:event];
}

// Update the menu's location when it's being dragged
- (void)menuDragged:(UIPanGestureRecognizer *)pan {
    CGPoint newLocation = [pan translationInView:self.superview];
    self.frame = CGRectMake(self.lastMenuLocation.x + newLocation.x, self.lastMenuLocation.y + newLocation.y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (void)hideMenu:(UITapGestureRecognizer *)tap {
    if(tap.state == UIGestureRecognizerStateEnded) {
       [UIView animateWithDuration:0.5   animations:^{
[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
            self.alpha = 0.0f;
            self.header.layer.opacity = 0.0f;
            self.leftview.layer.opacity = 0.0f;
            
self.hide.layer.opacity = 0.0f;
            self.transform = CGAffineTransformMakeScale(0.001, 0.001);
            menuButton.alpha = 0.0f;
        }];
    }
}

-(void)showMenu:(UITapGestureRecognizer *)tapGestureRecognizer {
    if(tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        menuButton.alpha = 0.0f;

       [UIView animateWithDuration:0.6   animations:^{
 [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
 //[UIView beginAnimations:@"Opened" context:nil];      
            self.alpha = 1.0f;
            self.header.layer.opacity = 0.0;
            self.hide.layer.opacity = 1.0f;
            self.leftview.layer.opacity = 1.0f;
     if([switches isSwitchOn:@"Menu Size:"]){
            self.transform = CGAffineTransformMakeScale(1+[[switches getValueFromSwitch:@"Menu Size:"] floatValue], 1+[[switches getValueFromSwitch:@"Menu Size:"] floatValue]);
            }else{    
            self.transform = CGAffineTransformMakeScale(1.0,1.0);
    }


        }];
    }
    // We should only have to do this once (first launch)
    if(!hasRestoredLastSession) {
        hasRestoredLastSession = true;
    }
}

-(void) ButtonClicked{

[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button3 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button4 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button5 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];



scrollView.alpha = 1.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 0.0f;
scrollViewMus.alpha = 0.0f;
}
-(void) ButtonClicked2{

[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[button3 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button4 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button5 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];


scrollViewMus.alpha = 0.0f;
scrollView.alpha = 0.0f;
scrollView2.alpha = 1.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 0.0f;
}

-(void) ButtonClicked3{


[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[button4 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button5 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];




scrollViewMus.alpha = 0.0f;
scrollView.alpha = 0.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 1.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 0.0f;
}
-(void) ButtonClicked4{

[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button3 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[button5 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];


scrollViewMus.alpha = 0.0f;
scrollView.alpha = 0.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 1.0f;
scrollView5.alpha = 0.0f;
}
-(void) ButtonClicked5{

[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button3 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button4 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];


scrollViewMus.alpha = 0.0f;
scrollView.alpha = 0.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 1.0f;

}

-(void) ButtonClicked6{

button.layer.borderColor = [UIColor greenColor].CGColor;
button2.layer.borderColor =  [UIColor redColor].CGColor;
button3.layer.borderColor =  [UIColor redColor].CGColor;
button4.layer.borderColor = [UIColor redColor].CGColor;
button5.layer.borderColor = [UIColor redColor].CGColor;
[buttonmus setTitleColor:UIColorFromHex(0x393a3f) forState:UIControlStateNormal];

scrollView.alpha = 1.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 0.0f;
}



-(void) ButtonClicked11{


[button setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button2 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button3 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button4 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[button5 setTitleColor: UIColorFromHex(0x393a3f) forState:UIControlStateNormal];
[buttonmus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


scrollView.alpha = 0.0f;
scrollView2.alpha = 0.0f;
scrollView3.alpha = 0.0f;
scrollView4.alpha = 0.0f;
scrollView5.alpha = 0.0f;
scrollViewMus.alpha = 1.0f;
}



-(void)CC{

menuRightBorder1.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"Crosshair Red:"] floatValue] green:[[switches getValueFromSwitch:@"Crosshair Green:"] floatValue] blue:[[switches getValueFromSwitch:@"Crosshair Blue:"] floatValue] alpha:[[switches getValueFromSwitch:@"Crosshair Alpha:"] floatValue]];

menuRightBorder2.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"Crosshair Red:"] floatValue] green:[[switches getValueFromSwitch:@"Crosshair Green:"] floatValue] blue:[[switches getValueFromSwitch:@"Crosshair Blue:"] floatValue] alpha:[[switches getValueFromSwitch:@"Crosshair Alpha:"] floatValue]];

menuRightBorder11.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"Crosshair Red:"] floatValue] green:[[switches getValueFromSwitch:@"Crosshair Green:"] floatValue] blue:[[switches getValueFromSwitch:@"Crosshair Blue:"] floatValue] alpha:[[switches getValueFromSwitch:@"Crosshair Alpha:"] floatValue]];

menuRightBorder22.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"Crosshair Red:"] floatValue] green:[[switches getValueFromSwitch:@"Crosshair Green:"] floatValue] blue:[[switches getValueFromSwitch:@"Crosshair Blue:"] floatValue] alpha:[[switches getValueFromSwitch:@"Crosshair Alpha:"] floatValue]];






NSDate *currDate = [NSDate date];
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
[dateFormatter setDateFormat:@"dd.MM.YY HH:mm:ss"];
NSString *dateString = [dateFormatter stringFromDate:currDate];
NSLog(@"%@",dateString);



NSString *bat = @"%";

    myDevice = [UIDevice currentDevice];
       [myDevice setBatteryMonitoringEnabled:YES];
           double batLeft = (float)[myDevice batteryLevel] * 100;

   ttime = [[NSDateFormatter alloc] init];
      [ttime setDateFormat:@"HH:mm:ss t"];


watermark.text = [NSString stringWithFormat:@"Brutaltrip | %.0f%@ | %@ |",batLeft,bat,dateString,[[UIDevice currentDevice]name],[[UIDevice currentDevice] model]];
watermark.center = CGPointMake(CGRectGetMaxX(mainWindow.frame)-(watermark.frame.size.width/2)-[[switches getValueFromSwitch:@"Watermark X:"] floatValue], CGRectGetMinY(mainWindow.frame)+(watermark.frame.size.height/2)+[[switches getValueFromSwitch:@"Watermark Y:"] floatValue]);

  [UIView animateWithDuration:0.45 animations:^ {
if([switches isSwitchOn:@"Watermark"]){
watermark.layer.opacity = 1;
}else{
watermark.layer.opacity = 0;
}
}];



[UIView animateWithDuration:0.50 animations:^ {
if([switches isSwitchOn:@"Crosshair"]){
menuRightBorder1.alpha = 1.0;

menuRightBorder2.alpha = 1.0;

}
else{

menuRightBorder1.alpha = 0.0;

menuRightBorder2.alpha = 0.0;
}
}];
        [UIView animateWithDuration:0.50 animations:^ {
if([switches isSwitchOn:@"Crosshair Point"]){
menuRightBorder11.alpha = 1.0;

menuRightBorder22.alpha = 1.0;

}
else{

menuRightBorder11.alpha = 0.0;

menuRightBorder22.alpha = 0.0;
}
}];






}    


-(void)applicationWillResignActive:(UIApplication *)application{

self.hidden = YES;
}


-(void)showMenuButton {
    NSData* data = [[NSData alloc] initWithBase64EncodedString:menuButtonBase64 options:0];
    UIImage* menuButtonImage = [UIImage imageWithData:data];

    menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    menuButton.frame = CGRectMake((mainWindow.frame.size.width/2), (mainWindow.frame.size.height/2), 0, 0);
    menuButton.backgroundColor = [UIColor clearColor];
    menuButton.center = mainWindow.center;
    [menuButton setBackgroundImage:menuButtonImage forState:UIControlStateNormal];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu:)];
    [menuButton addGestureRecognizer:tapGestureRecognizer];

    [menuButton addTarget:self action:@selector(buttonDragged:withEvent:)
       forControlEvents:UIControlEventTouchDragInside];
    [mainWindow addSubview:menuButton];
}

// handler for when the user is draggin the menu.
- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];

    
CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;

    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
}

// When the menu icon(on the header) has been tapped, we want to show proper credits!
-(void)menuIconTapped {
    [self showPopup:self.menuTitle.text description:credits];
    self.layer.opacity = 0.0f;
}

-(void)showPopup:(NSString *)title_ description:(NSString *)description_ {
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];

    alert.shouldDismissOnTapOutside = NO;
    alert.customViewColor = [UIColor purpleColor];
    alert.showAnimationType = SCLAlertViewShowAnimationSlideInToCenter;
    alert.hideAnimationType = SCLAlertViewHideAnimationSlideOutFromCenter;

    [alert addButton: @"Good!" actionBlock: ^(void) {
        self.layer.opacity = 1.0f;
    }];

    [alert showInfo:title_ subTitle:description_ closeButtonTitle:nil duration:9999999.0f];
}

/*******************************************************************
    This method adds the given switch to the menu's scrollview.
    it also add's an action for when the switch is being clicked.
********************************************************************/
- (void)addSwitchToMenu:(id)switch_ {
    scrollViewHeight += 50;
    scrollView.contentSize = CGSizeMake(menuWidth, scrollViewHeight);
    [scrollView addSubview:switch_];
}

- (void)addSwitchToMenuX:(id)switch_ {
    scrollViewHeightMus += 50;
    scrollViewMus.contentSize = CGSizeMake(menuWidth, scrollViewHeightMus);
    [scrollViewMus addSubview:switch_];
}

- (void)addSwitchToMenu2:(id)switch_ {
    scrollViewHeight2 += 50;
    scrollView2.contentSize = CGSizeMake(menuWidth, scrollViewHeight2);
    [scrollView2 addSubview:switch_];
}

- (void)addSwitchToMenu3:(id)switch_ {
    scrollViewHeight3 += 50;
    scrollView3.contentSize = CGSizeMake(menuWidth, scrollViewHeight3); 
    [scrollView3 addSubview:switch_];
}

- (void)addSwitchToMenu4:(id)switch_ {
    scrollViewHeight4 += 50;
    scrollView4.contentSize = CGSizeMake(menuWidth, scrollViewHeight4);
    [scrollView4 addSubview:switch_];
}

- (void)addSwitchToMenu5:(id)switch_ {
    scrollViewHeight5 += 50;
    scrollView5.contentSize = CGSizeMake(menuWidth, scrollViewHeight5);
    [scrollView5 addSubview:switch_];
}


/*********************************************************************************************
    This method does the following handles the behaviour when a switch has been clicked
    TextfieldSwitch and SliderSwitch only change from color based on whether it's on or not.
    A OffsetSwitch does too, but it also applies offset patches
***********************************************************************************************/



-(void)setFrameworkName:(const char *)name_ {
    frameworkName = name_;
}

-(const char *)getFrameworkName {
    return frameworkName;
}


@end// End of menu class!

/********************************
    OFFSET SWITCH STARTS HERE!
*********************************/

@implementation OffsetSwitch {
    std::vector<MemoryPatch> memoryPatches;
UIButton* knopka;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}

- (id)initHackNamedX:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeightMus - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}

- (id)initHackNamed2:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight2 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;    
    [self addSubview:switchLabel];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}

- (id)initHackNamed3:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight3 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];


UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}

- (id)initHackNamed4:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight4 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;

   switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}

- (id)initHackNamed5:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_ {
    description = description_;
    preferencesKey = hackName_;

    if(offsets_.size() != bytes_.size()){
        [menu showPopup:@"Invalid input count" description:[NSString stringWithFormat:@"Offsets array input count (%d) is not equal to the bytes array input count (%d)", (int)offsets_.size(), (int)bytes_.size()]];
    } else {
        // For each offset, we create a MemoryPatch.
        for(int i = 0; i < offsets_.size(); i++) {
            MemoryPatch patch = MemoryPatch::createWithHex([menu getFrameworkName], offsets_[i], bytes_[i]);
            if(patch.isValid()) {
              memoryPatches.push_back(patch);
            } else {
              [menu showPopup:@"Invalid patch" description:[NSString stringWithFormat:@"Failing offset: 0x%llx, please re-check the hex you entered.", offsets_[i]]];
            }
        }
    }

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight5 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.layer.cornerRadius = 15.0;
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    infoButton.frame = CGRectMake(menuWidth - 0, 0, 0, 0);
    infoButton.tintColor = infoButtonColor;

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];

        for(int Index = 0; Index < memoryPatches.size(); Index++)
        {
            if(isOn)
            {
                memoryPatches[Index].Modify();
            } else {
                memoryPatches[Index].Restore();
            }
        }
    }

    return self;
}


- (void)switchToggled:(id)sender_;
{
    BOOL isOn = [sender_ isOn];
    for(int Index = 0; Index < memoryPatches.size(); Index++)
    {
        if(isOn)
        {
            memoryPatches[Index].Modify();
        } else {
            memoryPatches[Index].Restore();
        }
    }

    [defaults setBool:isOn forKey:preferencesKey];

}


-(NSString *)getPreferencesKey {
    return preferencesKey;
}

-(NSString *)getDescription {
    return description;
}

- (std::vector<MemoryPatch>)getMemoryPatches {
    return memoryPatches;
}


@end //end of OffsetSwitch class


/**************************************
    TEXTFIELD SWITCH STARTS HERE!
    - Note that this extends from OffsetSwitch.
***************************************/

@implementation TextFieldSwitch {
    UITextField *textfieldValue;
UIButton* knopka;

}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

        textfieldValue = [[UITextField alloc]initWithFrame:CGRectMake(110,8,60,20)];
    textfieldValue.layer.borderWidth = 1.0f;
    textfieldValue.layer.borderColor = [UIColor whiteColor].CGColor;
    textfieldValue.layer.cornerRadius = 10.0f;
    textfieldValue.textColor = [UIColor whiteColor];
    textfieldValue.textAlignment = NSTextAlignmentCenter;
    textfieldValue.delegate = self;
    textfieldValue.backgroundColor = [UIColor clearColor];
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        textfieldValue.text = [[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey];
    }

    [self addSubview:textfieldValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;



    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initTextfieldNamed2:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight2 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

        textfieldValue = [[UITextField alloc]initWithFrame:CGRectMake(100,6,60,20)];
    textfieldValue.layer.borderWidth = 1.0f;
    textfieldValue.layer.borderColor = [UIColor redColor].CGColor;
    textfieldValue.layer.cornerRadius = 4.0f;
    textfieldValue.textColor = [UIColor whiteColor];
    textfieldValue.textAlignment = NSTextAlignmentCenter;
    textfieldValue.delegate = self;
    textfieldValue.backgroundColor = [UIColor clearColor];
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        textfieldValue.text = [[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey];
    }

    [self addSubview:textfieldValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initTextfieldNamed3:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight3 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

        textfieldValue = [[UITextField alloc]initWithFrame:CGRectMake(100,6,60,20)];
    textfieldValue.layer.borderWidth = 1.0f;
    textfieldValue.layer.borderColor = [UIColor redColor].CGColor;
    textfieldValue.layer.cornerRadius = 4.0f;
    textfieldValue.textColor = [UIColor whiteColor];
    textfieldValue.textAlignment = NSTextAlignmentCenter;
    textfieldValue.delegate = self;
    textfieldValue.backgroundColor = [UIColor clearColor];
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        textfieldValue.text = [[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey];
    }

    [self addSubview:textfieldValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initTextfieldNamed4:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight4 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

        textfieldValue = [[UITextField alloc]initWithFrame:CGRectMake(100,6,60,20)];
    textfieldValue.layer.borderWidth = 1.0f;
    textfieldValue.layer.borderColor = [UIColor redColor].CGColor;
    textfieldValue.layer.cornerRadius = 4.0f;
    textfieldValue.textColor = [UIColor whiteColor];
    textfieldValue.textAlignment = NSTextAlignmentCenter;
    textfieldValue.delegate = self;
    textfieldValue.backgroundColor = [UIColor clearColor];
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        textfieldValue.text = [[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey];
    }

    [self addSubview:textfieldValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
    [privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initTextfieldNamed5:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeightMus - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

        textfieldValue = [[UITextField alloc]initWithFrame:CGRectMake(100,6,60,20)];
    textfieldValue.layer.borderWidth = 1.0f;
    textfieldValue.layer.borderColor = [UIColor redColor].CGColor;
    textfieldValue.layer.cornerRadius = 4.0f;
    textfieldValue.textColor = [UIColor whiteColor];
    textfieldValue.textAlignment = NSTextAlignmentCenter;
    textfieldValue.delegate = self;
    textfieldValue.backgroundColor = [UIColor clearColor];
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        textfieldValue.text = [[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey];
    }

    [self addSubview:textfieldValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (void)switchToggled:(id)sender_;
{
    BOOL isOn = [sender_ isOn];
    [defaults setBool:isOn forKey:preferencesKey];
}


// so when click "return" the keyboard goes way, got it from internet. Common thing apparantly
-(BOOL)textFieldShouldReturn:(UITextField*)textfieldValue_ {
    switchValueKey = [[self getPreferencesKey] stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    [defaults setObject:textfieldValue_.text forKey:[self getSwitchValueKey]];
    [textfieldValue_ resignFirstResponder];

    return true;
}

-(NSString *)getSwitchValueKey {
    return switchValueKey;
}

@end // end of TextFieldSwitch Class


/*******************************
    SLIDER SWITCH STARTS HERE!
    - Note that this extends from TextFieldSwitch
 *******************************/

@implementation SliderSwitch {
    UISlider *sliderValue;
UIButton* knopka;

    float valueOfSlider;
}

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;

    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }

    [self addSubview:sliderValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initSliderNamed2:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight2 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }

    [self addSubview:sliderValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initSliderNamed3:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight3 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }
    [self addSubview:sliderValue]; 

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;

    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}


- (id)initSliderNamed4:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight4 - 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;
    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }

    [self addSubview:sliderValue];

UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initSliderNamed5:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeight5- 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;

    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }


    [self addSubview:sliderValue];


UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (id)initSliderNamedMus:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_{
    preferencesKey = hackName_;
    switchValueKey = [hackName_ stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    description = description_;

    self = [super initWithFrame:CGRectMake(-1, scrollViewX + scrollViewHeightMus- 1, menuWidth + 2, 50)];
    self.backgroundColor = switchOnColor;
    self.layer.borderWidth = 0.0;
    self.layer.borderColor = [UIColor clearColor].CGColor;


    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 4, menuWidth - 60, 30)];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    switchLabel.textColor = [UIColor whiteColor];
    switchLabel.font = [UIFont fontWithName:@"Greycliff CF Extra Bold" size:15];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:switchLabel];

    sliderValue = [[UISlider alloc]initWithFrame:CGRectMake(50,30,100,10)];
       sliderValue.thumbTintColor = [UIColor clearColor];
    sliderValue.minimumTrackTintColor = [UIColor grayColor];
    sliderValue.maximumTrackTintColor = [UIColor whiteColor];
    sliderValue.minimumValue = minimumValue_;
    sliderValue.maximumValue = maximumValue_;
    sliderValue.continuous = true;
    [sliderValue addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    valueOfSlider = sliderValue.value;

    // get value from the plist & show it (if it's not empty).
    if([[NSUserDefaults standardUserDefaults] objectForKey:switchValueKey] != nil) {
        sliderValue.value = [[NSUserDefaults standardUserDefaults] floatForKey:switchValueKey];
        switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", hackName_, sliderValue.value];
    }


    [self addSubview:sliderValue];


UISwitch *privateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(230, 10, 0, 0)];
[privateSwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
[self addSubview:privateSwitch];

privateSwitch.onTintColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
privateSwitch.thumbTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
privateSwitch.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
privateSwitch.layer.cornerRadius = 16.0;
privateSwitch.clipsToBounds = true;


    BOOL isOn = [defaults boolForKey:preferencesKey];
    if([[NSUserDefaults standardUserDefaults] objectForKey:preferencesKey] != nil)
    {
[privateSwitch setOn:isOn animated:YES];
    }

    return self;
}

- (void)switchToggled:(id)sender_;
{
    BOOL isOn = [sender_ isOn];
    [defaults setBool:isOn forKey:preferencesKey];
}


-(void)sliderValueChanged:(UISlider *)slider_ {
    switchValueKey = [[self getPreferencesKey] stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];
    switchLabel.text = [NSString stringWithFormat:@"%@ %.2f", [self getPreferencesKey], slider_.value];
    [defaults setFloat:slider_.value forKey:[self getSwitchValueKey]];
}


@end // end of SliderSwitch class


@implementation InfoSwitch {
UIView *menuLeftBorder;
}

- (id)initInfoNamed:(NSString *)hackName_ {
    preferencesKey = hackName_;

    self = [super initWithFrame:CGRectMake(0, scrollViewX + scrollViewHeightMus - 0, menuWidth, 35)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -6, menuWidth - 60, 30)];
    switchLabel.text = hackName_;
    switchLabel.textColor = [UIColor greenColor];
    switchLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:17];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:switchLabel];

  menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2.5)];
   //menuBottomBorder.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"red:"] floatValue] green:[[switches getValueFromSwitch:@"green:"] floatValue] blue:[[switches getValueFromSwitch:@"blue:"] floatValue] alpha:1];
menuLeftBorder.backgroundColor = [UIColor clearColor];
    menuLeftBorder.layer.shadowColor = [UIColor purpleColor].CGColor;
    menuLeftBorder.layer.shadowRadius = 30.0f;
    menuLeftBorder.layer.shadowOpacity= 1.0f;
   [self addSubview: menuLeftBorder];
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(RV) userInfo:nil repeats:YES];
    return self;
}


- (id)initInfoNamed2:(NSString *)hackName_ {
    preferencesKey = hackName_;

    self = [super initWithFrame:CGRectMake(0, scrollViewX + scrollViewHeightMus - 0, menuWidth, 35)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -6, menuWidth - 60, 50)];
    switchLabel.text = hackName_;
    switchLabel.textColor = switchTitleColor;
    switchLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:17];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:switchLabel];

  menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2.5)];
   //menuBottomBorder.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"red:"] floatValue] green:[[switches getValueFromSwitch:@"green:"] floatValue] blue:[[switches getValueFromSwitch:@"blue:"] floatValue] alpha:1];
menuLeftBorder.backgroundColor = [UIColor redColor];
    menuLeftBorder.layer.shadowColor = [UIColor purpleColor].CGColor;
    menuLeftBorder.layer.shadowRadius = 20.0f;
    menuLeftBorder.layer.shadowOpacity = 1.0f;
   [self addSubview: menuLeftBorder];
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(RV) userInfo:nil repeats:YES];
    return self;
}

- (id)initInfoNamed3:(NSString *)hackName_ {
    preferencesKey = hackName_;

    self = [super initWithFrame:CGRectMake(0, scrollViewX + scrollViewHeight - 0, menuWidth, 35)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -6, menuWidth - 60, 50)];
    switchLabel.text = hackName_;
    switchLabel.textColor = switchTitleColor;
    switchLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:17];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:switchLabel];

  menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2.5)];
   //menuBottomBorder.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"red:"] floatValue] green:[[switches getValueFromSwitch:@"green:"] floatValue] blue:[[switches getValueFromSwitch:@"blue:"] floatValue] alpha:1];
menuLeftBorder.backgroundColor = [UIColor redColor];
    menuLeftBorder.layer.shadowColor = [UIColor purpleColor].CGColor;
    menuLeftBorder.layer.shadowRadius = 20.0f;
    menuLeftBorder.layer.shadowOpacity = 1.0f;
   [self addSubview: menuLeftBorder];
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(RV) userInfo:nil repeats:YES];
    return self;
}

- (id)initInfoName4:(NSString *)hackName_ {
    preferencesKey = hackName_;

    self = [super initWithFrame:CGRectMake(0, scrollViewX + scrollViewHeight - 0, menuWidth, 35)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -6, menuWidth - 60, 50)];
    switchLabel.text = hackName_;
    switchLabel.textColor = switchTitleColor;
    switchLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:17];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:switchLabel];

  menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2.5)];
   //menuBottomBorder.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"red:"] floatValue] green:[[switches getValueFromSwitch:@"green:"] floatValue] blue:[[switches getValueFromSwitch:@"blue:"] floatValue] alpha:1];
menuLeftBorder.backgroundColor = [UIColor redColor];
    menuLeftBorder.layer.shadowColor = [UIColor purpleColor].CGColor;
    menuLeftBorder.layer.shadowRadius = 20.0f;
    menuLeftBorder.layer.shadowOpacity = 1.0f;
   [self addSubview: menuLeftBorder];
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(RV) userInfo:nil repeats:YES];
    return self;
}

- (id)initInfoNamed5:(NSString *)hackName_ {
    preferencesKey = hackName_;

    self = [super initWithFrame:CGRectMake(0, scrollViewX + scrollViewHeight - 0, menuWidth, 35)];
    self.backgroundColor = [UIColor clearColor];
    self.layer.borderWidth = 0.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;

    switchLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -6, menuWidth - 60, 50)];
    switchLabel.text = hackName_;
    switchLabel.textColor = switchTitleColor;
    switchLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:17];
    switchLabel.adjustsFontSizeToFitWidth = true;
    switchLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:switchLabel];

  menuLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 2.5)];
   //menuBottomBorder.backgroundColor = [UIColor colorWithRed:[[switches getValueFromSwitch:@"red:"] floatValue] green:[[switches getValueFromSwitch:@"green:"] floatValue] blue:[[switches getValueFromSwitch:@"blue:"] floatValue] alpha:1];
menuLeftBorder.backgroundColor = [UIColor redColor];
    menuLeftBorder.layer.shadowColor = [UIColor purpleColor].CGColor;
    menuLeftBorder.layer.shadowRadius = 20.0f;
    menuLeftBorder.layer.shadowOpacity = 1.0f;
   [self addSubview: menuLeftBorder];
[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(RV) userInfo:nil repeats:YES];
    return self;
}

-(void)RV{

}

-(NSString *)getPreferencesKey {
    return preferencesKey;
}



@end 


@implementation Switches





-(void)addSwitchMus:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamedX:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenuX:offsetPatch];

}



-(void)addSwitch:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenu:offsetPatch];

}

-(void)addSwitch2:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed2:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenu2:offsetPatch];

}

-(void)addSwitch3:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed3:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenu3:offsetPatch];

}

-(void)addSwitch4:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed4:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenu4:offsetPatch];

}

-(void)addSwitch5:(NSString *)hackName_ description:(NSString *)description_ {
    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed5:hackName_ description:description_ offsets:std::vector<uint64_t>{} bytes:std::vector<std::string>{}];
    [menu addSwitchToMenu5:offsetPatch];

}


- (void)addOffsetSwitch:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_ {
    std::vector<uint64_t> offsetVector;
    std::vector<std::string> bytesVector;

    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());

    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed:hackName_ description:description_ offsets:offsetVector bytes:bytesVector];
    [menu addSwitchToMenu:offsetPatch];
}

- (void)addOffsetSwitch2:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_ {
    std::vector<uint64_t> offsetVector;
    std::vector<std::string> bytesVector;

    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());

    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed2:hackName_ description:description_ offsets:offsetVector bytes:bytesVector];
    [menu addSwitchToMenu2:offsetPatch];
}

- (void)addOffsetSwitch3:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_ {
    std::vector<uint64_t> offsetVector;
    std::vector<std::string> bytesVector;

    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());

    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed3:hackName_ description:description_ offsets:offsetVector bytes:bytesVector];
    [menu addSwitchToMenu3:offsetPatch];
}

- (void)addOffsetSwitch4:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_ {
    std::vector<uint64_t> offsetVector;
    std::vector<std::string> bytesVector;

    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());

    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed4:hackName_ description:description_ offsets:offsetVector bytes:bytesVector];
    [menu addSwitchToMenu4:offsetPatch];
}

- (void)addOffsetSwitch5:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_ {
    std::vector<uint64_t> offsetVector;
    std::vector<std::string> bytesVector;

    offsetVector.insert(offsetVector.begin(), offsets_.begin(), offsets_.end());
    bytesVector.insert(bytesVector.begin(), bytes_.begin(), bytes_.end());

    OffsetSwitch *offsetPatch = [[OffsetSwitch alloc]initHackNamed5:hackName_ description:description_ offsets:offsetVector bytes:bytesVector];
    [menu addSwitchToMenu5:offsetPatch];
}

- (void)addTextfieldSwitch:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenu:textfieldSwitch];
}

- (void)addTextfieldSwitch2:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed2:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenu2:textfieldSwitch];
}


- (void)addTextfieldSwitch3:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed3:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenu3:textfieldSwitch];
}


- (void)addTextfieldSwitch4:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed4:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenu4:textfieldSwitch];
}

/*- (void)addTextfieldSwitch5:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed5:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenu5:textfieldSwitch];
}
*/


- (void)addTextfieldSwitch5:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_ {
    TextFieldSwitch *textfieldSwitch = [[TextFieldSwitch alloc]initTextfieldNamed5:hackName_ description:description_ inputBorderColor:inputBorderColor_];
    [menu addSwitchToMenuX:textfieldSwitch];
}


- (void)addSliderSwitch:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenu:sliderSwitch];
}

- (void)addSliderSwitch2:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed2:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenu2:sliderSwitch];
}


- (void)addSliderSwitch3:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed3:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenu3:sliderSwitch];
}


- (void)addSliderSwitch4:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed4:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenu4:sliderSwitch];
}

- (void)addSliderSwitch5:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamed5:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenu5:sliderSwitch];
}


- (void)addSliderSwitchMus:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_ {
    SliderSwitch *sliderSwitch = [[SliderSwitch alloc] initSliderNamedMus:hackName_ description:description_ minimumValue:minimumValue_ maximumValue:maximumValue_ sliderColor:sliderColor_];
    [menu addSwitchToMenuX:sliderSwitch];

}

- (void)addInfoSwitch:(NSString *)hackName_ {
    InfoSwitch *infoSwitch = [[InfoSwitch alloc] initInfoNamed:hackName_];
    [menu addSwitchToMenuX:infoSwitch];
}

- (void)addInfoSwitch2:(NSString *)hackName_ {
    InfoSwitch *infoSwitch = [[InfoSwitch alloc] initInfoNamed2:hackName_];
    [menu addSwitchToMenuX:infoSwitch];
}

- (void)addInfoSwitch3:(NSString *)hackName_ {
    InfoSwitch *infoSwitch = [[InfoSwitch alloc] initInfoNamed3:hackName_];
    [menu addSwitchToMenuX:infoSwitch];
}


- (void)addInfoSwitch4:(NSString *)hackName_ {
    InfoSwitch *infoSwitch = [[InfoSwitch alloc] initInfoNamed:hackName_];
    [menu addSwitchToMenuX:infoSwitch];
}

- (void)addInfoSwitch5:(NSString *)hackName_ {
    InfoSwitch *infoSwitch = [[InfoSwitch alloc] initInfoNamed5:hackName_];
    [menu addSwitchToMenuX:infoSwitch];
}

- (NSString *)getValueFromSwitch:(NSString *)name {

    //getting the correct key for the saved input.
    NSString *correctKey =  [name stringByApplyingTransform:NSStringTransformLatinToCyrillic reverse:false];

    if([[NSUserDefaults standardUserDefaults] objectForKey:correctKey]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:correctKey];
    }
    else if([[NSUserDefaults standardUserDefaults] floatForKey:correctKey]) {
        NSString *sliderValue = [NSString stringWithFormat:@"%f", [[NSUserDefaults standardUserDefaults] floatForKey:correctKey]];
        return sliderValue;
    }

    return 0;
}

-(bool)isSwitchOn:(NSString *)switchName {
    return [[NSUserDefaults standardUserDefaults] boolForKey:switchName];
}

@end