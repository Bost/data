import {Component} from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Stadtteilkarte';

  isInFullscreen = false;

  get fullscreenEnabled(): boolean {
    return document.fullscreenEnabled;
  }

  get showCloseIcon(): boolean {
    return this.isInFullscreen && !!document.fullscreenElement;
  }

  async toggleFullscreen(): Promise<void> {
    this.isInFullscreen = !this.isInFullscreen;

    if (this.isInFullscreen) {
      await this.requestFullscreen(document.getElementById('fullscreen-content') || undefined);
    } else {
      await this.exitFullscreen();
    }
  }

  async requestFullscreen(element?: HTMLElement): Promise<void> {
    if (element) {
      await element.requestFullscreen();
    }
  }

  async exitFullscreen(): Promise<void> {
    if (document.fullscreenEnabled) {
      await document.exitFullscreen();
    }
  }
}
