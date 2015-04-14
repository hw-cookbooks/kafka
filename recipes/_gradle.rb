#
# Cookbook Name:: kafka
# Recipe:: _gradle
#
# Copyright 2015, Heavy Water Ops, LLC
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
::Chef::Recipe.send(:include, ChefKafka::Helpers)

include_recipe "ark"

ark "gradle" do
  url node[:gradle][:url]
  home_dir node[:gradle][:home_dir]
  version node[:gradle][:version]
  append_env_path true
  action :install
end
