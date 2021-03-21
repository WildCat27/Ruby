require_relative "ListEmployee"
require_relative "TerminalViewListEmployee"

def main
    list = ListEmployee.FromJson("Лаба 3\\employees.json")
    view = TerminalViewListEmployee.new(list)
    view.ViewTable
end

main