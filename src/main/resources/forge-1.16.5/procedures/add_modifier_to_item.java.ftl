<#include "mcitems.ftl">
<#assign attr = "net.minecraft.entity.ai.attributes.Attributes." + field$attribute>
${mappedMCItemToItemStackCode(input$item, 1)}.addAttributeModifier(${attr}, new AttributeModifier(${attr}.getAttributeName(), ${input$value}, AttributeModifier.Operation.${field$operation}), EquipmentSlotType.${field$slot});