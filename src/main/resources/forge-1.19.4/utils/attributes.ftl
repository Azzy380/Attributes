<#function getAttribute attribute="">
    <#assign attr = "">
    <#if attribute.startsWith("CUSTOM:")>
        <#assign attr = JavaModName + "Attributes." + attribute?replace("CUSTOM:", "")?upper_case + ".get()">
    <#elseif field$attribute.startsWith("FORGE:")>
        <#assign attr = "ForgeMod." + attribute?replace("FORGE:", "") + ".get()">
    <#else>
        <#assign attr = "net.minecraft.world.entity.ai.attributes.Attributes." + attribute>
    </#if>
    <#return attr>
</#function>