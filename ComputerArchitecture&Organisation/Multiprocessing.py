# COMP30660: Computer Architecture and Organisation - Take Home Assignment
# Joan McCarthy - 1274729

# import the multiprocessing and time libraries
import multiprocessing
import time

# Define the function Prime with input parameter num
def Prime(num):
    '''Function to check if "num" is a prime.
    Function returns the number if it is a prime
    or else returns an empty string if it is not prime'''
    for i in range(2, num/2 +1):
        if num % i == 0:
            return ""
    return num


# Main Program
if __name__ == '__main__':
    # Prompt the user for the limit to find the prime numbers up to and the number of Processes to be used
    Limit = int(raw_input("Enter limit to find prime numbers up to (an int > 0): "))
    NumProcesses = int(raw_input("Enter desired number of processes: "))

    if Limit > 0:
        # Take record of the time on the clock just before starting to find the prime numbers
        StartTime = time.clock()
        # Using the Pool function from the multiprocessing library to divide the task up into the required number of processes
        MultipPool = multiprocessing.Pool(processes = NumProcesses)
        # MultiPool.map will lock the program until the Prime function has finished executing up to the given range
        PrimeResults = MultipPool.map(Prime, range(1,Limit+1))
        # Take record of the time after all prime numbers have been found
        EndTime = time.clock()

        # Find all the prime numbers return in "prime_results" (discard of any empty strings returned)
        PrimeNumbers = []
        for number in PrimeResults:
            if number != "":
                PrimeNumbers += [number,]

        # Print Results - prime numbers and time taken
        print "There are ", len(PrimeNumbers), "prime numbers up to the number", Limit
        # The next line can be used to print all the prime numbers found
        # print "They are:", PrimeNumbers
        TimeTaken = EndTime-StartTime
        print "Execution Time: ", TimeTaken

    else:
        print "Error: Cannot find the prime numbers of a number less than 1"