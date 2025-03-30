import { Component } from '@angular/core';

interface SubItem {
  description: string;
  isEditing?: boolean;
}

interface Item {
  title: string;
  subItems: SubItem[];
  expanded?: boolean;
}

@Component({
  selector: 'app-item-accordion',
  templateUrl: './item-accordion.component.html',
  styleUrls: ['./item-accordion.component.scss']
})
export class ItemAccordionComponent {
  items: Item[] = [
    {
      title: 'Item 1',
      subItems: [{ description: 'Sub-item 1.1' }, { description: 'Sub-item 1.2' }],
      expanded: true
    },
    {
      title: 'Item 2',
      subItems: [{ description: 'Sub-item 2.1' }, { description: 'Sub-item 2.2' }],
      expanded: false
    }
  ];

  addSubItem(item: Item) {
    item.subItems.push({ description: 'New Sub-item' });
  }

  deleteItem(item: Item) {
    this.items = this.items.filter(i => i !== item);
  }

  deleteSubItem(item: Item, subItem: SubItem) {
    item.subItems = item.subItems.filter(si => si !== subItem);
  }

  editSubItem(subItem: SubItem) {
    subItem.isEditing = true;
  }

  saveSubItem(subItem: SubItem) {
    subItem.isEditing = false;
  }

  cancelEdit(subItem: SubItem) {
    subItem.isEditing = false;
  }
}
