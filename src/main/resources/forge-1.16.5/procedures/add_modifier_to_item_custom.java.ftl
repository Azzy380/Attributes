<#include "mcitems.ftl">
<#assign attr = JavaModName + "Attributes." + field$attribute?upper_case>
${mappedMCItemToItemStackCode(input$item, 1)}.addAttributeModifier(${attr}, new AttributeModifier(${attr}.getAttributeName(), ${input$value}, AttributeModifier.Operation.${field$operation}), EquipmentSlotType.${field$slot});