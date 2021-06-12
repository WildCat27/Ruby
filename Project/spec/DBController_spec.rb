#../spec/account_spec.rb
require_relative "../SingleControllers/DBController"
require 'rspec'

describe DBController do

    it 'has db connection' do
        DBController.controller.try_connect.should eq false
    end

    it 'does not have db connection' do
        requests = DBController.controller.instance_eval { @requests}
        expect {DBController.controller.execute("DELETE FROM employees WHERE fullname = ?;", 'Панкина Клара Денисовна')}.to change{requests.length}.by(1)
    end

    it 'has got db connection' do
        system("sudo service mariadb start")
        requests = DBController.controller.instance_eval { @requests}
        result = DBController.controller.execute("SELECT * FROM employees;")
        puts "requests length #{requests.length}"
        puts result
        system("sudo service mariadb stop")
    end

    system("sudo service mariadb stop")
end