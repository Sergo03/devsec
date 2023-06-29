# devsec

This program will check code in repositoty for secrets and other sensetive data with Gitleaks tool.
If Gitleaks tool is not installed script will installed tool automatically for your OS.

1. Add code from pre-commit.sh to .git/hooks/pre-commit.sample.
2. Rename pre-commit.sample to pre-commit.
3. Grant execute rights to file pre-commit. (chmod +x .git/hooks/pre-commit)

You can disable or enabled check, for this run in command line this command "git config --bool hooks.gitleaks-enable false" - for disable, for enabled run - "git config --bool hooks.gitleaks-enable true"
