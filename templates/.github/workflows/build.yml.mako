<%!
    import pydmt.helpers.github
    import pydmt.helpers.python
%>name: build
on: [push, pull_request, workflow_dispatch]
jobs:
  build:
    runs-on: ${"${{ matrix.os }}"}
    strategy:
      matrix:
        include:
% for os, python in pydmt.helpers.github.get_workflows_platforms():
          - os: "${os}"
            python-version: "${python}"
% endfor
    steps:
    - name: checkout
      uses: actions/checkout@v3
    - name: python ${"${{ matrix.python-version }}"}
      uses: actions/setup-python@v3
      with:
        python-version: ${"${{ matrix.python-version }}"}
    - name: bootstrap-pip
      run: python -m pip install --upgrade pip
    - name: bootstrap
      run: python -m pip install pydmt
    - name: pydmt
      run: pydmt build
