Scriptname DSilHand_AliasGallowsTriggerScript extends ReferenceAlias  
{DSilHand_AliasGallowsTriggerScript Script for M50 Quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DSilHand_M50WolfAmbush  Auto  
{DSilHand_M50WolfAmbush reference}

String THIS_FILE = "(DSilHand_AliasGallowsTriggerScript.psc) "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event OnTriggerEnter(ObjectReference akTriggerRef)
    if(DSilHand_M50WolfAmbush != None)
        if(DSilHand_M50WolfAmbush.GetStage() == 30)
            DSilHand_M50WolfAmbush.SetObjectiveCompleted(30)
            DSilHand_M50WolfAmbush.SetStage(40)
            Debug.Trace(THIS_FILE + " -- QUEST M50 COMPLETED!!")
        endif
    else
        Debug.Trace(THIS_FILE + " **ERROR** DSilHand_M50WolfAmbush Quest Reference is NULL");
    endif
EndEvent



