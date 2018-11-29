% Container Repository Management
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

# Container Repository

Best practices for Docker image repositories

---

## Docker Tags

Different usage patterns for different use-cases!

## Shared images

e.g. database containers, base images

* Use [SemVer](https://semver.org/) if possible
* Reuse tags when compatibility is ensured
  * v1, v1.7, v1.7.13
* Perform versioning on CI/CD level

## Application images

Images specific to a single application

* Use hash of git commit
  * `git rev-parse --verify HEAD`
* Use additional SemVer tags
* Use the image digest
  * `docker-image@sha256:0123abcd...`
  * `docker images --digests`

---

## Docker Registry

Law of the land

* No manual push to the registry!
* Image uploads only via CI/CD pipeline
  * Images are tagged in the CI/CD pipeline

## Docker registry cleanup

Out with the old, in with the new!

* Delete old images from the registry
* Docker Registry HTTP API V2
  * Digest required for `DELETE` request
* Custom API for registry solution
  * [Nexus](https://support.sonatype.com/hc/en-us/articles/360009696054-How-to-delete-docker-images-from-Nexus-Repository-Manager)
  * [Harbor](https://github.com/goharbor/harbor/blob/master/docs/user_guide.md#deleting-repositories)
  * [JFrog Artifactory](https://www.jfrog.com/confluence/display/RTF/Docker+Registry#DockerRegistry-DeletionandCleanup)

---

# Attribution / License

* Slide Skeleton https://de.wikipedia.org/wiki/Skeleton_(Programmierung)

* Slides
Adfinis SyGroup AG, 2017, Attribution-NonCommercial 2.0
(CC BY-NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
