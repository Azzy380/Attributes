<#include "mcitems.ftl">
<#assign attr = "">
<#if field$attribute.startsWith("FORGE:")>
<#assign attr = "ForgeMod." + field$attribute?replace("FORGE:", "") + ".get()">
<#else>
<#assign attr = "net.minecraft.entity.ai.attributes.Attributes." + field$attribute>
</#if>
${mappedMCItemToItemStackCode(input$item, 1)}.addAttributeModifier(${attr}, new AttributeModifier(${attr}.getAttributeName(), ${input$value}, AttributeModifier.Operation.${field$operation}), EquipmentSlotType.${field$slot});