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

terraform {
  required_version = "~> 1.8"
}

resource "google_project_service" "appcheck" {
  project = var.project_id
  service = "firebaseappcheck.googleapis.com"
  disable_on_destroy = false
}

# Create a Firebase App Check service configuration for Firebase Authentication.
resource "google_firebase_app_check_service_config" "default" {
  project = var.project_id
  service_id = "identitytoolkit.googleapis.com"
  enforcement_mode = var.enforcement_mode

  depends_on = [google_project_service.appcheck]
}

# Create a Firebase App Check service configuration for the Firestore service.
resource "google_firebase_app_check_service_config" "default" {
  project = var.project_id
  service_id = "firestore.googleapis.com"
  enforcement_mode = var.enforcement_mode

  depends_on = [google_project_service.appcheck]
}

# Create a Firebase App Check service configuration for the Firebase Storage service.
resource "google_firebase_app_check_service_config" "default" {
  project = var.project_id
  service_id = "firebasestorage.googleapis.com"
  enforcement_mode = var.enforcement_mode

  depends_on = [google_project_service.appcheck]
}

