#../spec/account_spec.rb
require_relative "../Fabric/Terminal_fabric"
require_relative "../Fabric/Window_fabric"
require_relative "../Fabric/Employee_fabric"
require_relative "../Controllers/Controller_employee"
require 'rspec'

describe Controller_employee do
  before(:all) do
    FXApp.new do |app|
        Employee_fabric.fabric.view_fabric = Window_fabric.new(app)
        controller = Employee_fabric.fabric.controller_list
    end
  end

  it 'validates a correct date' do
    controller.check().should be(@user)
  end

end