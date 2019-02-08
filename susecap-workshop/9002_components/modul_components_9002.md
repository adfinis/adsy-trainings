![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Components of SUSE CAP 


## UAA

* User Account and Authentication Server
* Database for state
* Attachment to LDAP or other IAM solutions optional
* Checks if user are authenticated and authorized

## Cloud Controller 

* Mail component of Cloud Foundry
* Database for state
* Communicating with Diego for building/deploying apps

## Blobstore

* Storing of application zip file
* Stroring of droplets

## Diego

* building apps with Diego cells
* creation of Diego cells for running applications

## Route Emiter

* Communication between diego cell and GoRouter
* Telling the Router where to route a specific path/hostname

## Metron / Doppler / Traffic Controller

* Log aggregation
* async log flow 

## Whole picture

![](static/CloudFoundry.png)

## Diego flow

![](static/diego-flow.png)

## Diego flow

![](static/app_push_flow_diagram_diego.png)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
