Mayan EDMS - An electronic vault for your documents 
===================================================

`Mayan EDMS`_ is a Free Open Source Electronic Document Management System,
coded in the Python language using the Django web application framework 
and released under the Apache 2.0 License. It provides an electronic vault
or repository for electronic documents.

This appliance includes all the standard features in `TurnKey Core`_:

- Mayan EDMS installed via PIP from `PyPI`_ into virtualenv within
  /opt/mayan-edms

  **Security note**: Updates to Mayan EDMS may require supervision so
  they **ARE NOT** configured to install automatically. See below for
  updating Mayan EDMS.

- Includes all pre-reqs: Virtualenv/Django/Gunicorn/Celery/Redis/Supervisor
- SSL support out of the box.
- PostgreSQL is installed as Mayan's backend database 
- `Adminer`_ administration frontend for PostgreSQL (listening on
  port 12322 - uses SSL).
- Nginx configured as reverse proxy for Mayan WebUI.
- Webmin modules for configuring PostgreSQL.

Note: as of v15.0 build of Mayan-EDMS appliance, Mayan now uses environment
variables to provide config settings. A convenience copy of these can be found
at /etc/mayan/env. This makes it easier to run the mayan-edms commandline tool.
For example::

    ENV=/etc/mayan/env
    BIN=/opt/mayan-edms/bin
    su - mayan -c ". $ENV && $BIN/mayan-edms.py help"

Supervised Manual Mayan EDMS Update
-----------------------------------

Always ensure that you have a current, working backup before performing an
upgrade.

Read through the relevant Mayan EDMS `Release Notes`_ since the version you are
upgrading from.

Check Mayan EDMS `Direct Deployment - Basic`_ documentation for dependency
updates, and other adjustments that may be required. Then to upgrade to the 
latest version (using 3.5.5 as an example below) of Mayan EDMS from the command
line::

    REMOVE=/etc/mayan/removals.txt
    curl https://gitlab.com/mayan-edms/mayan-edms/raw/master/removals.txt > $REMOVE
    supervisorctl stop all
    ENV=/etc/mayan/env
    BIN=/opt/mayan-edms/bin
    su - mayan -c ". $ENV && $BIN/pip install -U pip
    su - mayan -c ". $ENV && $BIN/pip uninstall -r $REMOVE"
    su - mayan -c ". $ENV && $BIN/pip install mayan-edms==3.5.5"
    supervisorctl start all


Credentials *(passwords set at first boot)*
-------------------------------------------

-  Webmin, SSH: username **root**
-  PostgreSQL, Adminer: username **postgres**
-  Mayan EDMS Admin Account: **admin**

.. _Mayan EDMS: https://www.mayan-edms.com
.. _PyPI: https://pypi.python.org/pypi/mayan-edms
.. _TurnKey Core: https://www.turnkeylinux.org/core
.. _Adminer: https://www.adminer.org/
.. _Release Notes: https://docs.mayan-edms.com/releases/index.html
.. _Direct Deployment - Basic: https://docs.mayan-edms.com/chapters/deploying.html#basic-deployment
