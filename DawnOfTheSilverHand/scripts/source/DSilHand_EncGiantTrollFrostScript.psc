Scriptname DSilHand_EncGiantTrollFrostScript extends ObjectReference  
{Functions and event related to the Giant Frost Troll.}

Quest Property DSilvHand_M10SilverHunt  Auto  
{Quest related to the Giant Frost Troll.}

MiscObject Property TrollSkull  Auto  

Actor Property troll  Auto  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Script Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Event OnDeath(Actor akKiller)
;    Debug.MessageBox("akKiller:" + akKiller);
;    Debug.MessageBox("GetStage:" + DSilvHand_M10SilverHunt.GetStage());
;    if(DSilvHand_M10SilverHunt.GetStage() >= 30)
;        Debug.MessageBox("Killed! -> adding troll skull to troll corpuse");
;        troll.AddItem(TrollSkull)
;    Endif
;Endevent 

; Event received when an item is removed from this object's container.
; akBaseItem: The base object for the item that was removed from this container.
; aiItemCount: The number of items removed from this container.
; akItemReference: The specific reference removed from the container, if any. Will be None if a non-persistant object is moved to a different container; a persistant or not item used in crafting, (most likely) when consumed. If a non-persistant item is dropped from inventory into the world the generated reference is received.
; akDestContainer: The container that the object(s) went to. If None, then the object was dropped into the world, used in crafting or consumed.
Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    Debug.Trace("-- OnItemRemoved: akBaseItem:" + akBaseItem + ", aiItemCount:" + aiItemCount + ", akItemReference:" + akItemReference + ", akDestContainer:" + akDestContainer) 
    ;Debug.MessageBox("akBaseItem:" + akBaseItem)
    ;Debug.MessageBox("akItemReference:" + akItemReference)
    if(akBaseItem == TrollSkull)
        ;Debug.MessageBox("akDestContainer:" + akDestContainer)
        ;Debug.MessageBox(" Game.GetPlayer():" +  Game.GetPlayer())
        if(akDestContainer == Game.GetPlayer())
            DSilvHand_M10SilverHunt.SetObjectiveCompleted(30)
            DSilvHand_M10SilverHunt.SetObjectiveDisplayed(40)
            DSilvHand_M10SilverHunt.SetStage(40)
        endif
    endif
Endevent



