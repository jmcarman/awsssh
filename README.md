# README
The devcontainer configuration files in this repository install an AWS .pem key from the Learner Lab (via a repository secret) into GitHub Codespaces. This will allow students to ssh to their AWS resources from the Codespace terminal. There are two ways you can use the contents of this repo. 

## Option A: For a per repo SSH key

1. Create a repo by forking this one OR Include the contents of the devcontainer directory in your repo / template repo.
2. Add your .pem file as a GitHub secret called "SSH_KEY" using the following steps in **YOUR** new repository:
    - Go to **Settings** (top right corner)
    - Click on **Secrets and variables**
    - Click on **Codespaces**
    - Click the Green button labelled **New repository secret**
3. Add the secret:
    - With the name **SSH_KEY**
    - In the **Secret** field, paste in the contents of your .pem file (cat from your local command line and copy/paste)
    - Your screen should look as follows (note, in the screenshot the secret field has been left empty)
    ![](.doc/new-secret.png)
    - Click the green button labelled **Add secret**
4. Launch / Rebuild the Codespaces container.
5. SSH to your AWS instance without specifying the location of the key. ie: ssh ubuntu@*ip or FQDN*.

## Option B: GitHub account wide SSH key installed on every codespace you own

1. Create a repo called dotfiles (if you do not already have one). Your dotfiles repo can be private, and it will still work.
2. Follow the steps outlined above (in option A) to add your .pem file as a secret to your dotfiles repo. Keep the same naming conventions.
3. Copy install.sh into your dotfiles repo.
4. Follow the documentation here to enable your dotfiles repo. https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles
5. You may need to rebuild the container for any existing Codespaces you own.
6. Note: Keys added via your dotfiles repo will be installed over top of per-repo keys with this configuration. I'm sure there's a way to change it up.

At present there are issues getting this to work with GitHub Classroom. I'm working on that.
