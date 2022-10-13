<#include "mcitems.ftl">
if(event instanceof ItemAttributeModifierEvent _event && _event.getSlotType() == EquipmentSlot.${field$slot}) {
    ${statement$procedures}
}