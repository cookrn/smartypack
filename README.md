SmartyPack
==========

Helping you build SmartOS machine images with Packer since 2015.

* Packer: https://packer.io/
* SmartOS: https://smartos.org/

## Installation

Step by step:

* Install Packer: https://packer.io/downloads.html
* `git clone https://github.com/cookrn/smartypack`

## Usage

After completing the previous steps: `cd smartypack && make`

## Features

Currently, SmartyPack outputs a single build artifact: a SmartOS
[Vagrant](https://www.vagrantup.com/) box usable with the
[VirtualBox](https://www.virtualbox.org/) provider. It would be wonderful to support
a more diverse set of artifacts and features moving forward. Please
[open issues](https://github.com/cookrn/smartypack/issues/new) with any feature
requests. Also, [pull requests](https://github.com/cookrn/smartypack/blob/master/README.md#contributing)
are most welcome!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

[MIT](https://github.com/cookrn/smartypack/tree/master/License.txt).
