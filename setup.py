import setuptools

setuptools.setup(
  name="rrq",
  version="0.0.0",
  description="python project run in docker",
  packages=setuptools.find_packages("src"),
  package_dir={"": "src"},
)
