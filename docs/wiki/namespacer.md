# What's the Objective?

Namespaces come in handy when you need to control or limit the scope of variables and handlers. Additionally, they are widely used to organize code into logical groups and to avoid naming collisions that can occur, especially when dealing with multiple scripts using the same naming conventions. Alongside this, object-oriented programming is more dynamic and scalable for large-scale systems or high-performance game modes.

## How to implement?

```lua
assert(load(exports['rosecore']:import('namespacer')))()
```

<br/>

## ━ APIs (Namespacer) / Shared

#### - How to create a namespacer:

> ```lua
> local namespacer = rose.namespacer:create(
>   name: string,
>   parent: table,
> );
> ```

<br/>

#### - How to destroy a namespacer (remotly):

> ```lua
> local result: boolean = rose.namespacer:destroy(
>   name: string,
> );
> ```

<br/>

#### - How to get a namespacer type:

> ```lua
> local type: string = self:getType(
>   name: string,
> );
> ```

<br/>

## ━ APIs (Class) / Shared

#### - How to create a class

:magic_wand: Remember that you don't need to make "namespacer" (your instance variable) a global format. rosecore will magically add this instance to the VM.

> ```lua
> local type: string = rose.class:create(
>   name: string,
>   parent?: table, -- Optional
>   namespacer?: string -- Optional
> );
> ```

**@Objective: Creates the namespace.**

<br/>

#### - How to delete a class (remotly):

> ```lua
> local type: string = rose.class:destroy(
>   class: instance
> );
> ```

**@Objective: Destroys an existing namespace.**

<br/>

#### - Check if table is a rose.class instance :

> ```lua
> local result: boolean = rose.class:isInstance(
>   class <instance>: classInstance
> );
> ```

**@Objective: Get a class type.**

<br/>

#### - How to create a instance:

> ```lua
> local class <instance>: classInstance = self:createInstance()
> ```

**@Objective: Creates the class.**

<br/>

#### - How to destroy a instance:

> ```lua
> local class <instance>: classInstance = classInstance:destroyInstance()
> ```

**@Objective: Destroy the specified instance.**

<br/>
