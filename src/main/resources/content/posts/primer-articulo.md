---
title: "Modern Java Architecture with Quarkus"
date: "2025-03-12"
description: "A practical guide to build fast, observable, cloud-ready Java services."
tags:
  - Java
  - Quarkus
  - Architecture
image: "og-default.svg"
layout: "post"
---
Shipping speed is no longer a luxury. Quarkus combines developer productivity with performance that feels native.
In this guide, we cover a minimal setup and a strategy to iterate without sacrificing quality.

## 1. Service Design
We start with a clean approach: clear domain boundaries, clean adapters, and observability from the first commit.

```java
@Path("/health")
public class HealthResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String status() {
        return "ok";
    }
}
```

## 2. Automation with Python
Use light scripts to simplify repetitive team workflows.

```python
import subprocess

def build():
    subprocess.run(["./mvnw", "clean", "package"], check=True)

if __name__ == "__main__":
    build()
```

## 3. Fast Deploy with Bash
A simple pipeline with clear validations.

```bash
#!/usr/bin/env bash
set -euo pipefail

./mvnw -DskipTests package
docker build -t fredpena/service:latest .
docker run -p 8080:8080 fredpena/service:latest
```

## Closing Thoughts
The goal is simple: reduce friction, increase visibility, and scale with calm. Quarkus does the heavy lifting; the rest is engineering discipline.
