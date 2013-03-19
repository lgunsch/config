import os


pristine_path = '/home/lgunsch/.config/sublime-text-2/Pristine Packages/'
packages_path = '/home/lgunsch/.config/sublime-text-2/Packages/'

pristine = []
for pkg in os.listdir(pristine_path):
    name = pkg.replace('.sublime-package', '')
    pristine.append(name)

all_ = os.listdir(packages_path)

installed = sorted(list(set(all_) - set(pristine)))
for package in installed:
    print package
