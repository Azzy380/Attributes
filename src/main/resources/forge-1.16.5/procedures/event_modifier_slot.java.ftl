if(dependencies.get("event") instanceof ItemAttributeModifierEvent && ((ItemAttributeModifierEvent) dependencies.get("event")).getSlotType() == EquipmentSlotType.${field$slot}) {
ItemAttributeModifierEvent _event = (ItemAttributeModifierEvent) dependencies.get("event");
    ${statement$procedures}
}