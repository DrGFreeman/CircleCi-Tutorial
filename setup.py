from setuptools import find_packages, setup

from calculator import __version__

VERSION = __version__
NAME = "calculator"

setup(
    name=NAME,
    version=VERSION,
    description="A simple calculator",
    packages=find_packages(),
)
