package net.azzier.attributes.element.types;

import net.mcreator.element.GeneratableElement;
import net.mcreator.element.parts.EntityEntry;
import net.mcreator.minecraft.MinecraftImageGenerator;
import net.mcreator.workspace.elements.ModElement;

import java.awt.image.BufferedImage;
import java.util.List;

/**
 * Class stores informations about created mod element, is saved in Workspace
 */
public class Attribute extends GeneratableElement {
    /**
     * Description of an attribute (Example: Max Health)
     */

    public String description;

    /**
     * Minimal value for new minecraft attribute
     */
    public Double minValue;
    /**
     * Maximal value for new minecraft attribute
     */
    public Double maxValue;
    /**
     * Default value for new minecraft attribute
     */
    public Double defaultValue;
    /**
     * If attribute base value should stay after death
     */
    public Boolean isPersistent;
    /**
     * List of entities that will have this attribute added
     */
    public List<EntityEntry> entities;

    private Attribute() {
        this((ModElement) null);
    }

    public Attribute(ModElement element) {
        super(element);
    }

    public BufferedImage generateModElementPicture() {
        return MinecraftImageGenerator.Preview.generateKeybindPreviewPicture("Attribute" + this.getModElement().getName());
    }
}

