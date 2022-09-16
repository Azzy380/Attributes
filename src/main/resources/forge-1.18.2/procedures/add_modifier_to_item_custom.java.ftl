<#include "mcitems.ftl">
<#assign attr = JavaModName + "Attributes." + field$attribute?upper_case + ".get()">
${mappedMCItemToItemStackCode(input$item, 1)}.addAttributeModifier(${attr}, new AttributeModifier(${attr}.getDescriptionId(), ${input$value}, AttributeModifier.Operation.${field$operation}), EquipmentSlot.${field$slot});