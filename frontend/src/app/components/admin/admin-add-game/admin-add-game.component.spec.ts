import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminAddGameComponent } from './admin-add-game.component';

describe('AdminAddFormComponent', () => {
  let component: AdminAddGameComponent;
  let fixture: ComponentFixture<AdminAddGameComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [AdminAddGameComponent]
    });
    fixture = TestBed.createComponent(AdminAddGameComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
