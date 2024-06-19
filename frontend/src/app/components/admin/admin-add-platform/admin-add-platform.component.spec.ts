import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminAddPlatformComponent } from './admin-add-platform.component';

describe('AdminAddPlatformComponent', () => {
  let component: AdminAddPlatformComponent;
  let fixture: ComponentFixture<AdminAddPlatformComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [AdminAddPlatformComponent]
    });
    fixture = TestBed.createComponent(AdminAddPlatformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
