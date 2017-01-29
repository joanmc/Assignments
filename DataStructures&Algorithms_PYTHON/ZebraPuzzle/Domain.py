class Domain(object):
    def __init__(self, domain):
        self.dom_values = domain

    def destroy_domain(self):
        '''Method to destroy a domain'''
        self.dom_values = None

    def print_domain(self):
        '''Method to print the values of a domain'''
        print(self.dom_values)

    def size(self):
        '''Method to return the size of a domain'''
        return len(self.dom_values)

    def split_domain(self):
        '''Method to split a domain in half and return the halves in two separate lists'''
        half = len(self.dom_values)//2
        return self.dom_values[:half], self.dom_values[half:]

    def __eq__(self, other):
        '''Override == to compare if two domains are the same'''
        for value in self.dom_values:
            if value not in other.dom_values:
                return False
        else:
            return True

    def __ne__(self, other):
        '''Override != to compare if two domains are different'''
        if self.dom_values != other:
            return True
        else:
            return False

    def is_empty(self):
        '''Check if a domain is empty'''
        return len(self.dom_values) == 0

    def is_reduced_to_only_one_variable(self):
        '''check if the domain contains only 1 value'''
        return len(self.dom_values) == 1

