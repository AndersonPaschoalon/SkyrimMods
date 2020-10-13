Scriptname TestMod02_HelloWorld extends ObjectReference  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
;
; Runs on object is loaded 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnInit()
    Debug.Trace("#######################################################")
    Debug.Trace("# TestMod02_HelloWorld")
    Debug.Trace("#######################################################")
    Debug.MessageBox("Hellow World!");
    ; Output "Hello World" to the log
    Debug.Trace("Hello, World!")
    ; Output "Hello World" to the log at error severity
    Debug.Trace("Hello, World!", 2)
    Int val = 10
    String str = "Hey dude, val:"
    String combo = str + val;
    Debug.Trace(combo)
EndEvent


Event OnOpen(ObjectReference akActionRef)
    Debug.MessageBox("Open Ok");
endEvent

Event OnActivate(ObjectReference akActionRef)
    Debug.MessageBox("OnActivate Ok");
    Debug.MessageBox("SilverHandFaction:" + SilverHandFaction.GetFormID());
    Debug.MessageBox("SilverHandFaction:" + SilverHandFaction);
    Game.GetPlayer().AddToFaction(SilverHandFaction)
    ;  This is best used in conjunction with AddToFaction as members of factions that oppose 
    ; the PlayerFaction may have a high Aggression level, and you must use this function and 
    ; set the value to 3 for making them friends.
    PlayerFaction.SetReaction(SilverHandFaction, 3)
    Debug.MessageBox("Player Joined the Silverhand!!!");
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
    Debug.MessageBox("Hit ok!");
    Debug.MessageBox("Game.GetPlayer():" + Game.GetPlayer());
    Debug.MessageBox("akAggressor:" + akAggressor);
    ;if (akAggressor == Game.GetPlayer())
    if(Game.GetPlayer().IsInFaction(SilverHandFaction))
        Game.GetPlayer().RemoveFromFaction(SilverHandFaction)
        Debug.MessageBox("You are not silver hand anymore :'( '");
    endIf
    ;endIf
    Debug.MessageBox("We were hit by " + akAggressor);
    Debug.Trace("We were hit by " + akAggressor)
EndEvent

Int Property testIntVal = 0 Auto  
{This is a test property}

GlobalVariable Property TestMod02_testGlobalVar  Auto  
{test the TestMod02_testGlobal on the script scope.}


Faction Property SilverHandFaction  Auto  

Faction Property PlayerFaction  Auto  
