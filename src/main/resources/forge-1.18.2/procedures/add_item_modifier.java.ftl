<#include "attributes.ftl">
<#include "mcitems.ftl">
<#assign attr = getAttribute(field$attribute)>
<#assign which = getSource(field$attribute)>
<#if which == "custom" || which == "forge">
    if((entity instanceof LivingEntity _livEnt ? _livEnt.getMainHandItem() : ItemStack.EMPTY) != ItemStack.EMPTY)
    {
        CompoundTag _tag = (${mappedMCItemToItemStackCode(input$item, 1)}).getOrCreateTag();
        if (!_tag.contains("AttributeModifiers", 9)) {
            _tag.put("AttributeModifiers", new ListTag());
        }
        ListTag _listtag = _tag.getList("AttributeModifiers", 10);
        CompoundTag _compoundtag = ${input$modifier}.save();
        _compoundtag.putString("AttributeName", ${getAttributeResource(field$attribute)}.getId().toString());
        _compoundtag.putString("Slot", EquipmentSlot.${field$slot}.getName());
        _listtag.add(_compoundtag);
    }
<#else>
    (${mappedMCItemToItemStackCode(input$item, 1)}).addAttributeModifier(${attr}, ${input$modifier}, EquipmentSlot.${field$slot});
</#if>
