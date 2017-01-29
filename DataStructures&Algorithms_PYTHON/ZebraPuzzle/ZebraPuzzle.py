import Problem as P
from copy import deepcopy

def domain_reduction(constraint_set):
    '''Function to reduce all constraints once'''
    for const in constraint_set:
        const.reduction()
        for const2 in constraint_set:
            if not const2.is_satisfied():
                print("Error not satisfied")
                return False
    else:
        return True


def domain_lengths(all_variables):
    '''Function to find the length of each variables domain and return them in a list'''
    domains = [None] * len(all_variables)
    i = 0
    for v in all_variables:
        domains[i] = v.domain.size()
        i += 1
    return domains


def check_solution(all_variables):
    '''Function to check if each variable contains one value in its domain'''
    for v in all_variables:
        if not v.domain.is_reduced_to_only_one_variable():
            #print("Solution not found yet")
            return False
    else:
        return True


def reduce(problem_set):
    '''Function to reduce all variables as much as possible, according to the constraints set out'''
    constraints = problem_set.get_constraints()
    variables = problem_set.get_variables()
    while True:
        size1 = domain_lengths(variables)
        print("Size of each variables domain before reduction instance: ", size1)
        if not domain_reduction(constraints):
            return "error"
        size2 = domain_lengths(variables)
        #problem_set.print_variable_domains()
        print("Size of each variables domain after reduction instance: ", size2)
        if size1 == size2:
            return "split"
        if check_solution(variables):
            return "solution"


def split(p_set):
    '''Function to reduce and split the problem set until a solution is found'''
    res = reduce(p_set)
    if res == "solution":
        p_set.print_variable_domains()
        return True
    elif res == "error":
        return False
    elif res == "split":
        set_vars = p_set.get_variables()
        size_domains = domain_lengths(set_vars)
        indices = [i for i,val in enumerate(size_domains) if val == 2]
        for ind in indices:
            x, y = set_vars[ind].domain.split_domain()
            set_1 = deepcopy(p_set)
            set_2 = deepcopy(p_set)
            v1 = set_1.get_variables()
            v1[ind].set_domain(x)
            v2 = set_2.get_variables()
            v2[ind].set_domain(y)
            return split(set_1), split(set_2)


# SOLVE ZEBRA PUZZLE
problem_set = P.Problem()
split(problem_set)


