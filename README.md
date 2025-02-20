# Template Repo for Custom Solutions

## Follow Komatsu Standards
https://globalkomatsu.sharepoint.com/:b:/r/sites/NAGM-GitHub-CoE136/Shared%20Documents/General/Komatsu%20Branch%20%26%20Merge%20Strategy.pdf?csf=1&web=1&e=gIha7K

### (Placeholder) Workflow Status Badges
How to add Workflow Status Badges: https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/monitoring-workflows/adding-a-workflow-status-badge

### (Placeholder) Project Description
Example: Web app for administrating Komatsu mining and construction entities. Web and mobile app for Komatsu customers to access machine data, related documents and parts ordering.

### (Placeholder) Project Links
* Dashboard links
* Hosting links
* Site-specific links

### (Placeholder) Reference Links
* Support links
* Tutorial links
* Forum links

### (Placeholder) Deployment Links
**Examples Below**

**Dev**
<br>Branch: `development`
<br>URL:  https://fleet-dev.komatsu.com
<br>Note: Will be deployed automatically after merging PR in "development" branch

**QA/TEST/SIT**
<br>URL: https://fleet-test.komatsu.com
<br>Note: Manual Deployment, we can choose any branch

**UAT**
<br>URL: https://fleet-uat.komatsu.com
<br>Note: Manual Deployment, we can choose any branch. Need Dan's approval twice to push in UAT:
- 1. Docker image build
- 2. Docker image push 

## (Placeholder) Table of Contents
**Example Below**

1. [Project Structure](#project-structure)
2. [Modules](#modules)
3. [Getting Started: Frontend](#getting-started-frontend)
   - [Installation](#installation)
   - [Running with Fastlane](#running-with-fastlane)
     - [Android](#android-1)
     - [iOS](#ios-1)
     - [React Native Web](#react-native-web)
4. [Getting Started: Backend](backend#readme)
5. [License](#license)

## (Placeholder) Project Structure
**Example Below**

    .
    ├── ...
    ├── android                 # Android native files
    ├── backend                 # Django backend REST API
    ├── ios                     # iOS native files
    ├── modules                 # Modules
    ├── public
    ├── screens
    ├── store                   # Application state storage
    ├── ...
    ├── README.md
    └── ...

# (Placeholder) Getting Started: Frontend
Example: This section outlines instructions on setting up a local development environment for the frontend of your application.

## (Placeholder) Installation

### (Placeholder) Install Packages
**Example Below**

After cloning the repo, install the dependencies locally with [Yarn](https://yarnpkg.com/):

```sh
yarn install
```

### (Placeholder) Setup Instructions
Setup instructions

### (Placeholder) ENV settings
Example: Copy the `.env.template` file in the repo root and save it as `.env` in your repo root to set local frontend environment variables.

## (Placeholder) Documentation References
Example: Documentation is available in the `/docs` directory via markdown files.

## (Placeholder) Testing
**Example Below**

Automated testing for the backend is setup with Django Test framework.

Tests are available in `/backend/tests/*`. Prefix any new file with `test_` to enable it to automatically be found and run by the testing framework.

To run all tests:
```
./manage.py test
```

## Git Workflow

### Development
- `develop` is the default branch.
- Topic branches should branch off of `develop` and be merged back into `develop`
- Release branches are created from `develop` when they're ready for QA
- Once your pull request has been merged into `develop`, your pull request branch should be deleted

### Feature
- `feature` branches should branch off of `develop` and are for new feature development
- Once a `feature` is complete, it is merged into the `develop` branch
- `feature` branches must consistently pull from `develop` before any changes are worked on
- `feature` branches must be deleted after merge

### Bugfix
- `bugfix` branches should branch off of `develop` and are for planned bug fixes
- Once a `bugfix` is complete, it is merged into the `develop` branch
- `bugfix` branches must consistently pull from `develop` before any changes are worked on
- `bugfix` branches must be deleted after merge

### Release
- `release` branches are used to prepare for a release to production
- QA and UAT activities are conducted on this branch and tracked by semantic versioning
- When a `release` has passed testing, it is merged into the `master` branch
- `release` branches may be deleted after merge

### Hotfix
- `hotfix` branches are branched off of `master` and are used to fix critical bugs already in production
- When a `hotfix` is ready, it is merged into the `master` and `develop` branches
- `hotfix` branches must deleted after merge

### Production
- `master` is for deploying to the production environment.
- `hotfix` branches branch off of `master` and should be merged back into `master`, and `develop`
- `master` deploy commits should be tagged with a version number (i.e. `v2.0.1`).

### Topic Branch Examples
- `feature/my-cool-new-thing-#211`
- `bugfix/not-that-critical-bug-fix-#45`
- `hotfix/some-bug-#345`
- `release/improved-service-#43`

## Release Branch Semanting Versioning Pattern
**Release:** release/v<MAJOR>.<MINOR>.<PATCH>
**Release Candidate:** release/v<MAJOR>.<MINOR>.<PATCH>-rc

### Release Branch Examples
- Release Candidate: `release/2.0.0-rc`
- First release: `release/v2.0.0`
- Hotfix of 2.0.0: `release/v2.0.1`
- Next release: `release/v2.1.0`

# (Placeholder) License
License information if applicable
