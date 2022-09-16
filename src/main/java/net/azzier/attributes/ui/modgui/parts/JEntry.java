package net.azzier.attributes.ui.modgui.parts;

import net.mcreator.element.parts.EntityEntry;
import net.mcreator.minecraft.ElementUtil;
import net.mcreator.ui.MCreator;
import net.mcreator.ui.component.SearchableComboBox;
import net.mcreator.ui.component.util.PanelUtils;
import net.mcreator.ui.help.IHelpContext;
import net.mcreator.ui.init.L10N;
import net.mcreator.ui.init.UIRES;
import net.mcreator.workspace.Workspace;

import javax.swing.*;
import java.awt.*;
import java.util.List;

/**
 * Single entity entry in {@link net.azzier.attributes.ui.modgui.parts.JEntries}
 */
public class JEntry extends JPanel {
    private final JComboBox<String> entityType = new SearchableComboBox();
    private final Workspace workspace;

    public JEntry(MCreator mcreator, IHelpContext gui, JPanel parent, List<JEntry> entryList) {
        super(new FlowLayout(0));
        this.workspace = mcreator.getWorkspace();
        JComponent container = PanelUtils.expandHorizontally(this);
        parent.add(container);
        entryList.add(this);

        ElementUtil.loadAllEntities(this.workspace).forEach((e) -> {
            this.entityType.addItem(e.getName());
        });
        this.add(L10N.label("dialog.spawn_list_entry.entity", new Object[0]));
        this.add(this.entityType);

        JButton remove = new JButton(UIRES.get("16px.clear"));
        remove.setText(L10N.t("dialog.entity_list_entry.remove_entity", new Object[0]));
        remove.addActionListener((e) -> {
            parent.remove(container);
            entryList.remove(this);
            parent.revalidate();
            parent.repaint();
        });
        this.add(remove);
        parent.revalidate();
        parent.repaint();

    }

    public EntityEntry getEntity() {
        EntityEntry e = new EntityEntry(this.workspace, this.entityType.getSelectedItem().toString());
        return e;
    }

    public void setEntity(EntityEntry e) {
        this.entityType.setSelectedItem(e.getUnmappedValue());
    }
}