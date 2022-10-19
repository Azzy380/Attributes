<#-- @formatter:off -->
/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;

import java.util.Map;


@Mod.EventBusSubscriber (bus = Mod.EventBusSubscriber.Bus.MOD) public class ${JavaModName}Attributes {
    //public static final DeferredRegister<Attribute>REGISTRY = DeferredRegister.create(ForgeRegistries.ATTRIBUTES, "${modid}");

    public final static List <Supplier<Attribute>> attributes = new ArrayList<>();

    <#list attributes as attribute>
    public static final Attribute ${attribute.getModElement().getRegistryNameUpper()} = new RangedAttribute("attribute.${modid}.${attribute.getModElement().getRegistryName()}", ${attribute.defaultValue}, ${attribute.minValue}, ${attribute.maxValue}).setShouldWatch(true);
    </#list>

   @SubscribeEvent
   	public static void register(RegistryEvent.Register<Attribute> event) {
   	<#list attributes as attribute>
   		attributes.add(() -> ${attribute.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${attribute.getModElement().getRegistryName().toLowerCase()}"));
   	 </#list>
   		event.getRegistry().registerAll(attributes.stream().map(Supplier::get).toArray(Attribute[]::new));
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

}
<#-- @formatter:on -->