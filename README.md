VMware Ansible Scripts
======================

This is a collection of scripts to automate management of VMware servers.  The initial scripts will focus on securing the system in accordance with the current, published DISA Security Technical Information Guides (STIGs).

Requirements
------------

This collection requires community.vmware to be loaded to the local ansible server.  I am also forcing the use of Ansible Vault to store secrets.  If you have the ability, under /etc/ansible, create a folder called 'group_vars'.  In this folder, create two new folders 'esxi' and 'vcenter'.  In each of these, we will create a 'vars' file using any text editor, and a 'vault' file that will be created with ansible-vault.  Your
folder structure should look like this:

    /group_vars
      /vcenter
        vars
        vault
      /esxi
        vars
        vault

You will create the vault file using this command:

  ansible-vault create vault

Inside the 'vault' files, add the appropriate password entry for the vCenter or ESXi hosts:

  ---
  esxi_password: VMware11!!

Now, in the 'vars' file, create the overall ansible variables to use that are specific to either the vCenter or the ESXi hosts:

  ---
  esxi_username: root
  esxi_password: "{{ vault_esxi_password }}"

Now, whenever my scripts call for esxi_password, they will request the Vault password and decrypt the password.  This will keep the passwords out of the Git repository.  It's some initial legwork, but a better security practice in general.  

I have adjusted the secure.sh script to ask for the vault password now.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

TBD

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

TBD

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

Apache-2.0

Author Information
------------------

Alex Ackerman, https://www.vmhomelab.org
