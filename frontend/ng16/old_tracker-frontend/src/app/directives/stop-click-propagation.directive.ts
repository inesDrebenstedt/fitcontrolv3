import { Directive, HostListener } from '@angular/core';

@Directive({
  selector: '[stop-click-propagation]',

})
export class StopClickPropagationDirective {

  constructor() { }

  @HostListener("click", ["$event"])
  public onClick(event: any): void
  {
    console.log('----------- stopclickpropagation called')
    event.stopPropagation();
  }

}
