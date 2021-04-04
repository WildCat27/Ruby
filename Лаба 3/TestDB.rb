require "mysql2"

client = Mysql2::Client.new(
    :host => "localhost", 
    :username => "test_user",
    :password => "test_user",
    :database => "Staff"
)

create_table_query = "CREATE TABLE employees (employee_id int PRIMARY KEY, fullname varchar(60) NOT NULL, birthdate date NOT NULL, phone varchar(13) NOT NULL, address varchar(60) NOT NULL, email varchar(40) NOT NULL, passport varchar(11) NOT NULL, speciality varchar(20) NOT NULL, experience int NOT NULL, previous_workplace varchar(60) NULL, previous_position varchar(20) NULL, previous_wage int NULL);"
#client.query(create_table_query)


def test_select
    select_employees_query = "SELECT * FROM employees;"
    client.query(select_employees_query)

    private_key = OpenSSL::PKey::RSA.new File.read 'private_key.pem'

    list = ListEmployee.new
    results.each { |row|
    decrypted_passport = private_key.private_decrypt(Base64.decode64(emp["passport"]))

    unless emp["experience"] == 0
        list.add Employee.new emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], decrypted_passport, emp["speciality"], emp["experience"], emp["previous_workplace"], emp["previous_position"], emp["previous_wage"]
    else
        list.add Employee.employee_without_experience emp["fullname"], emp["birthdate"], emp["phone"], emp["address"], emp["email"], decrypted_passport, emp["speciality"]
    end
    }
    list
end