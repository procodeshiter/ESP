//
//  Menu.h
//  ModMenu
//
//  Created by Joey on 3/14/19.
//  Copyright © 2019 Joey. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "KittyMemory/MemoryPatch.hpp"
#import "SCLAlertView/SCLAlertView.h"

#import <vector>
#import <initializer_list>

@class OffsetSwitch;
@class OffsetSwitch2;
@class OffsetSwitch3;
@class OffsetSwitch4;
@class OffsetSwitch5;
@class TextFieldSwitch;
@class TextFieldSwitch2;
@class TextFieldSwitch3;
@class TextFieldSwitch4;
@class TextFieldSwitch5;
@class SliderSwitch;
@class SliderSwitch2;
@class SliderSwitch3;
@class SliderSwitch4;
@class SliderSwitch5;
@class Switches;
@class InfoSwitch;
@class InfoSwitch2;
@class InfoSwitch3;
@class InfoSwitch4;
@class InfoSwitch5;

@interface Menu : UIView

-(id)initWithTitle:(NSString *)title_ titleColor:(UIColor *)titleColor_ titleFont:(NSString *)titleFont_ credits:(NSString *)credits_ headerColor:(UIColor *)headerColor_ switchOffColor:(UIColor *)switchOffColor_ switchOnColor:(UIColor *)switchOnColor_ switchTitleFont:(NSString *)switchTitleFont_ switchTitleColor:(UIColor *)switchTitleColor_ infoButtonColor:(UIColor *)infoButtonColor_ maxVisibleSwitches:(int)maxVisibleSwitches_ menuWidth:(CGFloat )menuWidth_ menuIcon:(NSString *)menuIconBase64_ menuButton:(NSString *)menuButtonBase64_;
-(void)setFrameworkName:(const char *)name_;
-(const char *)getFrameworkName;


-(void)showMenuButton;
-(void)addSwitchToMenu:(id)switch_;
-(void)showPopup:(NSString *)title_ description:(NSString *)description_;

@end

@interface OffsetSwitch : UIButton {
	NSString *preferencesKey;
	NSString *description;
    UILabel *switchLabel;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_;


-(NSString *)getPreferencesKey;
-(NSString *)getDescription;
- (std::vector<MemoryPatch>)getMemoryPatches;


@end

@interface OffsetSwitch2 : UIButton {
	NSString *preferencesKey;
	NSString *description;
    UILabel *switchLabel;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_;


-(NSString *)getPreferencesKey;
-(NSString *)getDescription;
- (std::vector<MemoryPatch>)getMemoryPatches;


@end

@interface OffsetSwitch3 : UIButton {
	NSString *preferencesKey;
	NSString *description;
    UILabel *switchLabel;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_;


-(NSString *)getPreferencesKey;
-(NSString *)getDescription;
- (std::vector<MemoryPatch>)getMemoryPatches;


@end

@interface OffsetSwitch4 : UIButton {
	NSString *preferencesKey;
	NSString *description;
    UILabel *switchLabel;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_;


-(NSString *)getPreferencesKey;
-(NSString *)getDescription;
- (std::vector<MemoryPatch>)getMemoryPatches;


@end

@interface OffsetSwitch5 : UIButton {
	NSString *preferencesKey;
	NSString *description;
    UILabel *switchLabel;
}

- (id)initHackNamed:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::vector<uint64_t>)offsets_ bytes:(std::vector<std::string>)bytes_;


-(NSString *)getPreferencesKey;
-(NSString *)getDescription;
- (std::vector<MemoryPatch>)getMemoryPatches;


@end


@interface TextFieldSwitch : OffsetSwitch<UITextFieldDelegate> {
	NSString *switchValueKey;
}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

-(NSString *)getSwitchValueKey;

@end

@interface TextFieldSwitch2 : OffsetSwitch<UITextFieldDelegate> {
	NSString *switchValueKey;
}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

-(NSString *)getSwitchValueKey;

@end


@interface TextFieldSwitch3 : OffsetSwitch<UITextFieldDelegate> {
	NSString *switchValueKey;
}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

-(NSString *)getSwitchValueKey;

@end


@interface TextFieldSwitch4 : OffsetSwitch<UITextFieldDelegate> {
	NSString *switchValueKey;
}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

-(NSString *)getSwitchValueKey;

@end

@interface TextFieldSwitch5 : OffsetSwitch<UITextFieldDelegate> {
	NSString *switchValueKey;
}

- (id)initTextfieldNamed:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

-(NSString *)getSwitchValueKey;

@end


@interface SliderSwitch : TextFieldSwitch

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

@end

@interface SliderSwitch2 : TextFieldSwitch

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

@end

@interface RainbowSwitch : UIButton

+ (UIColor *)getColor:(float)val;
+ (void)addRainbowSwitch2:(NSString *)hackName_;

@end

@interface SliderSwitch3 : TextFieldSwitch

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

@end

@interface SliderSwitch4 : TextFieldSwitch

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

@end

@interface SliderSwitch5 : TextFieldSwitch

- (id)initSliderNamed:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

@end


@interface InfoSwitch : UIButton {
	NSString *preferencesKey;
    UILabel *switchLabel;
}

@end

@interface InfoSwitch2 : UIButton {
	NSString *preferencesKey;
    UILabel *switchLabel;
}

@end

@interface InfoSwitch3 : UIButton {
	NSString *preferencesKey;
    UILabel *switchLabel;
}

@end

@interface InfoSwitch4 : UIButton {
	NSString *preferencesKey;
    UILabel *switchLabel;
}

@end

@interface InfoSwitch5 : UIButton {
	NSString *preferencesKey;
    UILabel *switchLabel;
}

@end

@interface Switches : UIButton


 -(void)addSwitchMus:(NSString *)hackName_ description:(NSString *)description_;

-(void)addSwitch:(NSString *)hackName_ description:(NSString *)description_;

-(void)addSwitch2:(NSString *)hackName_ description:(NSString *)description_;

-(void)addSwitch3:(NSString *)hackName_ description:(NSString *)description_;

-(void)addSwitch4:(NSString *)hackName_ description:(NSString *)description_;

-(void)addSwitch5:(NSString *)hackName_ description:(NSString *)description_;

- (void)addOffsetSwitch:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_;

- (void)addOffsetSwitch2:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_;

- (void)addOffsetSwitch3:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_;

- (void)addOffsetSwitch4:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_;

- (void)addOffsetSwitch5:(NSString *)hackName_ description:(NSString *)description_ offsets:(std::initializer_list<uint64_t>)offsets_ bytes:(std::initializer_list<std::string>)bytes_;

- (void)addTextfieldSwitch:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

- (void)addTextfieldSwitch2:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

- (void)addTextfieldSwitch3:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

- (void)addTextfieldSwitch4:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

- (void)addTextfieldSwitch5:(NSString *)hackName_ description:(NSString *)description_ inputBorderColor:(UIColor *)inputBorderColor_;

- (void)addSliderSwitch:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

- (void)addSliderSwitch2:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

- (void)addSliderSwitch3:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

- (void)addSliderSwitch4:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

- (void)addSliderSwitch5:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;

- (void)addSliderSwitchMus:(NSString *)hackName_ description:(NSString *)description_ minimumValue:(float)minimumValue_ maximumValue:(float)maximumValue_ sliderColor:(UIColor *)sliderColor_;




-(void)addInfoSwitch:(NSString *)hackName_ ;

-(void)addInfoSwitch2:(NSString *)hackName_ ;

-(void)addInfoSwitch3:(NSString *)hackName_ ;

-(void)addInfoSwitch4:(NSString *)hackName_ ;

-(void)addInfoSwitch5:(NSString *)hackName_ ;

- (NSString *)getValueFromSwitch:(NSString *)name;
-(bool)isSwitchOn:(NSString *)switchName;

@end
