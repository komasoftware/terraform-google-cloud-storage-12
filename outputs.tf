/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "name" {
  description = "Bucket name of the first bucket (for single-use cases)."
  value       = "${element(google_storage_bucket.buckets.*.name, 0)}"
}

output "url" {
  description = "URL of the first bucket (for single-use cases)."
  value       = "${element(google_storage_bucket.buckets.*.url, 0)}"
}

output "names" {
  description = "Map of unprefixed names => bucket names."
  value       = "${zipmap(var.names, google_storage_bucket.buckets.*.name)}"
}

output "urls" {
  description = "Map of unprefixed names => bucket URLs."
  value       = "${zipmap(var.names, google_storage_bucket.buckets.*.url)}"
}
