import types

class Employee:
   'Common base class for all employees'
   empCount = 0

   def __init__(self, name, salary):
      self.__name = name
      self.salary = salary
      Employee.empCount += 1
   
   def displayCount(self):
     print ("Total Employee %d" % Employee.empCount)

   def displayEmployee(self):
      print ("Name : ", self.__name,  ", Salary: ", self.salary)

   def __del__(self):
      class_name = self.__class__.__name__
      print (class_name, self.__name, "destroyed")
      Employee.empCount -= 1

#This would create first object of Employee class"
emp1 = Employee("Zara", 2000)
#This would create second object of Employee class"
emp2 = Employee("Manni", 5000)
emp1.displayEmployee()
emp2.displayEmployee()
print ("Total Employee %d" % Employee.empCount)

emp2.displayCount()
print(emp2._Employee__name)
print(emp2.salary)
print(Employee.__dict__)

def desc(self):
    return self._Employee__name+":"+str(self.salary)

emp1.desc = types.MethodType( desc, emp1 )
print( emp1.desc() )

Employee.desc = types.MethodType(desc, Employee)

#emp2 non ha il metodo

del emp1
print ("Total Employee %d" % Employee.empCount)

