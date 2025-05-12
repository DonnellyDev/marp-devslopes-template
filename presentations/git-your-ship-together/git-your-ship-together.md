---
marp: true
theme: devslopes
paginate: true
footer: "Git Your Ship Together"
---

<!-- _class: title -->
# Git Your Ship Together
## File Management Basics Every Developer Should Know

---

# What We Are Going to Cover

- **File Naming Basics** - How to name files clearly
- **Simple Project Organization** - Keeping your files tidy
- **HTML, CSS, and JavaScript** - Organizing web projects
- **Introduction to Git Branches** - Managing different versions
- **Working with Provided Code** - Understanding test files and structure
---

# Why Does File Management Matter?

- Have you ever...
  - Spent 10+ minutes looking for a file?
  - Been confused which version is the latest?
  - Had trouble explaining where things are to teammates?
  - Accidentally broken something by putting files in the wrong place?
- **Good file organization = Less frustration + More coding time**

---

# File Naming Basics

---

## The 3 Rules of Good File Names

1. **Be descriptive** - What is this file for?
2. **Be consistent** - Use the same pattern every time
3. **Think about sorting** - Files are listed alphabetically

**Examples:**

❌ Bad: `file1.html`, `stuff.css`, `newpage.html`  
✅ Good: `homepage.html`, `about-page.html`, `styles.css`

---

## Common File Naming Styles

```
kebab-case: Words separated by hyphens
    about-page.html
    contact-form.css

camelCase: First word lowercase, then capitalize each word
    aboutPage.html
    contactForm.css

snake_case: Words separated by underscores
    about_page.html
    contact_form.css
```
- Pick ONE style and stick with it!

---

## File Extensions Explained

- `.html` - Web page structure
- `.css` - Styling for web pages
- `.js` - JavaScript code for interactivity
- `.jpg`, `.png`, `.svg` - Different image formats
- `.md` - Markdown documentation files
- `.json` - Data files in JSON format

**The extension tells both you and the computer what kind of file it is!**

---

# Simple Project Organization

---

## Basic Web Project Structure

```
my-website/
│
├── index.html         # Homepage
├── about.html         # About page
├── contact.html       # Contact page
├── css/               # CSS folder
│   ├── styles.css     # Main styles
│   └── reset.css      # CSS reset
├── js/                # JavaScript folder
│   └── main.js        # Main JavaScript
└── images/            # Images folder
    ├── logo.png
    └── header-bg.jpg
```

---

## Keep Related Files Together

**Example: Profile Feature**
```
profile/
├── profile.html      # Profile page HTML
├── profile.css       # Profile-specific styles
└── profile.js        # Profile-specific JavaScript
```
**Why it's helpful:**
- Easy to find everything related to the profile
- When you need to change a feature, all files are in one place
- Makes it clear which files belong together

---

## Images and Assets Organization
**Flat structure (for small projects):**
```
images/
├── logo.png
├── header.jpg
├── icon-home.svg
└── background.png
```
**Organized structure (for larger projects):**
```
assets/
├── images/
│   ├── logos/
│   ├── backgrounds/
│   └── icons/
├── fonts/
└── videos/
```
---
# HTML, CSS, and JavaScript Organization
---

## HTML Organization

```html
<!DOCTYPE html>
<html>
<head>
  <!-- Meta tags first -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title -->
  <title>My Website</title>
  <!-- CSS links -->
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/styles.css">
    <!-- JavaScript at the end -->
  <script src="js/main.js" defer></script>
</head>
<body>
  <!-- Content organized by sections -->
  <header>...</header>
  <main>...</main>
  <footer>...</footer>
</body>
</html>
```

---

## CSS Organization

**Option 1: Single CSS file with sections**
```css
/* Reset styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Header styles */
header {
  background-color: #333;
  color: white;
}

/* Main content styles */
main {
  padding: 20px;
}

```

---

## CSS Organization (continued)

**Option 2: Multiple CSS files by purpose**
```
css/
├── reset.css      # Browser resets
├── layout.css     # Page structure
├── typography.css # Text styling
├── colors.css     # Color definitions
└── components.css # Reusable components
```

**In your HTML:**
```html
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/typography.css">
<!-- etc. -->
```

---

## JavaScript Organization
**For beginners (single file):**
```javascript
// main.js
// Constants and variables at the top
const BASE_URL = 'https://api.example.com';
// Helper functions
function showMessage(message) {
  alert(message);
}
// Main functionality grouped by feature
// -- Form handling
function validateForm() {
  // Form validation code
}
// -- UI interactions
function toggleMenu() {
  // Menu toggle code
}
// Event listeners at the bottom
document.querySelector('#contact-form').addEventListener('submit', validateForm);
document.querySelector('.menu-button').addEventListener('click', toggleMenu);
```

---

# Understanding Test Files

---

## What are Test Files?

- Test files check if your code works correctly
- They run automatically to find bugs
- Often provided in learning environments
- Help you know when you've completed a task

---
## What are Test Files? - Example
 If you're writing a function to add numbers:
```javascript
// add.js - Your code
function add(a, b) {
  return a + b;
}

// add.test.js - Test file
test('adds 1 + 2 to equal 3', () => {
  expect(add(1, 2)).toBe(3);
});
```

---

## Where to Find Test Files

**Common locations:**
```
project/
├── src/               # Your source code
│   └── calculator.js
└── tests/             # Test files
    └── calculator.test.js
```

**OR (tests beside code):**
```
project/
└── src/
    ├── calculator.js
    └── calculator.test.js
```

- **When given a repository with tests, don't move the test files!**


---

## Running Tests

Common commands:

```bash
# Run all tests
npm run test # sometimes npm run test-all

# Run specific tests
npm run test-part1 

```

- Always run available tests before submitting your work
- Fix failing tests before moving on
- Test failures give clues about what's wrong

---

# Introduction to Git Branches

---

## What is a Branch?

A branch is like a separate timeline for your code:

```
main      o---o---o---o---o
           \
feature     o---o---o
```

- `main` - The primary version of your code
- `feature` - Your changes for a new feature
- Each branch can have different files and code

---

## Basic Branch Commands

Create a new branch:
```bash
git checkout -b my-new-feature
```

Switch between branches:
```bash
git checkout main
git checkout my-new-feature
```

See all branches:
```bash
git branch
```

---

## When to Create a Branch

Create a new branch when:
- Starting a new feature
- Fixing a bug
- Experimenting with changes
- Working on a different part of the project

--- 
## Example Branch workflow
**Example workflow:**
1. `git checkout -b add-contact-form`
2. Add your files for the contact form
3. Test everything works
4. Commit your changes
5. Push to GitHub
6. Create a pull request

---

# Working with Provided Code

---

## Understanding Repository Structure

When you clone an assignment:

1. **Read the README.md file first!**
2. Look for these common patterns:
   - `/src` - Where your code goes
   - `/assets` - Images and other resources
   - `/tests` - Test files
3. Run the project first before making changes

---

## Don't Break the Structure

❌ **Things to avoid:**
- Moving test files to a different folder
- Changing filenames that tests expect
- Removing the folder structure
- Adding your files to random locations

✅ **Instead:**
- Add your files in the expected locations
- Follow the naming patterns already used
- Keep related files together
- Ask if you're unsure where something goes

---

## Example: Working with a Test Repository

```
assignment/
├── README.md              # Instructions
├── package.json           # Project setup
├── src/
│   ├── index.html         # Main HTML file
│   ├── css/               # Add your CSS here
│   │   └── styles.css     # (You create this)
│   └── js/                # Add your JS here
│       └── main.js        # (You create this)
└── tests/                 # Don't modify these!
    ├── css.test.js
    └── js.test.js
```
---

# Basic Git Commands for File Management

---

## What is Git?

- Git tracks changes to your files over time
- It creates a history of who changed what and when
- It allows you to go back to previous versions

```
Before Git: final.html, final-v2.html, final-REALLY-FINAL.html
With Git:   index.html (with complete history of changes)
```

---

## Essential Git Commands for Beginners

**Set up a project:**
```bash
git init                 # Start tracking a project
git clone <url>          # Copy a project from GitHub
```

**Daily workflow:**
```bash
git status               # See what files changed
git add <file>           # Prepare a file to be saved
git commit -m "Message"  # Save changes with a description
git push                 # Upload changes to GitHub
```

---

## Basic Branching for Beginners

Create a new branch:
```bash
git checkout -b my-new-feature
```

Switch between branches:
```bash
git checkout main             # Go back to main branch
git checkout my-new-feature   # Go to your feature
```

Merge your changes into main:
```bash
git checkout main             # Go to main branch
git merge my-new-feature      # Bring in your changes
```

---

## Using .gitignore

Create a file called `.gitignore` in your project:

```
# .gitignore example

# Folders to ignore
node_modules/
.vscode/

# Files to ignore
.DS_Store
*.log
config.secret.js
```

- Keeps your repository clean
- Prevents accidental commits of sensitive info
- Avoids uploading large files that can be recreated

---

# Practical File Management Tips

---

## Backups Are Important!

- Even with Git, have additional backups
- Simple options:
  - Use GitHub or other remote services
  - Regularly push your changes
  - Download ZIP backups for important milestones

**Remember:** Good file management includes having copies in multiple places!

---

## Dealing with Test Files

Most coding assignments include tests to check your work:

```
assignment/
├── src/           # Your code goes here
│   └── app.js     # This is what you edit
└── tests/         # Don't touch these!
    └── app.test.js
```

**Important rules:**
- Don't modify the test files
- Don't move them to different folders
- Make sure your file names match what tests expect
- Run tests frequently to check your progress

---

## Common Issues with Tests

If your tests are failing:

1. **Check file names** - Are they exactly as expected?
2. **Check file locations** - Are they in the right folders?
3. **Check function names** - Do they match what tests expect?
4. **Check exports** - Are you exporting what the tests need?

Example of what tests might expect:
```javascript
// Your file must export these exact functions
module.exports = {
  add: function(a, b) { return a + b; },
  subtract: function(a, b) { return a - b; }
};
```

---

# Working with HTML, CSS & JavaScript Files

---

## Basic Web Page Structure

Every web project needs these basic files:
```
my-website/
├── index.html         # Main page
├── css/
│   └── styles.css     # Your styles
└── js/
    └── script.js      # Your JavaScript
```
--- 

## Basic Web Page Structure 

In your HTML, link everything correctly:

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/styles.css">
  <title>My Website</title>
  <script src="js/script.js" defer></script>
</head>
<body>
  <h1>Hello World</h1>
</body>
</html>
```
---

## Organizing Multiple HTML Pages

For multi-page websites:

```
my-website/
├── index.html         # Home page
├── about.html         # About page
├── contact.html       # Contact page
├── css/
│   └── styles.css     # Shared styles
└── js/
    └── script.js      # Shared JavaScript
```

--- 

## Organizing Multiple HTML Pages

Link between pages:

```html
<nav>
  <a href="index.html">Home</a>
  <a href="about.html">About</a>
  <a href="contact.html">Contact</a>
</nav>
```

---

## Image Organization

For a few images:
```
my-website/
├── index.html
├── images/
│   ├── logo.png
│   ├── background.jpg
│   └── profile.jpg
└── css/
    └── styles.css
```

---

## Image Organization

In your HTML:
```html
<img src="images/logo.png" alt="Website Logo">
```

In your CSS:
```css
header {
  background-image: url('../images/background.jpg');
}
```

---

# Working with Provided Code

---

## Understanding Project Structure

When given a coding assignment:

1. **Explore the structure first:**
   - What files are there already?
   - Where are the tests located?
   - Are there example files to follow?

---

## Understanding Project Structure

2. **Read the README.md file:**
   - Instructions are usually here
   - May explain the folder structure
   - Tells you what files to create/modify

3. **Look for comments in files:**
   - Instructions may be in code comments
   - `// TODO:` comments show what to implement

---

## Examples of Assignment Structure

```
assignment/
├── README.md              # Instructions
├── src/                   # Your code goes here
│   ├── index.html         # You might edit this
│   ├── styles.css         # You might create this
│   └── app.js             # You definitely edit this
├── tests/                 # Don't touch these!
│   └── app.test.js        # Tests for your code
└── examples/              # Example files to learn from
    └── example-app.js
```

- Make changes only in the designated folders
- Follow the patterns in example files
- Don't modify test files unless specifically told to

---

## Understanding Test Requirements

Tests often look for specific file organization:

```javascript
// Example test file
const { expect } = require('chai');
const fs = require('fs');

describe('Project structure', () => {
  it('should have index.html in the root directory', () => {
    expect(fs.existsSync('./index.html')).to.be.true;
  });
  
  it('should have styles in a css folder', () => {
    expect(fs.existsSync('./css/styles.css')).to.be.true;
  });
});
```

This test checks if:
1. There's an `index.html` file in the main folder
2. There's a `styles.css` file inside a `css` folder

-

# Key Takeaways

---

## File Management Rules to Live By

1. **Be consistent** with naming and structure
2. **Keep related files together**
3. **Don't modify test files** in assignments
4. **Follow existing patterns** when working with provided code
5. **Use Git** to track changes and create branches for new features
6. **Run tests often** to make sure your file structure works

---

## Warning Signs of Poor File Management

- "I can't find the file I was working on yesterday..."
- "Which version of this file is the latest one?"
- "I'm not sure what this file was for..."
- "The tests are failing but I don't know why..."
- "My partner can't find where I put things..."

If you're saying these things, it's time to improve your file organization!

---

# Additional Tips and Tricks

---


## Organizing Files for Team Projects

When working with others:

1. **Agree on conventions first**
   - File naming (kebab-case? camelCase?)
   - Folder structure
   - Where to put different types of files
---
## Organizing Files for Team Projects

2. **Document your decisions**
   - Add a README.md with structure info
   - Comment your code
   - Use consistent patterns

---
## Organizing Files for Team Projects
3. **Respect others' work**
   - Don't rename files someone else is working on
   - Follow established patterns
   - Communicate before major changes

---

## Backup Strategies

Every developer should have multiple backup strategies:

1. **Git/GitHub** - Regular commits and pushes
2. **Local backups** - Copy important projects to external drive
3. **Cloud storage** - Dropbox/Google Drive for critical files
4. **ZIP archives** - Create ZIP backups for important milestones

Remember: **3-2-1 Backup Strategy**
- 3 copies of your data
- 2 different storage types
- 1 copy off-site

---

# Understanding Test Files Better

---

## How Tests Relate to Your Files

Tests look for:
1. **Specific file names** in specific locations
2. **Functions with exact names**
3. **Expected outputs** from those functions

---


## How Tests Relate to Your Files - Example

```javascript
// Your file: calculator.js
function add(a, b) {
  return a + b;
}

module.exports = { add };

// Test file: calculator.test.js
const { add } = require('./calculator');

test('add function works', () => {
  expect(add(2, 3)).toBe(5);
});
```

---

## What Tests Check About Your Files

Tests often check your file structure:

```javascript
// A test that checks file organization
test('project has correct file structure', () => {
  // Check if HTML file exists
  expect(fs.existsSync('./index.html')).toBe(true);
  
  // Check if CSS is in the right place
  expect(fs.existsSync('./css/styles.css')).toBe(true);
  
  // Check if JavaScript is in the right place
  expect(fs.existsSync('./js/main.js')).toBe(true);
});
```

If this test fails, you need to check your file names and locations!

---

# Additional Resources

---

## Learning Resources

- [MDN: Organizing your CSS](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Organizing)
- [GitHub's Git Cheat Sheet](https://training.github.com/downloads/github-git-cheat-sheet/)
- [Visual Studio Code File Management Tips](https://code.visualstudio.com/docs/getstarted/tips-and-tricks)

---

# Thank You!

Remember: Good file management might seem boring, but it will save you HOURS of frustration later!

"A place for everything, and everything in its place."