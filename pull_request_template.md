**Title:**
Prefix all PR Titles with a related label to satisfy the PR Title Checker deployment action.

| Title Prefix | Automated Label | Description                                 |
| :----------- | :-------------- | :----------                                 |
| bugfix:      | bug             | Something isn't working                     |
| chore:       | chore           | Code maintenance                            |
| depend:      | dependencies    | Updates to dependencies and dependency files|
| deploy:      | deployment      | Deployment modifications                    |
| doc:         | documentation   | Improvements or additions to documentation  |
| enhance:     | enhancement     | Improvement to existing feature             |
| feat:        | feature         | New feature or request                      |

**Reviewers:**
*`@mention` at least one reviewer on the team here.*

**Description:**
*What does this PR do? Make sure to update the CHANGELOG.MD as well*

**Story card:**
*Link to project management story card.*

**Before Submitting a PR**
- [ ] Add AB# to the end of PR Title if applicable
- [ ] Keep PRs limited to small, related units of functionality as much as possible (less than 400 changed LOC)
- [ ] Review your own draft pull request using the checklist below before requesting a review.
- [ ] Remove commented out code.
- [ ] Make sure all tests are green.

**When reviewing, does this PR...**
- [ ] Do what's defined in the story card? Check out and test the code.
- [ ] Follow project architectural and style norms in the README?
- [ ] Improve or worsen the readability/maintainability of the codebase?
- [ ] Improve or degrade performance?
- [ ] Change anything that requires an update to the README?
- [ ] Do something cool? Leave a positive comment!
