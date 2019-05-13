FROM python:3.7.3-stretch
COPY requirements.txt /

RUN pip3 install --trusted-host=pypi.org --trusted-host=pypi.python.org --trusted-host=files.pythonhosted.org --upgrade pip && pip install --trusted-host=pypi.org --trusted-host=pypi.python.org --trusted-host=files.pythonhosted.org -r /requirements.txt


COPY entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
