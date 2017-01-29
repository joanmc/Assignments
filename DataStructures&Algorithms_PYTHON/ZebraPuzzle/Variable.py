import Domain as D

class Variable(object):
    def __init__(self, name, variable_id, domain):
        self.create_variable(name, variable_id, domain)

    def create_variable(self, name, variable_id, domain):
        '''Variable constructor'''
        self.name = name
        self.variable_id = variable_id
        self.domain = domain

    def get_domain(self):
        '''return the domain values of a variable'''
        return self.domain.dom_values

    def set_domain(self, dom):
        '''set the domain values of a variable'''
        self.domain.dom_values = dom

    def print_variable(self):
        '''print a variable'''
        print("Variable Name: ", self.name)
        print("Variable id: ", self.variable_id)
        print("Domain: ", end=' ')
        self.domain.print_domain()



