from abc import ABCMeta, abstractmethod

class Constraint(object):
    def __init__(self, variable):
        self.create(self, variable)

    def create(self, var):
        self.var = var

    def delete(self):
        self.var = [None]

    def print_constraint(self):
        print(self.var.print_variable())

    @abstractmethod
    def reduction(self, domain):
        pass

    @abstractmethod
    def is_satisfied(self):
        pass


class Constraint_equality_var_var(Constraint):
    def __init__(self, a, b):
        self.var1 = a      # Variable 1
        self.var2 = b      # Variable 2

    def reduction(self):
        '''Remove values not shared by both variable domains'''
        keep = []

        for value in self.var1.get_domain():
            if value in self.var2.get_domain():
                if value not in keep:
                    keep.append(value)

        self.var1.set_domain(keep)
        self.var2.set_domain(keep)

    def is_satisfied(self):
        '''Domains of variable's a and b have at least one value in common'''
        for value in self.var1.get_domain():
            if value in self.var2.get_domain():
                return True
        else:
            return False


class Constraint_equality_var_cons(Constraint):
    def __init__(self, a, c):
        self.var1 = a           # Variable
        self.constant = c       # Constant

    def reduction(self):
        ''' Remove all values in variable a's domain except the constant, c'''
        if self.constant in self.var1.get_domain():
            self.var1.set_domain([self.constant,])
        else:
            print("Error: constant not in variable")


    def is_satisfied(self):
        '''check if constant, c,  is in domain of variable a'''
        return self.constant in self.var1.get_domain()

class Constraint_equality_var_plus_cons(Constraint):
    def __init__(self, A, B):
        self.var1 = A      # Variable 1
        self.var2 = B      # Variable 2
        self.constant = 1      # constant

    def reduction(self):
        '''remove values ('a') from variable A's domain such that there is no value 'b' in variable B that a = b + c (where c = constant)'''
        keep_a = []
        keep_b = []

        for value_a in self.var1.get_domain():
            for value_b in self.var2.get_domain():
                if value_a == (value_b + self.constant):
                    if value_a not in keep_a:
                        keep_a.append(value_a)
                if value_b == (value_a - self.constant):
                    if value_b not in keep_b:
                        keep_b.append(value_b)

        self.var1.set_domain(keep_a)
        self.var2.set_domain(keep_b)

    def is_satisfied(self):
        '''if constant a in variable A's domain and b in variable B's domain such that a = b + c'''
        for value_a in self.var1.get_domain():
            for value_b in self.var2.get_domain():
                if value_a == value_b + self.constant:
                    return True
        else:
            return False

class Constraint_equality_abs_var_plus_cons(Constraint):
    def __init__(self, a, b):
        self.var1 = a      # Variable 1
        self.var2 = b      # Variable 2
        self.constant = 1     # constant

    def reduction(self):
        '''remove values ('a') from variable A's domain such that there is no value 'b' in variable B that abs(value_a - value_b) == c'''
        keep_a = []
        keep_b = []

        for value_a in self.var1.get_domain():
            for value_b in self.var2.get_domain():
                if abs(value_a - value_b) == self.constant:
                    if value_a not in keep_a:
                        keep_a.append(value_a)
                    if value_b not in keep_b:
                        keep_b.append(value_b)

        self.var1.set_domain(keep_a)
        self.var2.set_domain(keep_b)

    def is_satisfied(self):
        '''if constant a in variable A's domain and b in variable B's domain such that a = b + c'''
        for value_a in self.var1.get_domain():
            for value_b in self.var2.get_domain():
                if abs(value_a - value_b) == self.constant:
                    return True
        else:
            return False

class Constraint_difference_var_var(Constraint):
    def __init__(self, a, b):
        self.var1 = a      # Variable 1
        self.var2 = b      # Variable 2

    def reduction(self):
        '''if a variable has only one value in its domain enusure the other
        variables domain does not contain that value'''
        if self.var1.domain.size() == 1 and self.var2.domain.size() == 1:
            if self.var1.domain.dom_values[0] == self.var2.domain.dom_values[0]:
                print("Error: domains contain a single identical value")
        elif self.var1.domain.size() == 1:
            if self.var1.domain.dom_values[0] in self.var2.get_domain():
                    self.var2.domain.dom_values.remove(self.var1.domain.dom_values[0])
        elif self.var2.domain.size() == 1:
            if self.var2.domain.dom_values[0] in self.var1.get_domain():
                    self.var1.domain.dom_values.remove(self.var2.domain.dom_values[0])

    def is_satisfied(self):
        '''ensure variable domains are NOT reduced to a single identical variable'''
        if self.var1.domain.size() == 1 and self.var2.domain.size() == 1:
            if self.var1.domain.dom_values[0] == self.var2.domain.dom_values[0]:
                return False
            else:
                return True
        else:
            return True

