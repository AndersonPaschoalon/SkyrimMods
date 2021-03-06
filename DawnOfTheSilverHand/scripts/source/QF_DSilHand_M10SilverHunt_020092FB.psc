;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_DSilHand_M10SilverHunt_020092FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpyWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpyWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DriftshadeGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DriftshadeGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GallowsGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GallowsGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantTroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantTroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Krev
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Krev Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Debug.Trace("** SILVERHAND QUEST! <" + GetStage() + ">")

; Resurrect if is dead
Actor krev =  Alias_Krev.GetReference() as Actor
Debug.Trace("-- krev <" +  krev  + ">")
Bool isKrevDead = krev.IsDead()
Debug.Trace("-- Giant Krev is Dead? <" + isKrevDead + ">" )
if (isKrevDead )
    Debug.Trace("-- Krev is Dead -> Resurrect")
    krev.Resurrect()
else 
    Debug.Trace("-- Krev is Alive")
endif

; Enable Krev
Debug.Trace("-- Enable Krev")
Alias_Krev.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("** SILVERHAND QUEST! <" + GetStage() + ">")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; Add Reward
Debug.Trace("-- Adding reward after joining the Silver Hand")
Game.GetPlayer().AddItem(ArmorBanditCuirass)
Game.GetPlayer().AddItem(ArmorBanditHelmet)
Game.GetPlayer().AddItem(ArmorStormcloakBoots)
Game.GetPlayer().AddItem(ArmorBanditGauntlets)
Game.GetPlayer().AddItem(ArmorIronBandedShield)
Game.GetPlayer().AddItem(SilverSword)
Debug.Trace("-- Adding Reward done!")

Debug.Trace("-- Starting next quest!")
DSilHand_M20AngarvundesTreasure.Start()
DSilHand_M20AngarvundesTreasure.SetStage(10)
DSilHand_M20AngarvundesTreasure.SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace("** SILVERHAND QUEST! <" + GetStage() + ">")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.Trace("** SILVERHAND QUEST! <" + GetStage() + ">")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Log Quest Stage
Debug.Trace("** SILVERHAND QUEST! <" + GetStage() + ">")

; Enable Frost troll
Debug.Trace("-- Enable Giant Frost Troll")
Alias_GiantTroll.GetReference().Enable()

;  resurrect trol if is dead 
Actor troll =  Alias_GiantTroll.GetReference() as Actor
Debug.Trace("-- troll <" +  troll  + ">")
Bool isTrollDead = troll.IsDead()
Debug.Trace("-- Giant Troll is Dead? <" + isTrollDead + ">" )
if (isTrollDead )
    Debug.Trace("-- Giant Troll is Dead -> Resurrect")
    troll.Resurrect()
else 
    Debug.Trace("-- Giant Troll is Alive")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("**STARTING SILVERHAND QUEST! <" + GetStage() + ">")

; Diasable Troll
Debug.Trace("-- Disable Giant Frost Troll")
Alias_GiantTroll.GetReference().Disable()

; Disable Krev
Debug.Trace("-- Disable Krev the Skinnerl")
Alias_Krev.GetReference().Disable()

; Add to Silver Hand Faction
Game.GetPlayer().AddToFaction(SilverHandFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Debug.Trace("** SILVERHAND FAIL QUEST! <" + GetStage() + ">")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DSIlHand_BoneGiantTrollSkull  Auto  

Armor Property ArmorBanditCuirass  Auto  

Armor Property ArmorBanditHelmet  Auto  

Armor Property ArmorStormcloakBoots  Auto  

Armor Property ArmorBanditGauntlets  Auto  

Armor Property ArmorIronBandedShield  Auto  

WEAPON Property SilverSword  Auto  

Int Property isGallowsRockFirstConversation  = 0 Auto Hidden 
{Keep Tracvk if the Dragonborn have talked with the GallowsRock Guard yet or not}

Int Property gallowRockGuardPatience = 0 Auto  
{keep track of how much bad responses you have given to the Gallows Rock Guard.}

Quest Property DSilHand_M20CompConspiracy  Auto  
{DEPRECATED}

Quest Property DSilHand_M20AngarvundesTreasure  Auto  
{Reference to DSilHand_M20AngarvundesTreasure quest.}

Faction Property SilverHandFaction  Auto  
