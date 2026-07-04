/**
 * Paper Reading Toolkit plugin for OpenCode.ai.
 *
 * The skills themselves are discovered through OpenCode's native skill tool
 * from ~/.config/opencode/skills/paper-reading-toolkit.
 */

import fs from "fs";
import os from "os";
import path from "path";

const normalizePath = (value, homeDir) => {
  if (!value || typeof value !== "string") return null;
  const trimmed = value.trim();
  if (!trimmed) return null;
  if (trimmed === "~") return homeDir;
  if (trimmed.startsWith("~/")) return path.join(homeDir, trimmed.slice(2));
  return path.resolve(trimmed);
};

export const PaperReadingToolkitPlugin = async () => {
  const homeDir = os.homedir();
  const configDir =
    normalizePath(process.env.OPENCODE_CONFIG_DIR, homeDir) ||
    path.join(homeDir, ".config/opencode");
  const skillsDir = path.join(configDir, "skills/paper-reading-toolkit");
  const vaultPath =
    normalizePath(process.env.PAPER_READING_OBSIDIAN_VAULT, homeDir) ||
    path.join(homeDir, "Documents/Obsidian/Academic Research");

  const bootstrap = () => {
    const skillStatus = fs.existsSync(skillsDir)
      ? `Paper Reading Toolkit skills are installed at: ${skillsDir}`
      : `Paper Reading Toolkit skills should be installed at: ${skillsDir}`;

    return `<IMPORTANT>
You have Paper Reading Toolkit for academic paper reading.

Use OpenCode's native skill tool to load these skills when relevant:
- paper-reading-toolkit/deep-dive: paper, PDF, arXiv, project page, paper title, paper critique, paper archive.
- paper-reading-toolkit/memory-management: retrieve or write durable Academic Research notes.
- paper-reading-toolkit/beautify-output: polish dense paper or research explanations into clearer Markdown.

Default Academic Research vault:
${vaultPath}

${skillStatus}

For paper-reading requests, load paper-reading-toolkit/deep-dive first. Memory First retrieval is built into that workflow.
</IMPORTANT>`;
  };

  return {
    "experimental.chat.system.transform": async (_input, output) => {
      (output.system ||= []).push(bootstrap());
    },
  };
};
