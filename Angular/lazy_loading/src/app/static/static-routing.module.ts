import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutUsComponent } from './about-us/about-us.component';
import { TermsAndConditionsComponent } from './terms-and-conditions/terms-and-conditions.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';

const statciRoutes: Routes = [
  {path: 'about-us', component:AboutUsComponent},
  {path: 'terms-and-conditions', component:TermsAndConditionsComponent},
  {path: 'privacy-policy', component:PrivacyPolicyComponent}
];

@NgModule({
  imports: [RouterModule.forChild(statciRoutes)],
  exports: [RouterModule]
})
export class StaticRoutingModule { }
