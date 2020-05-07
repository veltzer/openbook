<%!
    import config.python
%>name: build
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
jobs:
  build:
    name: Build on ${"${{ matrix.container }}"}
    runs-on: ubuntu-latest
    container: ${"${{ matrix.container }}"}
    strategy:
      matrix:
        container: ${config.python.test_container}
        python-version: ${config.python.test_python}
    steps:
    - uses: actions/checkout@v2
    - name: Install system-wide dependencies
      run: |
        apt-get update
        apt-get install -y lilypond qpdf python3
    - name: Set up Python ${"${{ matrix.python-version }}"}
      uses: actions/setup-python@v1
      with:
        python-version: ${"${{ matrix.python-version }}"}
    - name: Install python dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    - name: Build
      run: make
    - name: BuildAllTunes
      run: make all_tunes
