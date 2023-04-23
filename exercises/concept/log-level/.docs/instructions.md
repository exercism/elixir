# Instructions

You are running a system that consists of a few applications producing many logs. You want to write a small program that will aggregate those logs and give them labels according to their severity level. All applications in your system use the same log codes, but some of the legacy applications don't support all the codes.

| Log code              | Log label | Supported in legacy apps? |
|-----------------------| --------- | ------------------------- |
| 0                     | trace     | no                        |
| 1                     | debug     | yes                       |
| 2                     | info      | yes                       |
| 3                     | warning   | yes                       |
| 4                     | error     | yes                       |
| 5                     | fatal     | no                        |
| other / not supported | unknown   | -                         |

## 1. Determine the log label

Implement the `LogLevel.to_label/2` function. It should take an integer code and a boolean flag telling you if the log comes from a legacy app, and return the label of a log line as an atom.

Log codes not specified in the table should return an _unknown_ label. Log codes specified in the table as not supported in legacy apps should also return an _unknown_ label if the log came from a legacy app.

```elixir
LogLevel.to_label(0, false)
# => :trace

LogLevel.to_label(0, true)
# => :unknown
```

## 2. Send an alert

Somebody has to be notified when unexpected things happen.

Implement the `LogLevel.alert_recipient/2` function to determine to whom the alert needs to be sent. The function should take an integer code and a boolean flag telling you if the log comes from a legacy app, and return the name of the recipient as an atom.

Use the `LogLevel.to_label/2` function from the previous task. If the log label is _error_ or _fatal_, send the alert to the _ops_ team. If you receive a log with an _unknown_ label from a legacy system, send the alert to the _dev1_ team, other unknown labels should be sent to the _dev2_ team. All other log labels can be safely ignored.

```elixir
LogLevel.alert_recipient(-1, true)
# => :dev1

LogLevel.alert_recipient(0, false)
# => false
```
