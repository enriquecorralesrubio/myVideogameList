import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminEditGameComponent } from './admin-edit-game.component';

describe('AdminEditFormComponent', () => {
  let component: AdminEditGameComponent;
  let fixture: ComponentFixture<AdminEditGameComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [AdminEditGameComponent]
    });
    fixture = TestBed.createComponent(AdminEditGameComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
