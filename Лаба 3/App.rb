require_relative "ListEmployee"
require_relative "TerminalViewListEmployee"

def main
    list = ListEmployee.FromJson("Лаба 3\\employees.json")
    view = TerminalViewListEmployee.new(list)
    #view.ViewList
    #list.ToJson("Лаба 3\\emp.json")
    view.Edit(list.Get[0])
end

main