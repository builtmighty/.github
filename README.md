
<p align="center"><a href="https://builtmighty.com" target="_blank"><img src="https://github.com/builtmighty/.github/assets/7398228/b866e098-b7e3-443c-9a97-68aa17804236" width="700"></a></p>

 <h4 align="center">- Version 1.3.0 -</h4>


## Built Mighty CI/CD

This repo is used to automate our CI/CD pipelines using GitHub Actions. It sets up both linting and deployment scripts for production and staging environments.

---

## Table of Contents

- [Adding to Repo](#adding-to-repo)
- [Action Secrets/Variables](#action-secrets-variables)
- [Additional Resources](#additional-resources)

## Adding to Repo

To add the CI/CD GitHub Actions to a repo, run the following command in terminal to add the `.github/workflows` folder to the root of your repository:

> **Replace the following placeholders with your own values:**

- `<your-github-username>`: Your GitHub username
- `<your-personal-access-token>`: Your GitHub Personal Access Token (PAT)

```bash
git clone https://<github_username>:<github_personal_access_token>@github.com/builtmighty/.github.git && cd .github && rm -rf .git/ PULL_REQUEST_TEMPLATE.md rulesets/ && mkdir workflows && cd workflow_templates && mv * ../workflows && cd ../ && rm -rf workflow_templates && cd .. && git add .github && git commit -S -m "⚙️ Added CI/CD" && git push origin main
```

After running the command, you should see the `.github/workflows` folder added to your repository. Now, you will need to add the required Action secrets and variables. See the [Actions Secrets](#actions-secrets) section below for more information.

---

## Action Secrets/Variables

Add the following Action secrets/variables to the repo, by going to the repository > Settings > Secrets and variables >  Actions.

> ❗️ = Required

- ❗️ `PROD_REMOTE_WEB_ROOT` - The web root for the production WordPress install. This is the location where wp-config.php should be set. Input the path without a trailing slash. On Kinsta, you can get this from the “Info” tab. ( ***IE** /www/sitename/public* )
- ❗️ `PROD_SSH_HOST` - The SSH host IP address for the production site. ( ***IE** 123.45.678.9* )
- ❗️ `PROD_SSH_PORT` - The SSH port for connecting to the production server. ( ***IE** 123456* )
- ❗️ `PROD_SSH_USER` - The user used to connect and log in to the production server via SSH. ( ***IE** site_user* )
- ❗️ `RC_REMOTE_WEB_ROOT` - The web root for the staging WordPress install. This is the location where wp-config.php should be set. Input the path without a trailing slash. On Kinsta, you can get this from the “Info” tab. ( ***IE** /www/sitename/public* )
- ❗️ `RC_SSH_HOST` - The SSH host IP address for the staging site. ( ***IE** 123.45.678.9* )
- ❗️ `RC_SSH_PORT` - The SSH port for connecting to the staging server. ( ***IE** 123456* )
- ❗️ `RC_SSH_USER` - The user used to connect and log in to the staging server via SSH. ( ***IE** site_user* )
- ❗️ `SLACK_CHANNEL_ID` - This is the specific Slack channel where notifications should be posted. You can find this ID, on Slack, by going to the channel. Click on the channel name in the top bar.
---
- `SSH_PRIVATE_KEY` - The private key for the remote server. This is already set on the organizational level.
- `SLACK_BOT_API_KEY` - The Slack Bot API key is an API key used for interacting with all of Built Mighty’s Slack channels. It allows us to post success and failure notifications to Slack channels related to each project. This is already set on the organizational level.
- `SLACK_TEAM_ID` - This is the ID of our Built Mighty team, which encompasses all of our Slack channels. This is already set on the organizational level.
- `BOT_SIGNING_KEY` - The bot signing key is a GitHub commit signing key, which allows our automated bot to grab uncommitted code on production or staging, commit it to a branch, and that code is verified with a proper signature. This is already set on the organizational level.
---

## Additional Resources

- [General Documentation](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/70353150/GitHub+Automated+Linting+Deployment)

- [Setting Up Workflows](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/71369624/Setting+Up+Workflows)

- [Required Settings](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/71794695/Required+Settings)

- [Linting Settings](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/72089601/Linting+Settings)

- [Deployment Settings](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/90931206/Deployment+Settings)

- [Notification Settings](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/71598088/Notification+Settings)

- [Troubleshooting](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/71925773/Troubleshooting)

- [Fun Slack Messages](https://builtmighty.atlassian.net/wiki/spaces/BMH/pages/72187918/Fun+Slack+Messages)

---
