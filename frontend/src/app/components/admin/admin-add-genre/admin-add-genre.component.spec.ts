import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminAddGenreComponent } from './admin-add-genre.component';

describe('AdminAddGenreComponent', () => {
  let component: AdminAddGenreComponent;
  let fixture: ComponentFixture<AdminAddGenreComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [AdminAddGenreComponent]
    });
    fixture = TestBed.createComponent(AdminAddGenreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
