#
# Cookbook Name:: openvz
# Recipe:: ohai
#
# Copyright 2013, TYPO3 Association
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ohai "reload_openvz" do
  plugin "openvz-hostdetection"
  action :nothing
end

template "#{node[:ohai][:plugin_path]}/openvz-hostdetection.rb" do
  source "ohai/openvz-hostdetection.rb"
  notifies :reload, "ohai[reload_openvz]"
end

include_recipe "ohai::default"