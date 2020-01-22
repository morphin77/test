require "rails_helper"
RSpec.describe ApiController, :type => :request do
  context 'user_action' do
    it 'check user name avalible' do
      post "/set_user_action_permission", :params => {
        :api => { 
          :user => "bob",
          :action_name => "reboot_server",
          :permission =>"grant"
        }
      } 
      expect(JSON.parse(response.body)).to include("User bob not present")
    end

    it 'check action avalible' do
      post "/set_user_action_permission", :params => {
        :api => { 
          :user => "Mike",
          :action_name => "Погладь кота",
          :permission =>"grant"
        }
      } 
      expect(JSON.parse(response.body)).to include("Action Погладь кота not present")
    end

    it 'check permission avalible' do
      post "/set_user_action_permission", :params => {
        :api => { 
          :user => "Mike",
          :action_name => "reboot_server",
          :permission =>"reboot_server"
        }
      } 
      expect(JSON.parse(response.body)).to include("Permission reboot_server not present")
    end

    it 'works fine' do
      post "/set_user_action_permission", :params => {
        :api => { 
          :user => "Mike",
          :action_name => "reboot_server",
          :permission =>"grant"
        }
      } 
      expect(JSON.parse(response.body)).to include("id")
      expect(JSON.parse(response.body)).to include("user_id")
      expect(JSON.parse(response.body)).to include("action_id")
      expect(JSON.parse(response.body)).to include("action_permission_id")
    end
  end

  context 'role_action' do
    it 'check user name avalible' do
      post "/set_role_action_permission", :params => {
        :api => { 
          :role => "bob",
          :action_name => "reboot_server",
          :permission =>"grant"
        }
      } 
      expect(JSON.parse(response.body)).to include("Role bob not present")
    end

    it 'check action avalible' do
      post "/set_role_action_permission", :params => {
        :api => { 
          :role => "admin",
          :action_name => "Погладь кота",
          :permission =>"grant"
        }
      } 
      expect(JSON.parse(response.body)).to include("Action Погладь кота not present")
    end

    it 'check permission avalible' do
      post "/set_role_action_permission", :params => {
        :api => { 
          :role => "admin",
          :action_name => "reboot_server",
          :permission =>"reboot_server"
        }
      } 
      expect(JSON.parse(response.body)).to include("Permission reboot_server not present")
    end
    
    it 'works fine' do
      post "/set_role_action_permission", :params => {
        :api => { 
          :role => "admin",
          :action_name => "reboot_server",
          :permission =>"grant"
        }
      }
      expect(JSON.parse(response.body)[0]).to include("id")
      expect(JSON.parse(response.body)[0]).to include("user_id")
      expect(JSON.parse(response.body)[0]).to include("action_id")
      expect(JSON.parse(response.body)[0]).to include("action_permission_id")
    end
  end

  context 'user_resource' do
    it 'check user name avalible' do
      post "/set_user_resource_permission", :params => {
        :api => { 
          :user => "bob",
          :resource_name => "file A",
          :permission =>"read"
        }
      } 
      expect(JSON.parse(response.body)).to include("User bob not present")
    end

    it 'check resource avalible' do
      post "/set_user_resource_permission", :params => {
        :api => { 
          :user => "Mike",
          :resource_name => "Погладь кота",
          :permission =>"read"
        }
      } 
      expect(JSON.parse(response.body)).to include("resource Погладь кота not present")
    end

    it 'check permission avalible' do
      post "/set_user_resource_permission", :params => {
        :api => { 
          :user => "Mike",
          :resource_name => "file A",
          :permission =>"ping"
        }
      } 
      expect(JSON.parse(response.body)).to include("Permission ping not present")
    end

    it 'works fine' do
      post "/set_user_resource_permission", :params => {
        :api => { 
          :user => "Mike",
          :resource_name => "file A",
          :permission =>"read"
        }
      } 
      expect(JSON.parse(response.body)).to include("id")
      expect(JSON.parse(response.body)).to include("user_id")
      expect(JSON.parse(response.body)).to include("resource_id")
      expect(JSON.parse(response.body)).to include("resource_permission_id")
    end
  end

  context 'role_resource' do
    it 'check user name avalible' do
      post "/set_role_resource_permission", :params => {
        :api => { 
          :role => "bob",
          :resource_name => "file A",
          :permission =>"read"
        }
      } 
      expect(JSON.parse(response.body)).to include("Role bob not present")
    end

    it 'check resource avalible' do
      post "/set_role_resource_permission", :params => {
        :api => { 
          :role => "admin",
          :resource_name => "Погладь кота",
          :permission =>"read"
        }
      } 
      expect(JSON.parse(response.body)).to include("resource Погладь кота not present")
    end

    it 'check permission avalible' do
      post "/set_role_resource_permission", :params => {
        :api => { 
          :role => "admin",
          :resource_name => "file A",
          :permission =>"ping"
        }
      } 
      expect(JSON.parse(response.body)).to include("Permission ping not present")
    end
    
    it 'works fine' do
      post "/set_role_resource_permission", :params => {
        :api => { 
          :role => "admin",
          :resource_name => "file A",
          :permission =>"read"
        }
      }
      {"created_at" => "2020-01-22T19:05:39.010Z", "id" => 1, "resource_id" => 1, "resource_permission_id" => 1, "updated_at" => "2020-01-22T19:05:39.010Z", "user_id" => 1}
      expect(JSON.parse(response.body)[0]).to include("id")
      expect(JSON.parse(response.body)[0]).to include("user_id")
      expect(JSON.parse(response.body)[0]).to include("resource_id")
      expect(JSON.parse(response.body)[0]).to include("resource_permission_id")
    end
  end

end