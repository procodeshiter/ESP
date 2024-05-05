#import "Macros.h"

typedef struct Vector3
{
    float x, y, z;

    inline Vector3() {}

    inline Vector3(const float X, const float Y, const float Z) { x = X; y = Y; z = Z; }

    inline Vector3 operator + (const Vector3& A) const { return Vector3(x + A.x, y + A.y, z + A.z); }

    inline Vector3 operator + (const float A) const { return Vector3(x + A, y + A, z + A); }

    inline Vector3 operator - (const Vector3& A) const { return Vector3(x - A.x, y - A.y, z - A.z); }

    inline Vector3 operator - (const float A) const { return Vector3(x - A, y - A, z - A); }

    inline Vector3 operator * (const Vector3& A) const { return Vector3(x * A.x, y * A.y, z * A.z); }

    inline Vector3 operator * (const float A) const { return Vector3(x * A, y * A, z * A); }

    inline Vector3 operator / (const Vector3& A) const { return Vector3(x / A.x, y / A.y, z / A.z); }

    inline Vector3 operator / (const float A) const { return Vector3(x / A, y / A, z / A); }
};

using vec3 = Vector3;

void *(*get_transform)(void *);
vec3 (*get_position)(void *);
int (*GetTeam)(void *);
int (*GetHealth)(void *);
bool (*get_IsLocal)(void *);
void *(*get_main)();
vec3 (*WorldToViewportPoint)(void *, vec3, int);
float (*get_fieldOfView)(void *);

vec3 GetObjectLocation(void *object)
{
    return get_position(get_transform(object));
}

vec3 WorldToScreen(vec3 object)
{
    vec3 position = WorldToViewportPoint(get_main(), object, 2);

    vec3 location;
    location.x = ScreenWidth * position.x;
    location.y = ScreenHeight - position.y * ScreenHeight;
    location.z = position.z;

    if (location.x > 0 && location.y > 0 && location.z > 0)
    return location;

    return {0, 0, 0};
}

struct me_t
{
    void *object;
    vec3 position;
    float fov;
}*me;

struct enemy_t
{
    void *object;
    vec3 position;
    vec3 w2sposition;
    int health;
}*enemy;

void (*old_player_update)(void *player);
void new_player_update(void *player)
{
    [esp setNeedsDisplay];

    if (get_IsLocal(player))
    {
        me->object = player;
        me->position = GetObjectLocation(me->object);
        me->fov = get_fieldOfView(get_main());
    }

    if (NULL != me->object)
    {
        if (GetTeam(me->object) != GetTeam(player))
        {
            enemy->object = player;
            enemy->position = GetObjectLocation(enemy->object);
            enemy->w2sposition = WorldToScreen(enemy->position);
            enemy->health = GetHealth(enemy->object);
        }

        if (enemy->w2sposition.x == 0 && enemy->w2sposition.y == 0 && enemy->w2sposition.z == 0)
        return;

        float EnemyHeight = 8400 / (enemy->w2sposition.z / 4) / (me->fov / 2);
        float EnemyWidth = 1680 / (enemy->w2sposition.z / 4) / (me->fov / 4);

        float EnemyCoordX = enemy->w2sposition.x - EnemyWidth / 2;
        float EnemyCoordY = enemy->w2sposition.y - EnemyHeight;

        if ([switches isSwitchOn:(@"Enemy Lines")])
        {
            [esp addEnemyLine:(EnemyCoordX + EnemyWidth / 2) y:EnemyCoordY];
        }

        if ([switches isSwitchOn:(@"Enemy Boxes")])
        {
            [esp addEnemyBox:EnemyCoordX y:EnemyCoordY w:EnemyWidth h:EnemyHeight];
        }

        if ([switches isSwitchOn:(@"Enemy Healthbars")])
        {
            [esp addEnemyHealthbar:EnemyCoordX - 4.5f y:EnemyCoordY w:2.5 h:EnemyHeight health:enemy->health];
        }
    }

    old_player_update(player);
}


void setup() {



//Main

me = new me_t();
    enemy = new enemy_t();

  HOOK(0x1A06738, new_player_update, old_player_update);

    *(void **)&get_transform = (void *)getRealOffset(0x2C82CE8);
    *(void **)&get_position = (void *)getRealOffset(0x2C8C9D4);
    *(void **)&GetTeam = (void *)getRealOffset(0x1A05FEC);
    *(void **)&GetHealth = (void *)getRealOffset(0x1A04268);
    *(void **)&WorldToViewportPoint = (void *)getRealOffset(0x2C5F930);

[switches addSwitch:NSSENCRYPT("Enemy Lines") description:nil];             
[switches addSwitch:NSSENCRYPT("Enemy Boxes") description:nil];
[switches addSwitch:NSSENCRYPT("Enemy Healthbars") description:nil];         
[switches addSwitch:NSSENCRYPT("offscreen") description:nil];






//Misc

[switches addInfoSwitch2:NSSENCRYPT("SUBSCRIPTION: LIFE TIME")];


[switches addSwitch2:@"Watermark" description:@""];



[switches addSliderSwitch2:@"Watermark X:"
              description:@""
                minimumValue:-200
                  maximumValue:500
                    sliderColor:UIColorFromHex(0xBD0000)];
[switches addSliderSwitch2:@"Watermark Y:"
              description:@""
                minimumValue:-500
                  maximumValue:500
                    sliderColor:UIColorFromHex(0xBD0000)];

 [switches addTextfieldSwitch2:NSSENCRYPT("Ping:")
            description:NSSENCRYPT("Set your custom ping")
              inputBorderColor:UIColorFromHex(0x7000E8)];



}                  

void setupMenu() {



[menu setFrameworkName:"UnityFramework"];

menu = [[Menu alloc]  
            initWithTitle:NSSENCRYPT("BRUTALTRIP")
            titleColor:UIColorFromHex(0x000000)//(0xe9eff7)
            titleFont:NSSENCRYPT("TrebuchetMS-Bold")
            credits:NSSENCRYPT("\n\n Mod menu made by \n\n rezonagnte \n\n and \n\n hoosh")
            headerColor: [UIColor colorWithRed:0 green:0 blue:36 alpha:0.0]
            switchOffColor:UIColorFromHex(0x1e1f24)
            switchOnColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0]
            switchTitleFont:NSSENCRYPT("TrebuchetMS-Bold")
            switchTitleColor:[UIColor whiteColor]
            infoButtonColor:UIColorFromHex(0xDDFFFF)
            maxVisibleSwitches:5
            menuWidth:330
            menuIcon:@""
            menuButton:@""];    



  
    mainWindoww = [UIApplication sharedApplication].keyWindow;
    TextFieldView *textFieldView = [[TextFieldView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    textFieldView.userInteractionEnabled = NO;
    textFieldView.backgroundColor = [UIColor clearColor];
    esp = [[CGView alloc] initWithFrame:mainWindoww];
    if([switches isSwitchOn:@"offscreen"])
    [textFieldView addSubview:esp];
    [mainWindoww addSubview:textFieldView];
    

    /********************************************************************
        Once menu has been initialized, it will run the setup functions. 
        All of your switches should be entered in the setup() function!
    *********************************************************************/
    setup();

}

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {


timer(1) {
setupMenu();


});


}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
