# Get Started with CI/CD for Modern AI & ML projects

This repository contains example CI/CD configurations for machine learning projects, showing how to build, test, train, and deploy ML models using modern DevOps practices. You'll find equivalent examples for both **GitLab CI/CD** and **GitHub Actions** to help you learn these important concepts regardless of your platform choice.

## What's Included

### 📋 **Complete Example Mapping**

| Example Level | GitLab CI | GitHub Actions | Description |
|---------------|-----------|----------------|-------------|
| **Basic** | `gitlab-examples/1-get-started.yml` | `.github/workflows/1-get-started.yml` | Fundamental CI/CD concepts |
| **Intermediate** | `gitlab-examples/2-understanding-cicd.yml` | `.github/workflows/2-understanding-cicd.yml` | Docker & artifacts |
| **Advanced** | `gitlab-examples/3-best-practices-gitlab.yml` | `.github/workflows/3-best-practices-github.yml` | Production-ready patterns |

### GitLab CI Examples
- `gitlab-examples/1-get-started.yml`: Basic GitLab CI pipeline showing fundamental concepts
- `gitlab-examples/2-understanding-cicd.yml`: Intermediate example with Docker and artifacts
- `gitlab-examples/3-best-practices-gitlab.yml`: Advanced production-ready pipeline with security scanning, caching, and proper deployment strategies

### GitHub Actions Examples  
- `.github/workflows/1-get-started.yml`: Basic GitHub Actions workflow (equivalent to GitLab example 1)
- `.github/workflows/2-understanding-cicd.yml`: Intermediate example with Docker and artifacts (equivalent to GitLab example 2)
- `.github/workflows/3-best-practices-github.yml`: Advanced production-ready workflow with modern GitHub Actions features

### Active Configuration
- `.gitlab-ci.yml`: The current GitLab CI configuration (copy content from examples to activate)
- `.github/workflows/github-ci.yml`: Simple GitHub Actions workflow (equivalent to .gitlab-ci.yml approach)

## Learning Path

### 🚀 **Start Here: Basic Concepts**
Begin with the basic examples to understand CI/CD fundamentals:
- **GitLab CI**: `gitlab-examples/1-get-started.yml`
- **GitHub Actions**: `.github/workflows/1-get-started.yml`

These show the core concepts:
- Pipeline stages (build, train, deploy)
- Job dependencies
- Basic scripting

### 📦 **Next: Intermediate Concepts**
Move to the intermediate examples to learn about:
- **GitLab CI**: `gitlab-examples/2-understanding-cicd.yml`  
- **GitHub Actions**: `.github/workflows/2-understanding-cicd.yml`

These demonstrate:
- Docker integration
- Artifacts and dependencies between jobs
- More realistic ML workflows

### 🏭 **Advanced: Production-Ready Pipelines**
Finally, explore the advanced examples for production use:
- **GitLab CI**: `gitlab-examples/3-best-practices-gitlab.yml`
- **GitHub Actions**: `.github/workflows/3-best-practices-github.yml`

These include:
- Security scanning (safety, bandit)
- Caching for performance
- Multiple environments (staging, production)
- Quality gates and model validation
- Modern container practices
- Proper secret management



## Platform Comparison

| Feature | GitLab CI | GitHub Actions |
|---------|-----------|----------------|
| **Triggers** | `workflow:rules` | `on:` events |
| **Jobs** | `job_name:` | `jobs: job_name:` |
| **Dependencies** | `needs: [job]` | `needs: job` |
| **Artifacts** | `artifacts:` | `upload-artifact`/`download-artifact` |
| **Environments** | `environment:` | `environment:` |
| **Manual approval** | `when: manual` | `environment:` protection |
| **Caching** | `cache:` | `actions/cache` |
| **Container registry** | `$CI_REGISTRY` | `ghcr.io` |

## Prerequisites

- Python 3.9+
- [uv](https://docs.astral.sh/uv/) (recommended for dependency management)
- Git
- GitLab account (for GitLab CI) or GitHub account (for GitHub Actions)

## Installation

```bash
# Clone the repository
git clone https://github.com/mlrepa/cicd-for-modern-ai
cd cicd-for-modern-ai

# Install dependencies with uv (recommended - faster and more reliable)
uv pip install -e .

# Or install development dependencies
uv pip install -e .[dev]

# Traditional pip approach (slower)
pip install -e .
```

## How to Use These Examples

### For GitLab CI/CD

1. **Choose an example**: Start with `gitlab-examples/1-get-started.yml` for basics
2. **Copy to root**: Copy the content to `.gitlab-ci.yml` in your repository
3. **Customize**: Modify variables and scripts for your specific project
4. **Push and run**: Commit your changes to trigger the pipeline

```bash
# Example: Use the basic pipeline
cp gitlab-examples/1-get-started.yml .gitlab-ci.yml
git add .gitlab-ci.yml
git commit -m "Add basic CI/CD pipeline"
git push
```

### For GitHub Actions

**Option 1: Use the Active Configuration (Recommended)**
```bash
# The default workflow is already at .github/workflows/github-ci.yml
# Just customize it for your needs and push
git add .github/workflows/github-ci.yml
git commit -m "Update CI/CD workflow"
git push
```

**Option 2: Choose from Examples**
1. **Choose an example**: Start with `.github/workflows/1-get-started.yml`
2. **Copy content**: Copy the content to `.github/workflows/github-ci.yml` or rename the file
3. **Customize**: Modify the workflow for your specific needs
4. **Push and run**: Commit your changes to trigger the workflow

## Key Concepts Explained

### Stages vs Jobs
- **Stages**: Logical groups of work (build, test, deploy)
- **Jobs**: Individual tasks within stages that can run in parallel

### Artifacts
- **Purpose**: Pass files between jobs (models, test results, etc.)
- **GitLab**: Built-in `artifacts:` section
- **GitHub**: Use `upload-artifact` and `download-artifact` actions

### Environments and Deployments
- **Staging**: Test your deployment before production
- **Production**: Live environment with manual approval gates
- **Benefits**: Safe deployment practices and rollback capabilities

### Security Best Practices
- Store secrets securely (never in code!)
- Scan dependencies for vulnerabilities
- Use minimal container images
- Implement proper access controls

## Common ML Pipeline Patterns

### 1. **Feature Development Flow**
```
Code Change → Build → Test → Train Model → Validate → Deploy to Staging
```

### 2. **Production Deployment Flow**  
```
Staging Success → Manual Approval → Deploy to Production → Monitor
```

### 3. **Experiment Tracking Flow**
```
Train Multiple Models → Compare Metrics → Select Best → Deploy Winner
```

## Modern Python Dependency Management

This repository uses modern Python tooling:

### pyproject.toml
- **Replaces**: `requirements.txt` 
- **Benefits**: Single file for project metadata, dependencies, and tool configuration
- **Structure**: Core dependencies in `[project]`, dev tools in `[project.optional-dependencies]`

### uv Package Manager
- **Why uv**: 10-100x faster than pip, better dependency resolution, drop-in replacement
- **Installation**: `curl -LsSf https://astral.sh/uv/install.sh | sh`
- **Usage**: `uv pip install -e .` instead of `pip install -e .`

### Dependency Groups
```bash
# Install core ML dependencies
uv pip install -e .

# Install development tools (pytest, black, ruff, mypy)
uv pip install -e .[dev]

# Install security scanning tools
uv pip install -e .[security]

# Install everything for CI/CD
uv pip install -e .[ci]
```

## Advanced Topics

Once you're comfortable with the basics, explore these advanced patterns:

- **Model Versioning**: Track model versions and metadata
- **A/B Testing**: Deploy multiple model versions for comparison  
- **Monitoring**: Set up alerts for model performance degradation
- **Blue-Green Deployments**: Zero-downtime deployments
- **Canary Releases**: Gradual rollout to minimize risk

## Troubleshooting

### Common Issues

**GitLab CI Pipeline Fails**
- Check the GitLab CI lint tool: `Repository → CI/CD → Editor`
- Verify your YAML syntax
- Check variable names and job dependencies

**GitHub Actions Workflow Fails**
- Check the Actions tab in your repository
- Verify workflow syntax with VS Code GitLab/GitHub extensions
- Check artifact names and dependencies

**Docker Issues**
- Ensure Docker-in-Docker service is enabled
- Check image tags and registry permissions
- Verify Dockerfile exists if building custom images

### Getting Help

- **GitLab CI Docs**: https://docs.gitlab.com/ee/ci/
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **Community**: Create issues in this repository for questions

## Next Steps

1. **Start with the basic examples** to understand core concepts
2. **Experiment** with your own ML projects  
3. **Graduate to advanced examples** as your needs grow
4. **Contribute back** improvements and new examples!

Remember: The goal is to automate repetitive tasks, ensure consistent quality, and deploy ML models safely and reliably. Start simple and build complexity gradually as you learn.

---

*This repository focuses on teaching CI/CD concepts for ML projects. The examples are intentionally simplified for learning - see the "best practices" examples for production-ready patterns.*
