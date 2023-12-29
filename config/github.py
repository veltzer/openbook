import pydmt.helpers.project

if pydmt.helpers.project.get_name().startswith("py"):
    workflows_platforms = [
        ("ubuntu-22.04", "3.12"),
        ("ubuntu-22.04", "3.11"),
        ("ubuntu-22.04", "3.10"),
    ]
else:
    workflows_platforms = [
        ("ubuntu-22.04", "3.11"),
    ]
