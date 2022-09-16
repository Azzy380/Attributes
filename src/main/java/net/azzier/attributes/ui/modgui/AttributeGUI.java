package net.azzier.attributes.ui.modgui;

import net.azzier.attributes.element.types.Attribute;
import net.azzier.attributes.ui.modgui.parts.JEntries;
import net.mcreator.ui.MCreator;
import net.mcreator.ui.component.util.PanelUtils;
import net.mcreator.ui.help.HelpUtils;
import net.mcreator.ui.init.L10N;
import net.mcreator.ui.modgui.ModElementGUI;
import net.mcreator.ui.validation.AggregatedValidationResult;
import net.mcreator.workspace.elements.ModElement;

import javax.swing.*;
import java.awt.*;

/**
 * GUI for creating new {@link net.azzier.attributes.element.types.Attribute}
 */
public class AttributeGUI extends ModElementGUI<Attribute> {
    /**
     * Default value set in GUI
     */
    private final JSpinner defaultValue;

    /**
     * Minimal value set in GUI
     */
    private final JSpinner minValue;

    /**
     * Maximal value set in GUI
     */
    private final JSpinner maxValue;

    /**
     * List of entites added in GUI
     */
    private final JEntries entities;

    public AttributeGUI(MCreator mcreator, ModElement element, boolean editingMode) {
        super(mcreator, element, editingMode);

        this.defaultValue = new JSpinner(new SpinnerNumberModel(0.0, -2000000000.0, 2000000000.0, 1.0));
        this.minValue = new JSpinner(new SpinnerNumberModel(0.0, -2000000000.0, 2000000000.0, 1.0));
        this.maxValue = new JSpinner(new SpinnerNumberModel(0.0, -2000000000.0, 2000000000.0, 1.0));
        this.entities = new JEntries(this.mcreator, this);

        this.initGUI();
        super.finalizeGUI();
    }

    /**
     * Initalizes GUI
     */
    protected void initGUI() {

        JPanel pane1 = new JPanel(new BorderLayout());
        pane1.setOpaque(false);
        JPanel pane2 = new JPanel(new BorderLayout());
        pane2.setOpaque(false);
        JPanel selp = new JPanel(new GridLayout(13, 2, 100, 2));
        selp.setOpaque(false);

        selp.add(HelpUtils.wrapWithHelpButton(this.withEntry("attribute/defaultValue"), L10N.label("elementgui.attribute.defaultValue", new Object[0])));
        selp.add(this.defaultValue);
        selp.add(HelpUtils.wrapWithHelpButton(this.withEntry("attribute/minValue"), L10N.label("elementgui.attribute.minValue", new Object[0])));
        selp.add(this.minValue);
        selp.add(HelpUtils.wrapWithHelpButton(this.withEntry("attribute/maxValue"), L10N.label("elementgui.attribute.maxValue", new Object[0])));
        selp.add(this.maxValue);
        pane1.add(PanelUtils.totalCenterInPanel(selp));

        pane2.add(this.entities);

        this.addPage(L10N.t("elementgui.attribute.page.new", new Object[0]), pane1);
        this.addPage(L10N.t("elementgui.attribute.page.entities", new Object[0]), pane2);
    }

    public void reloadDataLists() {
        super.reloadDataLists();
    }

    /**
     * Gets values from {@link net.azzier.attributes.element.types.Attribute} and puts them in correct fields in GUI
     * @param attribute Attribute which's GUI is being open
     */
    public void openInEditingMode(Attribute attribute) {
        this.defaultValue.setValue(attribute.defaultValue);
        this.minValue.setValue(attribute.minValue);
        this.maxValue.setValue(attribute.maxValue);
        this.entities.setEntities(attribute.entities);
    }

    /**
     * Gets values from GUI and returns as a new {@link net.azzier.attributes.element.types.Attribute}
     * @return New Attribute
     */
    public Attribute getElementFromGUI() {
        Attribute attribute = new Attribute(this.modElement);

        attribute.defaultValue = (Double) this.defaultValue.getValue();
        attribute.minValue = (Double) this.minValue.getValue();
        attribute.maxValue = (Double) this.maxValue.getValue();
        attribute.entities = this.entities.getEntities();

        return attribute;
    }

    protected AggregatedValidationResult validatePage(int page) {
        return new AggregatedValidationResult.PASS();
    }
}