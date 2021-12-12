# Example for trivy and lisence_finder with rails application

## Trivy

Trivy is a vulnerability/misconfiguration scanner for containers and other artifacts.

[https://github.com/aquasecurity/trivy](https://github.com/aquasecurity/trivy)

Documentation for installation  
[Trivy documentation](https://aquasecurity.github.io/trivy/v0.21.2/getting-started/installation/)


Run on container for Mac OS (with mounted volume /var/run/docker.sock in docker-compose.yml).

```sh
docker-compose run --rm trivy
```

Result

```
dep_checkers_server (alpine 3.12.7)
===================================
Total: 2 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 2, CRITICAL: 0)

+------------+------------------+----------+-------------------+---------------+---------------------------------------+
|  LIBRARY   | VULNERABILITY ID | SEVERITY | INSTALLED VERSION | FIXED VERSION |                 TITLE                 |
+------------+------------------+----------+-------------------+---------------+---------------------------------------+
| busybox    | CVE-2021-28831   | HIGH     | 1.31.1-r21        | 1.32.1-r4     | busybox: invalid free or segmentation |
|            |                  |          |                   |               | fault via malformed gzip data         |
|            |                  |          |                   |               | -->avd.aquasec.com/nvd/cve-2021-28831 |
+------------+                  +          +                   +               +                                       +
| ssl_client |                  |          |                   |               |                                       |
|            |                  |          |                   |               |                                       |
|            |                  |          |                   |               |                                       |
+------------+------------------+----------+-------------------+---------------+---------------------------------------+

Node.js (node-pkg)
==================
Total: 3 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 3, CRITICAL: 0)

...

```

## License Finder

License Finder is all dependencies lisence reports with package managers.

[https://github.com/pivotal/LicenseFinder](https://github.com/pivotal/LicenseFinder)

Run report on container to output ./reports/license.html.

```sh
docker-compose run --rm server \
  sh -c "bundle exec license_finder report --format html > /reports/license.html"
```

Permit licenses (ex. MIT).

```sh
docker-compose run --rm server \
  bundle exec license_finder permitted_licenses add MIT
```

Result

![license finder result](https://raw.githubusercontent.com/naokirin/dep_checkers_example/main/images/license_finder_result.jpg)
