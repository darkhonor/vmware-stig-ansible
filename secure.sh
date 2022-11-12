# This version will ask you to enter the Ansible user's password as well as 
# your vault password on execution.  Most secure option
#ansible-playbook -v -k --ask-vault-pass -i hosts -i hosts.vmware.yml site.yml

# This version will refer to the vault password in ~/.ansible/vault_password.
# KEEP THIS PASSWORD SECURE AND DO NOT SHARE OR STORE TO GIT
ansible-playbook -v -k --vault-password-file ~/.ansible/vault_password -e @/etc/ansible/group_vars/esxi/vars -e @/etc/ansible/group_vars/esxi/vault -i hosts -i hosts.vmware.yml site.yml
