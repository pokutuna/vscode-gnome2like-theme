import os

class Greeter:
    def __init__(self, name):
        self.name = name

    def greet(self, loud=False):
        if loud:
            print(f'HELLO, {self.name.upper()}!')
        else:
            print(f'Hello, {self.name}')

def run_greeter():
    g = Greeter('Bob')
    g.greet()
    g.greet(loud=True)

if __name__ == '__main__':
    run_greeter()
    squares = [x**2 for x in range(10)]
    print(squares)
