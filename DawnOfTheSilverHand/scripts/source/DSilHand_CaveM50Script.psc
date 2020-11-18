Scriptname DSilHand_CaveM50Script extends ObjectReference  
{DSilHand_CaveM50Script Script for quest M50}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M50WolfAmbush  Auto  
{DSilHand_M50WolfAmbush quest reference.}

Actor Property NjadaStonearm  Auto  
{NjadaStonearm Reference}

Actor Property DSilHand_CompanionRookieNord02  Auto  
{DSilHand_CompanionRookieNord02 Companion Nord 02}

ObjectReference Property DSilHand_M50xMarkerNjadaShieldBrother  Auto  
{DSilHand_M50xMarkerNjadaShieldBrother XMarker for Njada Shield Brother}

ObjectReference Property DSilHand_M50xMarkerNjada  Auto  
{DSilHand_M50xMarkerNjada XMarker for Njada}

String THIS_FILE = "(DSilHand_CaveM50Script.psc) "
Bool alreadyActivated = false

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the Cave Bonechill Passage. 
; 
; Calls bonechillDSIlHandM50EventHandler()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    bonechillDSIlHandM50EventHandler(akTriggerRef)     
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: Actor who entes on the Cave Bonechill Passage. 
; 
; Cave event Hander for the Quest DSilHand_M50WolfAmbush
; (1) Njada(NjadaStonearm) and her Shield Brother (DSilHand_CompanionRookieNord02) 
;     must be moved to the specific locations marked. 
; (2) They must start combat with the Dragonborn.
; This is script is executed when the player entes on the cave bonechill 
; passage on the quest M50 od the mod DSilHand
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSIlHandM50EventHandler(ObjectReference akTriggerRef)
    Debug.Trace(THIS_FILE + " -- OnTriggerEnter: Bonechill Passage")
    ; Only activates if is the Player at M50 Stage 10

    Debug.MessageBox("NjadaStonearm>> <" + NjadaStonearm + ">")
    Debug.MessageBox("DSilHand_CompanionRookieNord02>> <" + DSilHand_CompanionRookieNord02+ ">")  
    Debug.MessageBox("DSilHand_M50WolfAmbush>> <" + DSilHand_M50WolfAmbush+ ">")  
    Debug.MessageBox("DSilHand_M50xMarkerNjadaShieldBrother>> <" + DSilHand_M50xMarkerNjadaShieldBrother+ ">")  
    Debug.MessageBox("DSilHand_M50xMarkerNjada>> <" + DSilHand_M50xMarkerNjada+ ">")           
    Debug.MessageBox("DSilHand_M50WolfAmbush.GetStage()>> <" + DSilHand_M50WolfAmbush.GetStage()+ ">")

    if(DSilHand_M50WolfAmbush != None)
        Debug.MessageBox("DSilHand_M50WolfAmbush>> <" + DSilHand_M50WolfAmbush + ">")
        Debug.MessageBox("DSilHand_M50WolfAmbush.GetStage(): <" + DSilHand_M50WolfAmbush.GetStage() + ">")
        if( akTriggerRef == Game.GetPlayer() && DSilHand_M50WolfAmbush.GetStage() == 10)
            Debug.Trace(THIS_FILE + "-- Player entered on Bonechill Passage")
            ; Only activate ONCE
            if(alreadyActivated == false)
                alreadyActivated = true
                bonechillDSilHandM50Teleport()
            endif
            bonechillDSilHandM50ForceCombat()
        endif
    else 
        Debug.MessageBox(THIS_FILE + "**ERROR** DSilHand_M50WolfAmbush is NULL or not initialized!!" )
    endif 
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function teleports NjadaStonearm and DSilHand_CompanionRookieNord02
; to the XMarker Locations.  Must run only once.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50Teleport()
    Debug.Trace(THIS_FILE + " -- run function: bonechillDSilHandM50Teleport()")
    ; Update Quest Stages
    DSilHand_M50WolfAmbush.SetObjectiveCompleted(10)
    DSilHand_M50WolfAmbush.SetStage(20)
    DSilHand_M50WolfAmbush.SetObjectiveDisplayed(20)
    ; Njada 
    NjadaStonearm.MoveTo(DSilHand_M50xMarkerNjada)
    NjadaStonearm.SetPosition(DSilHand_M50xMarkerNjada.GetPositionX(), DSilHand_M50xMarkerNjada.GetPositionY(), DSilHand_M50xMarkerNjada.GetPositionZ())
    ; Njada Shield Brother    
    DSilHand_CompanionRookieNord02.MoveTo(DSilHand_M50xMarkerNjadaShieldBrother)
    DSilHand_CompanionRookieNord02.SetPosition(DSilHand_M50xMarkerNjadaShieldBrother.GetPositionX(), DSilHand_M50xMarkerNjadaShieldBrother.GetPositionY(), DSilHand_M50xMarkerNjadaShieldBrother.GetPositionZ())
EndFunction 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: void
; 
; This function forces the combat between NjadaStonearm and
; DSilHand_CompanionRookieNord02 with Dragonborn. Will run each time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function bonechillDSilHandM50ForceCombat()
    Debug.Trace(THIS_FILE + " -- run function: bonechillDSilHandM50ForceCombat()")
    DSilHand_CompanionRookieNord02.StartCombat(Game.GetPlayer())
    NjadaStonearm.StartCombat(Game.GetPlayer())
EndFunction 


Alias Property CaveTrigger  Auto  


