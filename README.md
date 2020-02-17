docker-symfonycloud
===================

A helper Docker image to facilitate operations on Symfony Cloud from Docker.
The Docker image is geared to be used within CI/CD infrastructure.


Prerequisites
-------------

In order to deploy or perform operations to Symfony Cloud you need:
- A Symfony Account API KEY
- A SSH *private* key of which the public key is registered with Symfony Cloud.


Procedure
---------

Ensure the environment variable `SYMFONY_CLOUD_SSH_KEY` is set to the *BASE64*
encoded version of an OpenSSH compatible SSH key which is not password
protected. Ideally you can set this variable in a secure way in your CI/CD
infrastructure.

Once that is in place configure your CI/CD infrastructure as follow. I'll be
using GitLab CI as an example:

```yaml
variables:
  SYMFONY_CLOUD_PROJECT_ID: xxx123

deploy:symfony_cloud:
  stage: deploy
  image: sandrinr/symfonycloud
  script:
    - symfony project:link ${SYMFONY_CLOUD_PROJECT_ID}
    - symfony env:deploy --environment=$CI_COMMIT_REF_NAME
```


Notes
-----

- Please note this Docker image is intentionally kept small sucht that it is
quickly loaded within CI/CD runners. It does not contain PHP.
