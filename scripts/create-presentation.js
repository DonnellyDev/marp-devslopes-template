import fs from "fs-extra";
import path from "path";
import { fileURLToPath } from "url";
import readline from "readline";

// ES module equivalent for __dirname
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Template for a new presentation
const template = `---
marp: true
theme: devslopes
paginate: true
footer: "Your Presentation Title"
---

<!-- _class: title -->
# Your Presentation Title
## Subtitle Goes Here

---

# What We Are Going to Cover

- **Topic 1** - Description
- **Topic 2** - Description
- **Topic 3** - Description
- **Topic 4** - Description

---

# First Section

Content goes here

`;

// Function to create a new presentation
async function createPresentation() {
  try {
    // Ask for presentation name
    rl.question(
      'Enter a name for your new presentation (use lowercase and hyphens, e.g., "web-security"): ',
      async (name) => {
        // Validate presentation name
        if (!/^[a-z0-9-]+$/.test(name)) {
          console.error(
            "Error: Presentation name should only contain lowercase letters, numbers, and hyphens"
          );
          rl.close();
          return;
        }

        // Ask for presentation title
        rl.question(
          "Enter the title for your presentation: ",
          async (title) => {
            // Define paths
            const presentationsDir = path.join(
              __dirname,
              "..",
              "presentations"
            );
            const newPresentationDir = path.join(presentationsDir, name);
            const imagesDir = path.join(newPresentationDir, "images");
            const mdFile = path.join(newPresentationDir, `${name}.md`);

            // Check if directory already exists
            if (await fs.pathExists(newPresentationDir)) {
              console.error(
                `Error: Presentation directory '${name}' already exists`
              );
              rl.close();
              return;
            }

            try {
              // Create directories
              await fs.ensureDir(presentationsDir);
              await fs.ensureDir(newPresentationDir);
              await fs.ensureDir(imagesDir);

              // Create markdown file with template
              const templateContent = template.replace(
                "Your Presentation Title",
                title
              );
              await fs.writeFile(mdFile, templateContent);

              console.log(`✅ Successfully created new presentation: ${name}`);
              console.log(`📂 Location: ${newPresentationDir}`);
              console.log(`📝 Edit the file: ${mdFile}`);
              console.log("\nTo preview your presentation:");
              console.log(`npm run watch ${name}`);
              console.log("\nTo generate a PDF:");
              console.log(`npm run build ${name}`);

              rl.close();
            } catch (err) {
              console.error("Error creating presentation:", err);
              rl.close();
            }
          }
        );
      }
    );
  } catch (err) {
    console.error("Error:", err);
    rl.close();
  }
}

createPresentation();
