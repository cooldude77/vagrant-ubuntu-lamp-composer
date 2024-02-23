# vagrant-ubuntu-lamp-composer
Vagrant file for virtualbox Ubuntu/LAMP/Composer. Useful for development of Symfony Projects 

It is tedious to create a local environment which is error free and which is suitable to install a symfony project. 
With this configuration, you can install any project from composer.
This installs Ubuntu from Bento supplied by vagrant, upgrades it and then installs
# basic setup
# apache
# php 8
# mysql server
# composer

You can comment any provision statement in vagrantfile if you don't want to install that commponent

To complete this process on Windows
# install powershell
# install virtualbox
# install vagrant
# create a directory somewhere like c:\myDir
# clone this repo
# start powershell ( right click inside that directory in explorer)
# type vagrant up
# Create a folder html and use it for your project needs

# What it does to apache is 
 Replaces www-data user with vagrant
 Replaces www-data group with vagrant
# what it does to folder structure ( for use by symfony projects)
Makes vagrant owner of /var/cache and /var/logs
You will need to add this code to Symfony project #BaseKernel.php#

<code>
  <?php

namespace App;

use Symfony\Bundle\FrameworkBundle\Kernel\MicroKernelTrait;
use Symfony\Component\HttpKernel\Kernel as BaseKernel;

class Kernel extends BaseKernel
{
    use MicroKernelTrait;
    public function getCacheDir(): string
    {
        if($this->environment=="dev"){
            return '/var/cache'; //magic happens here

    }
        return dirname(__DIR__).'/var/'.$this->environment.'/cache';
}

    public function getLogDir(): string
    {
        if($this->environment=="dev"){
            return '/var/log'; //and here
    }
        return dirname(__DIR__).'/var/'.$this->environment.'/log';
    }
}

</code>
