A `Registry` keeps track of many `LegalEvents`. A `LegalEvent` impacts one or multiple `Properties` of a `Record`. A `LegalEvent` may be associated with one or multiple `LegalResources`, which may serve as evidence. 

A `Value` associated with a `Property` and `Record` is effective as of a point in time, and may also no longer be effective as of a given point in time (valid time). `created` and `lastModified` timestamps are also available to set the record / transaction time.
