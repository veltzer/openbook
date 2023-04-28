import pydmt.helpers.project

if pydmt.helpers.project.get_name().startswith("py"):
    workflows_platforms = [
        ("ubuntu-22.04", "3.10"),
        ("ubuntu-20.04", "3.9"),
        ("ubuntu-20.04", "3.8"),
    ]
else:
    workflows_platforms = [
        ("ubuntu-22.04", "3.10"),
    ]
