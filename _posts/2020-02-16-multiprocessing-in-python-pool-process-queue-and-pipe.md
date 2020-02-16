---
layout: post
title: "Playing with Python Multiprocessing: Pool, Process, Queue, and Pipe"
tags: python multiprocessing
permalink: multiprocessing-in-python-pool-process-queue-and-pipe
---

This post contains the example code from Python's multiprocessing documentation here,

[https://docs.python.org/3.7/library/multiprocessing.html](https://docs.python.org/3.7/library/multiprocessing.html)

, but with additional explanatory notes.


```python
!python --version
```

    Python 3.7.5


## Pool

An easy way to use multiprocessing is to use the `Pool` object to create child processes.


```python
from multiprocessing import Pool
import os

def f(x):
    print('Child process id:', os.getpid())

    return x*2

if __name__ == '__main__':
    print('Parent process id:', os.getpid())
    with Pool(5) as p:
        print(p.map(f, [1, 2, 3]))
```

    Parent process id: 30837
    Child process id: 30844
    Child process id: 30845
    Child process id: 30843
    [2, 4, 6]


Note how the child process is different for each call of `f(x)` above.

## Process

We can also use the `Process` object, handing it a function and arguments.


```python
from multiprocessing import Process

def f(name):
    print('Child process id:', os.getpid())
    print('hello', name)

if __name__ == '__main__':
    print('Parent process id:', os.getpid())
    p = Process(target=f, args=('bob',))
    
    # start(): Start the process’s activity.
    #
    # This must be called at most once per process object. 
    # It arranges for the object’s run() method to be 
    # invoked in a separate process.
    p.start()
    
    # join(timeout): Wait until the thread terminates. 
    
    # This blocks the calling thread until the thread 
    # whose join() method is called terminates – either 
    # normally or through an unhandled exception – or 
    # until the optional timeout occurs.
    p.join()
```

    Parent process id: 30837
    Child process id: 30848
    hello bob


Again, the parent and child process ids are different.

## Process Expanded Example

We can even print out the module name for more clarity.


```python
from multiprocessing import Process
import os

def info(title):
    print(title)
    print('module name:', __name__)
    print('parent process:', os.getppid())
    print('process id:', os.getpid())

def f(name):
    info('function f')
    print('hello', name)

if __name__ == '__main__':
    info('main line')
    p = Process(target=f, args=('bob',))
    
    p.start()
    p.join()
```

    main line
    module name: __main__
    parent process: 30537
    process id: 30837
    function f
    module name: __main__
    parent process: 30837
    process id: 30849
    hello bob


## Queue

We can use `Queue` for message passing. From the documentation:

> Returns a process shared queue implemented using a pipe and a few locks/semaphores. When a process first puts an item on the queue a feeder thread is started which transfers objects from a buffer into the pipe.


```python
from multiprocessing import Process, Queue

def f(q):
    '''
    q: a Queue
    '''

    print('parent process:', os.getppid())
    print('process id:', os.getpid())
    
    # Add elements to the queue.
    q.put([42, None, 'hello'])

if __name__ == '__main__':
    q = Queue()
    # The subprocess here adds elements to the queue.
    p = Process(target=f, args=(q,))
    p.start()
    # Retreive the array from the queue.
    print(q.get())    # prints "[42, None, 'hello']"
    p.join()
```

    parent process: 30837
    process id: 30850
    [42, None, 'hello']


## Pipe

Alternatively, we can use a `Pipe` for message passing.

> The Pipe() function returns a pair of connection objects connected by a pipe which by default is duplex (two-way).


```python
from multiprocessing import Process, Pipe

def f(connection):
    print('parent process:', os.getppid())
    print('process id:', os.getpid())
    connection.send([42, None, 'hello'])
    connection.close()

if __name__ == '__main__':
    parent_conn, child_conn = Pipe()
    p = Process(target=f, args=(child_conn,))
    p.start()
    print(parent_conn.recv())   # prints "[42, None, 'hello']"
    p.join()
```

    parent process: 30837
    process id: 30851
    [42, None, 'hello']

