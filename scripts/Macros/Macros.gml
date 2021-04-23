
#region Physics
#macro FRICTION .1
#macro COLLISION_TIMER 10
#macro SHIELD_REFRESH_TIME seconds_to_frames(10)
#macro SHIELD_DAMAGE_TIME seconds_to_frames(.5)
#macro WARP_ANGLE 45
#macro WARP_SPEED 15
#macro WARP_EFFECT_SPEED 20
#macro WARP_SCALE 4

#macro COMBAT_TIME seconds_to_frames(5);
#endregion

#region Input Macros
#macro INPUT_NUMBER 20
#macro UP 0
#macro LEFT 1
#macro DOWN 2
#macro RIGHT 3
#macro PRIMARY 4
#macro SECONDARY 5
#macro ACTIVE 6
#endregion

#region Factions
#macro UN "United Worlds"
#macro SA "Sila Alhant"
#macro DC "Deminance Collective"
#macro AD "Archaedemics"
#macro RR "Rr Rhhd"
#macro WW "Watchfire Ward"
#macro PI "Pirates"
#macro NO "None"
#endregion

#region Dialogue Types
#macro UN_D "un"
#macro NO_D "no"
#macro SA_D "sa"
#macro NORMAL "normal"
#macro AGGRESSIVE "aggressive"
#endregion

#region Draw Depths
#macro PLAYER_LAYER "PlayerLayer"
#macro SHIP_LAYER "ShipLayer"
#macro BULLET_LAYER "BulletLayer"
#macro TRAIL_DEPTH 500
#macro PLAYER_DEPTH 100
#macro SHIP_DEPTH 0
#macro BULLET_DEPTH -100
#macro EFFECT_DEPTH -200
#macro MOON_DEPTH 7000
#macro PLANET_DEPTH 8000
#macro STAR_DEPTH 9000
#macro BACKGROUND_DEPTH 10000
#endregion

#region Audio Settings
#macro AUDIO_FALLOFF_REF_DISTANCE 500
#macro AUDIO_FALLOFF_DISTANCE 5000
#macro AUDIO_FALLOFF_MODEL audio_falloff_exponent_distance
#endregion

#region Dock Constants
#macro STATION_DOCK_DISTANCE 128
#macro PLANET_DOCK_DISTANCE 200

#macro SHOP 0
#macro COMMERCE 1
#macro MERCENARY 2
#macro HQ 3

#macro LAYOUT 0
#macro WEAPONS 1
#macro ARMOR 2
#macro SHIELDS 3
#macro ENGINES 4
#macro REACTORS 5
#macro ACTIVES 6
#macro PASSIVES 7
#macro PROTOTYPES 8
#endregion

#region GUI Constants
#macro GUI_BAR_RATE 2
#macro GUI_BAR_DISAPPEAR_TIME seconds_to_frames(1)

#macro DIALOGUE_ALARM 5
#endregion

#region EFFECT CONSTANTS
#macro BLOOM_SIZE 64
#endregion
