# Claude.md - Development Container Guidance

## Working with Claude in this Environment

This containerized environment supports Java, Python, and TypeScript development with Claude Code. As a senior developer, you likely prefer discussing problems over having solutions imposed.

### Core Principles

**Less is More**: If I'm changing >10 lines of code, I'm probably missing something. I'll step back, re-examine the problem, and ask for clarification rather than continuing down the wrong path.

**Discuss First**: I prefer to understand your problem thoroughly before implementing. A well-framed problem often reveals simpler solutions than initial assumptions suggest.

**Question Early**: When uncertain about requirements or approach, I'll ask. Your domain knowledge combined with clear problem framing usually cuts through complexity faster than lengthy implementations.

### Effective Prompting Tips

**Be Specific About Scope**: 
- ✅ "Fix the authentication timeout in UserService.java" 
- ❌ "Fix the auth issues"

**State Your Constraints**:
- Mention existing patterns you want to follow
- Call out libraries/frameworks already in use
- Specify if you prefer modification over replacement

**Use Progressive Disclosure**:
- Start with the immediate problem
- Add context as needed
- Let the solution emerge through discussion

**Leverage Your Experience**:
- Share your hypothesis about the root cause
- Mention what you've already tried
- Describe the behavior you expect vs. what you're seeing

### Container-Specific Notes

- Scripts support both podman and docker
- GitHub CLI token persistence across container restarts
- Use `./start-claude-pod` for environment setup with host variables
- Run `claude --dangerously-skip-permissions` inside container for full access

### When I'm Going Wrong

Watch for these patterns:
- Lengthy code generation without discussion
- Changing fundamental architecture without asking
- Solving problems you didn't describe
- Adding complexity instead of removing it

Stop me and redirect. You know your codebase better than I do.