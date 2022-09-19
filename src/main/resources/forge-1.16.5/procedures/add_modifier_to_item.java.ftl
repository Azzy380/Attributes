<#include "mcitems.ftl">
<#assign attr = "">
<#if field$attribute.startsWith("CUSTOM:")>
<#assign attr = JavaModName + "Attributes." + field$attribute?replace("CUSTOM:", "")?upper_case + ".get()">
<#else>
<#assign attr = "net.minecraft.entity.ai.attributes.Attributes." + field$attribute>
</#if>
${mappedMCItemToItemStackCode(input$item, 1)}.addAttributeModifier(${attr}, new AttributeModifier(${attr}.getDescriptionId(), ${input$value}, AttributeModifier.Operation.${field$operation}), EquipmentSlot.${field$slot});