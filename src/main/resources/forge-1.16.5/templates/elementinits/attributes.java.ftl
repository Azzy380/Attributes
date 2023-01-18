<#-- @formatter:off -->
/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;

import java.util.Map;


@Mod.EventBusSubscriber (bus = Mod.EventBusSubscriber.Bus.MOD) public class ${JavaModName}Attributes {
    <#list attributes as attribute>
    public static final Attribute ${attribute.getModElement().getRegistryNameUpper()} = new RangedAttribute("attribute.${modid}.${attribute.getModElement().getRegistryName()}", ${attribute.defaultValue}, ${attribute.minValue}, ${attribute.maxValue}).setShouldWatch(true);
    </#list>
   @SubscribeEvent
   	public static void register(RegistryEvent.Register<Attribute> event) {
   	<#list attributes as attribute>
   	    ${attribute.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${attribute.getModElement().getRegistryName().toLowerCase()}");
   		event.getRegistry().register(${attribute.getModElement().getRegistryNameUpper()});
   	 </#list>
   	}
   @SubscribeEvent
   public static void addAttributes(EntityAttributeModificationEvent event) {
       <#list attributes as attribute>
           <#list attribute.entities as entity>
               <#assign e = generator.map(entity.getUnmappedValue(), "entities", 1)!"null">
               <#if e != "null">
               event.add(${e}, ${attribute.getModElement().getRegistryNameUpper()});
               </#if>
           </#list>

       </#list>
   }
   <#if attributes?filter(a -> a.isPersistent && a.entities?seq_contains("PlayerEntity"))?size != 0>
       @Mod.EventBusSubscriber
           private static class Utils {
               @SubscribeEvent
               public static void persistAttributes(PlayerEvent.Clone event) {
                   PlayerEntity oldP = event.getOriginal();
                   PlayerEntity newP = (PlayerEntity)event.getEntity();
                   <#list attributes?filter(a -> a.isPersistent = true && a.entities?seq_contains("PlayerEntity")) as attribute>
                   newP.getAttribute(${attribute.getModElement().getRegistryNameUpper()}).setBaseValue(oldP.getAttribute(${attribute.getModElement().getRegistryNameUpper()}).getBaseValue());
                   </#list>
               }

       }
   </#if>
}
<#-- @formatter:on -->