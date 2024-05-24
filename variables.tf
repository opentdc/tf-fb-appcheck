# Copyright [2024] [Bruno Kaiser]

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0
# SPDX-License-Identifier: Apache-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# App Check documentation:
# - Terraform configuration: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_service_config
# - Firebase App Check: https://firebase.google.com/docs/app-check

# This module configures App Check for the following Firebase Services: Firestore, Storage, Authentication

variable "project_id" {
  description = "The Firebase project ID."
  type        = string
}

# The enforcement mode of the Firebase App Check service.
variable "enforcement_mode" {
  description = "The enforcement mode of the Firebase App Check service."
  type        = string
  # Allowed values: 
  #    ENFORCED: App Check is enforced for this service. THe service will reject any request that attempts to access the project resources if
  #              it does not have a valid App Check token attached.
  #    UNENFORCED: not enforced for the service. The service is not protected by App Check, but other protections still apply (e.g. User Authorization). 
  #           Additionally, App Check metrics are collected to decide when to turn on enforcement.
  #    OFF (unset): App Check is not enforced nor metrics collected. Some protections still apply (e.g. User Authorization)
  default     = "UNENFORCED"
}