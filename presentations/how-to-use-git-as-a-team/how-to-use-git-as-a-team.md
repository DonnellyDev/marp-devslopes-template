---
marp: true
theme: devslopes
paginate: true
footer: "How to use Git as a Team"
---

<!-- _class: title -->
# How to use Git as part of a Team
## Git workflows and strategies for effective collaboration

---

# What We Are Going to Cover

- **Git Basics Review** - Key concepts refresher
- **Team Git Workflows** - Understanding collaboration models
- **Branch Management** - Creating, merging, and maintaining branches
- **Pull Request Fundamentals** - Introduction to code reviews
- **Resolving Conflicts** - Techniques to handle merge conflicts

---

# Why Teams Need a Git Strategy

- Individual Git usage is straightforward
- Team collaboration adds complexity:
  - Multiple people working on the same codebase
  - Feature development happening simultaneously
  - Need to maintain stable production code
  - Coordinating releases and deployments

---

# Common Git Workflows

---

## Centralized Workflow
```
       Developer A      Developer B     Developer C
            |               |               |
            v               v               v
    o---o---o---o---o---o---o---o---o---o---o---o  main

```

- Single `main` branch
- Everyone commits directly to main
- Simple but limited for teams

---

## Feature Branch Workflow

```
main    A---B---C---D---E---F---G
           \         /       \
feature1    X---Y---Z         \
                               \
feature2                        H---I
```

- Features developed in isolated branches
- Merged back to main when complete
- Avoids broken code in the main branch
- Enables parallel development

---

## Gitflow Workflow

```
main      A-----------------B-----------------C
           \               /                 /
develop     D---E---F---G---H---I---J---K---L
                \     /     \         /
feature1         M---N       \       /
                              \     /
feature2                       O---P
```

- `main` - stable production code
- `develop` - integration branch
- `feature/*` - new development
- `release/*` - preparing for production
- `hotfix/*` - emergency production fixes

---


# Choosing the Right Workflow

| Workflow       | Team Size    | Release Cadence | Pros               | Cons              |
| -------------- | ------------ | --------------- | ------------------ | ----------------- |
| Feature Branch | Small/Medium | Any             | Simple, flexible   | Can get messy     |
| Gitflow        | Medium/Large | Scheduled       | Structured, stable | Complex, overhead |


---

# Branch Management Best Practices

---

## Branch Naming Conventions

```
feature/user-authentication
bugfix/login-error
hotfix/security-vulnerability
release/v2.1.0
docs/api-documentation
refactor/payment-processing
```

- Use prefixes for branch type
- Include issue/ticket numbers when relevant
- Use descriptive names
- Use hyphens for spaces

---

## Working with Branches

Create a new branch:
```bash
git checkout -b feature/user-login
```

Push branch to remote:
```bash
git push -u origin feature/user-login
```

Update branch from main:
```bash
git checkout feature/user-login
git rebase main   # or git merge main
```

---

## Keeping Branches Current

**Rebase vs Merge**

Merge:
```bash
git checkout feature/user-login
git merge main
```
- Preserves history
- Creates merge commits
- Can make history complex

---
## Keeping Branches Current

**Rebase vs Merge**

Rebase:
```bash
git checkout feature/user-login
git rebase main
```
- Creates linear history
- Rewrites commit history
- Cleaner logs but requires care

---

# Pull Request Best Practices

---

## What Makes a Good PR?

- **Focused scope** - One feature or fix per PR
- **Reasonable size** - Aim for <300-500 lines of code
- **Clear description** - What, why, and how
- **Reference issues** - Link to relevant tickets
- **Tests included** - Verify functionality
- **Clean code** - Follows project standards

---

## Basic Pull Request Information

A good Pull Request should include:

- **Clear title** - What the change does
- **Description** - More details about the changes
- **Reference to issues** - Link to related tickets or issues
- **Screenshots** - For UI changes
- **Test notes** - How you tested your changes

Remember: The goal is communication with your team!

---

## Code Review Guidelines

**As a Submitter:**
- Explain your approach
- Be receptive to feedback
- Respond to all comments
- Point out areas needing extra attention

**As a Reviewer:**
- Be timely and thorough
- Focus on substance over style
- Ask questions instead of making demands
- Praise good solutions

---

# Resolving Conflicts

---

## Understanding Merge Conflicts

```
<<<<<<< HEAD (Current branch)
const greeting = "Hello";
=======
const greeting = "Hi";
>>>>>>> feature/greeting (Incoming branch)
```

- Conflicts occur when same lines are modified in different branches
- Git can't auto-resolve these differences
- Manual intervention required

---

## Conflict Resolution Strategy

1. **Understand both changes** - Why were they made?
2. **Decide the correct approach** - Which version is needed?
3. **Edit the file** - Remove markers and implement correct version
4. **Mark as resolved** - `git add <file>`
5. **Complete the merge** - `git merge --continue` or `git rebase --continue`
6. **Test thoroughly** - Ensure functionality works

---

# Protecting Your Work

---

## Simple Branch Protection

- Most hosting platforms (GitHub, GitLab, Bitbucket) offer branch protection
- For beginners, start with basic protections:
  - Prevent direct pushes to main/master
  - Require at least one review for PRs

---

## Team Communication Tips

- Let your team know when you're working on a file
- Push your changes frequently
- Update your branches with main regularly
- Ask for help with conflicts early
- Document decisions and important processes

---

# Common Team Challenges

---

## Large Binary Files

- Avoid committing large files directly to Git
- Consider Git LFS (Large File Storage)
- Use .gitignore for build artifacts

```bash
# Configure Git LFS
git lfs install
git lfs track "*.psd"
git add .gitattributes
```

---

## Handling Secrets

- **NEVER commit secrets to Git**
- Use environment variables
- Store secrets in a vault
- Use .gitignore to exclude secret files

```
# .gitignore
.env
secrets.json
config/credentials.yml
```

---

## Handling Stale Branches

- Regular branch cleanup (after merging)
- Periodic review of old branches
- Automated pruning systems

```bash
# View merged branches
git branch --merged

# Delete merged branches
git branch -d <branch-name>

# Delete remote branch
git push origin --delete <branch-name>
```

---

# Daily Git Workflow

---

## A Typical Day with Git

1. **Start your day**: Update your local repository
   ```bash
   git checkout main
   git pull
   ```

2. **Create/switch to your feature branch**
   ```bash
   git checkout -b feature/my-task
   # or
   git checkout feature/my-task
   ```

--- 

## A Typical Day with Git continued

3. **Make changes and commit regularly**
   ```bash
   git add .
   git commit -m "Add login form validation"
   ```

4. **Push your changes**
   ```bash
   git push -u origin feature/my-task
   ```

5. **Create a pull request when ready**

---

# Team Communication

---

## Commit Message Best Practices

```
feat: Add user authentication system

- Implement JWT token generation
- Add password hashing with bcrypt
- Create login and registration endpoints

Resolves #123
```

- Use conventional commit format
- Be descriptive but concise
- Mention why, not just what
- Reference tickets/issues

---

## Documentation

- Keep a CONTRIBUTING.md file
- Document workflow in README
- Create onboarding guides
- Update docs when processes change

```markdown
# Contributing to ProjectX

This document outlines our Git workflow:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
...
```

---


# Key Takeaways

- Choose a workflow that matches your team
- Establish clear branch naming conventions
- Write focused, high-quality pull requests
- Resolve conflicts carefully and thoroughly
- Automate where possible
- Communicate effectively through commits and PRs

---

# Git Basics Review

---

## Key Git Concepts

- **Repository** - The entire project and its history
- **Commit** - A snapshot of your code at a point in time
- **Branch** - An independent line of development
- **Remote** - A version of your repo hosted elsewhere (like GitHub)
- **Clone** - Making a local copy of a remote repository
- **Push/Pull** - Sending/receiving changes to/from remote

---

# Extra Resources 

- [Git Cheat Sheet (PDF)](https://education.github.com/git-cheat-sheet-education.pdf)
- [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials)
- [Interactive Git Branching](https://learngitbranching.js.org/)
- [Git for Beginners](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)