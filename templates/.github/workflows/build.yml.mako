<%!
    import config.python
%>name: build
on: [push, pull_request]
jobs:
  build:
    runs-on: ${"${{ matrix.os }}"}
    strategy:
      matrix:
        os: ${config.python.test_os}
        python-version: ${config.python.test_python}
    steps:
    - uses: actions/checkout@v2
    - name: Install system-wide dependencies
      run: sudo apt-get install lilypond qpdf
    - name: Set up Python ${"${{ matrix.python-version }}"}
      uses: actions/setup-python@v1
      with:
        python-version: ${"${{ matrix.python-version }}"}
    - name: Install python dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    - name: Build
      run: |
        make clean_docs
        make all all_tunes
