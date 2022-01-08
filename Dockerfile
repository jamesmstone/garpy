FROM python
ADD pyproject.toml /pyproject.toml
RUN python3 --version && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade poetry && \
    poetry install
ADD . /
RUN python3 --version && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade poetry && \
    poetry install && \
    poetry build
#RUN poetry run pytest --cov-report term-missing --cov=garpy tests/
#RUN python3 -m coveralls
ENTRYPOINT ["poetry"]
CMD ["run", "garpy"]