In this exercise you'll be writing code to print name badges for factory employees. Employees have an ID, name, and department name. Employee badge labels are formatted as follows: `"[id] - [name] - [DEPARTMENT]"`.

## 1. Print a badge for an employee

Implement the `NameBadge.print/3` function. It should take an id, name, and a department. It should return the badge label, with the department name in uppercase.

```elixir
NameBadge.print(67, "Katherine Williams", "Strategic Communication")
# => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"
```

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. As badges are required, they will receive a temporary badge without the ID prefix.

Extend the `NameBadge.print/3` function. When the id is missing, it should print a badge without it.

```elixir
NameBadge.print(nil, "Robert Johnson", "Procurement")
# => "Robert Johnson - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times. However, an owner does not have a department. In this case, the label should print `"OWNER"` instead of the department name.

Extend the `NameBadge.print/3` function. When the department is missing, assume the badge belongs to the company owner.

```elixir
NameBadge.print(204, "Rachel Miller", nil)
# => "[204] - Rachel Miller - OWNER"
```

Note that it is possible for the owner to also be a new employee.

```elixir
NameBadge.print(nil, "Rachel Miller", nil)
# => "Rachel Miller - OWNER"
```
