from distutils.core import setup
from distutils.extension import Extension


setup(
	name = "apriltags",
	version = "1.0.dev1",
	description = "Cython bindings to AprilTags-C",
	url = "https://github.com/MOARbots/apriltags-python",
	author = "Liam Marshall",
	author_email = "archimedespi3141@gmail.com",
	license = "GPLv3",
	classifiers = [
		'Development Status :: 2 - Alpha',
		'Intended Audience :: Developers',
		'Intended Audience :: Education',
		'Topic :: Scientific/Engineering :: Image Recognition',
		'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
		'Programming Language :: Python :: 2.7',
		'Programming Language :: Cython'
	],
	keywords = 'computervision imagerecognition cython bindings apriltags tagging',
	packages = find_packages(),
	install_requires = ['cython']
)