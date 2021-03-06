# Copyright 2018 Google Inc.
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

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'spec_helper'

# TODO(alexstephen): Reformat tests to use nested describe blocks
# TODO(alexstephen): Add title == name tests
# Test Matrix:
#
# +--------------------------------------------------------+
# | Action  | Exists | Changes | Success | Result          |
# +--------------------------------------------------------+
# | create  | Y      | Y       | Y       | Edit            |
# | create  | Y      | Y       | N       | Fail            |
# | create  | Y      | N       | Y       | Fetch (no-op)   |
# | create  | Y      | N       | N       | Fail            |
# | create  | N      | Y       | Y       | Create          |
# | create  | N      | Y       | N       | Fail            |
# +--------------------------------------------------------+
# | delete  | Y      | Y       | Y       | Delete          |
# | delete  | Y      | Y       | N       | Fail            |
# | delete  | N      | Y       | Y       | Fail (no delete)|
# | delete  | N      | Y       | N       | Fail            |
# +--------------------------------------------------------+
# TODO(alexstephen): Add tests for manage
# TODO(alexstephen): Add tests for modify
context 'giam_service_account' do
  context 'ensure == present' do
    context 'resource exists' do
      # Ensure present: resource exists, no change
      context 'no changes == no action' do
        # Ensure present: resource exists, no change, no name
        context 'title == name' do
          # Ensure present: resource exists, no change, no name, pass
          context 'title == name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1, name: 'title0'
              expect_network_get_success 2, name: 'title1'
              expect_network_get_success 3, name: 'title2'
            end

            let(:runner) do
              # This path ensures that the current cookbook is
              # loaded for testing.
              # This path will load all other cookbooks in the
              # parent directory.
              # Under most circumstances, this will include the
              # real google-gauth cookbook.
              parent_dir = File.join(File.dirname(__FILE__), '..', '..')
              cookbook_paths = [parent_dir]

              # If there's no real version of the google-gauth ,
              # add in the mocked version so that the tests do not fail.
              # Since cookbooks can have any name, we assume that
              # any directory with the word auth is the google-gauth cookbook.
              cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

              ChefSpec::SoloRunner.new(
                step_into: 'giam_service_account',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              apply_recipe(
                <<-MANIFEST
                  giam_service_account 'title0' do
                    action :create
                    display_name 'test display_name#0 data'
                    project 'test project#0 data'
                    credential 'mycred'
                  end

                  giam_service_account 'title1' do
                    action :create
                    display_name 'test display_name#1 data'
                    project 'test project#1 data'
                    credential 'mycred'
                  end

                  giam_service_account 'title2' do
                    action :create
                    display_name 'test display_name#2 data'
                    project 'test project#2 data'
                    credential 'mycred'
                  end
                MANIFEST
              ) do |recipe_name|
                runner.converge(recipe_name) do
                  cred = Google::CredentialResourceMock.new('mycred',
                                                            runner.run_context)
                  runner.resource_collection.insert(cred)
                end
              end
            end

            context 'giam_service_account[title0]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title0')
              end

              it { is_expected.to have_attributes(sa_label: 'title0') }

              it { is_expected.to have_attributes(display_name: 'test display_name#0 data') }
            end

            context 'giam_service_account[title1]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title1')
              end

              it { is_expected.to have_attributes(sa_label: 'title1') }

              it { is_expected.to have_attributes(display_name: 'test display_name#1 data') }
            end

            context 'giam_service_account[title2]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title2')
              end

              it { is_expected.to have_attributes(sa_label: 'title2') }

              it { is_expected.to have_attributes(display_name: 'test display_name#2 data') }
            end
          end

          # Ensure present: resource exists, no change, no name, fail
          context 'title == name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, no change, has name
        context 'title != name' do
          # Ensure present: resource exists, no change, has name, pass
          context 'title != name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1
              expect_network_get_success 2
              expect_network_get_success 3
            end

            let(:runner) do
              # This path ensures that the current cookbook is
              # loaded for testing.
              # This path will load all other cookbooks in the
              # parent directory.
              # Under most circumstances, this will include the
              # real google-gauth cookbook.
              parent_dir = File.join(File.dirname(__FILE__), '..', '..')
              cookbook_paths = [parent_dir]

              # If there's no real version of the google-gauth ,
              # add in the mocked version so that the tests do not fail.
              # Since cookbooks can have any name, we assume that
              # any directory with the word auth is the google-gauth cookbook.
              cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

              ChefSpec::SoloRunner.new(
                step_into: 'giam_service_account',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              apply_recipe(
                <<-MANIFEST
                  giam_service_account 'title0' do
                    action :create
                    display_name 'test display_name#0 data'
                    sa_label 'test name#0 data'
                    project 'test project#0 data'
                    credential 'mycred'
                  end

                  giam_service_account 'title1' do
                    action :create
                    display_name 'test display_name#1 data'
                    sa_label 'test name#1 data'
                    project 'test project#1 data'
                    credential 'mycred'
                  end

                  giam_service_account 'title2' do
                    action :create
                    display_name 'test display_name#2 data'
                    sa_label 'test name#2 data'
                    project 'test project#2 data'
                    credential 'mycred'
                  end
                MANIFEST
              ) do |recipe_name|
                runner.converge(recipe_name) do
                  cred = Google::CredentialResourceMock.new('mycred',
                                                            runner.run_context)
                  runner.resource_collection.insert(cred)
                end
              end
            end

            context 'giam_service_account[title0]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title0')
              end

              it { is_expected.to have_attributes(sa_label: 'test name#0 data') }

              it { is_expected.to have_attributes(display_name: 'test display_name#0 data') }
            end

            context 'giam_service_account[title1]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title1')
              end

              it { is_expected.to have_attributes(sa_label: 'test name#1 data') }

              it { is_expected.to have_attributes(display_name: 'test display_name#1 data') }
            end

            context 'giam_service_account[title2]' do
              subject do
                chef_run.find_resource(:giam_service_account, 'title2')
              end

              it { is_expected.to have_attributes(sa_label: 'test name#2 data') }

              it { is_expected.to have_attributes(display_name: 'test display_name#2 data') }
            end
          end

          # Ensure present: resource exists, no change, has name, fail
          context 'title != name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end

      # Ensure present: resource exists, changes
      context 'changes == action' do
        # Ensure present: resource exists, changes, no name
        context 'title == name' do
          # Ensure present: resource exists, changes, no name, pass
          context 'title == name (pass)' do
            # TODO(alexstephen): Implement new test format.
          end

          # Ensure present: resource exists, changes, no name, fail
          context 'title == name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, changes, has name
        context 'title != name' do
          # Ensure present: resource exists, changes, has name, pass
          context 'title != name (pass)' do
            # TODO(alexstephen): Implement new test format
          end

          # Ensure present: resource exists, changes, has name, fail
          context 'title != name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end
    end

    context 'resource missing' do
      # Ensure present: resource missing, ignore, no name
      context 'title == name' do
        # Ensure present: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_failed 1, name: 'title0'
            expect_network_create \
              1,
              {
                'name' => 'title0',
                'displayName' => 'test display_name#0 data'
              },
              name: 'title0'
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :create
                  display_name 'test display_name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:giam_service_account,
                                       'title0')
          end
          it { is_expected.to have_attributes(sa_label: 'title0') }

          it { is_expected.to have_attributes(display_name: 'test display_name#0 data') }
        end

        # Ensure present: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure present: resource missing, ignore, has name
      context 'title != name' do
        # Ensure present: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_failed 1
            expect_network_create \
              1,
              'name' => 'test name#0 data',
              'displayName' => 'test display_name#0 data'
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :create
                  display_name 'test display_name#0 data'
                  sa_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:giam_service_account,
                                       'title0')
          end
          it { is_expected.to have_attributes(sa_label: 'test name#0 data') }

          it { is_expected.to have_attributes(display_name: 'test display_name#0 data') }
        end

        # Ensure present: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  context 'ensure == absent' do
    context 'resource missing' do
      # Ensure absent: resource missing, ignore, no name
      context 'title == name' do
        # Ensure absent: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_failed 1, name: 'title0'
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :delete
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end
        end

        # Ensure absent: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure absent: resource missing, ignore, has name
      context 'title != name' do
        # Ensure absent: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_failed 1
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :delete
                  sa_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end
        end

        # Ensure absent: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end

    context 'resource exists' do
      # Ensure absent: resource exists, ignore, no name
      context 'title == name' do
        # Ensure absent: resource exists, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_success 1, name: 'title0'
            expect_network_delete 1, 'title0'
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :delete
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:giam_service_account,
                                       'title0')
          end
        end

        # Ensure absent: resource exists, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
      # Ensure absent: resource exists, ignore, has name
      context 'title != name' do
        # Ensure absent: resource exists, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_success 1
            expect_network_delete 1
          end

          let(:runner) do
            # This path ensures that the current cookbook is
            # loaded for testing.
            # This path will load all other cookbooks in the
            # parent directory.
            # Under most circumstances, this will include the
            # real google-gauth cookbook.
            parent_dir = File.join(File.dirname(__FILE__), '..', '..')
            cookbook_paths = [parent_dir]

            # If there's no real version of the google-gauth ,
            # add in the mocked version so that the tests do not fail.
            # Since cookbooks can have any name, we assume that
            # any directory with the word auth is the google-gauth cookbook.
            cookbook_paths << File.join(File.dirname(__FILE__), 'cookbooks')

            ChefSpec::SoloRunner.new(
              step_into: 'giam_service_account',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                giam_service_account 'title0' do
                  action :delete
                  sa_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:giam_service_account, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:giam_service_account,
                                       'title0')
          end
        end

        # Ensure absent: resource exists, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  def expand_variables(template, data, extra_data = {})
    Google::GIAM::ServiceAccount
      .action_class.expand_variables(template, data, extra_data)
  end

  def encode_request(resource)
    Google::GIAM::ServiceAccount
      .action_class.encode_request(resource)
  end

  def expect_network_get_success(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result("success#{id}~#{id_data}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! GET #{self_link(uri_data(id).merge(data))}"
    expect(Google::Iam::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET #{args}"
      request
    end
  end

  def http_success(body)
    response = Net::HTTPOK.new(1.0, 200, 'OK')
    response.body = body
    response.instance_variable_set(:@read, true)
    response
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    debug_network "!! #{self_link(uri_data(id).merge(data))}"
    expect(Google::Iam::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET [failed] #{args}"
      request
    end
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def expect_network_create(id, expected_body, data = {})
    merged_uri = uri_data(id).merge(data)
    body = {}.to_json

    # Encode the object to conform with the API
    expected_body = encode_request(expected_body)
    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! POST #{collection(merged_uri)}"
    expect(Google::Iam::Network::Post).to receive(:new)
      .with(collection(merged_uri), instance_of(Google::FakeAuthorization),
            'application/json', expected_body.to_json) do |args|
      debug_network ">> POST #{args} = body(#{body})"
      request
    end
  end

  def expect_network_delete(id, name = nil, data = {})
    delete_data = uri_data(id).merge(data)
    delete_data[:name] = name unless name.nil?
    body = {}.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! DELETE #{self_link(delete_data)}"
    expect(Google::Iam::Network::Delete).to receive(:new)
      .with(self_link(delete_data),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> DELETE #{args}"
      request
    end
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'giam_service_account', file)
    debug("Loading result file: #{results}")
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def debug(message)
    puts(message) if ENV['RSPEC_DEBUG']
  end

  def debug_network(message)
    puts("Network #{message}") \
      if ENV['RSPEC_DEBUG'] || ENV['RSPEC_HTTP_VERBOSE']
  end

  def collection(data)
    URI.join(
      'https://iam.googleapis.com/v1/',
      expand_variables(
        'projects/{{project}}/serviceAccounts',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://iam.googleapis.com/v1/',
      expand_variables(
        'projects/{{project}}/serviceAccounts/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: GoogleTests::Constants::SA_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::SA_PROJECT_DATA.size],
      name: GoogleTests::Constants::SA_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::SA_NAME_DATA.size]
    }
  end

  def build_cred
    <<-CRED
    gauth_credential 'mycred' do
      action :serviceaccount
      path '/home'
      scopes [
        'test_path'
      ]
    end
    CRED
  end

  # Creates a test recipe file and runs a block before destroying the file
  def apply_recipe(recipe)
    # Creates a random string name
    recipe_name = "recipe~test~#{(0...8).map { (65 + rand(26)).chr }.join}"
    recipe_loc = File.join(File.dirname(__FILE__), '..', 'recipes',
                           "#{recipe_name}.rb")

    File.open(recipe_loc, 'w') do |file|
      file.write([build_cred, recipe].join("\n"))
    end
    recipe_path = "google-giam::#{recipe_name}"
    begin
      yield recipe_path
    ensure
      File.delete(recipe_loc)
    end
  end
end
