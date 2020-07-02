#!/usr/bin/python3

# System Imports
from json import loads as json_load
from os import getenv
from os import remove as delete_file
from os import symlink
from os.path import exists as path_exists
from pathlib import PurePath
from sys import exit as sys_exit
from urllib.request import urlopen

# Local Imports
from python_logger import create_logger

def main():
  logger = create_logger(PurePath(__file__).stem)

  timezone = getenv('TIMEZONE', None)

  if not timezone:
    try:
      ip_address = urlopen('https://canhazip.com/').read().decode('utf-8')
      web_text = urlopen(f'http://ip-api.com/json/{ip_address}').read().decode('utf-8')
      timezone = json_load(web_text).get('timezone', 'Etc/UTC')
    except:
      logger.debug('Unable to automatically divine timezone leaving set to UTC')
      sys_exit()

  if timezone:
    timezone_path = f'/usr/share/zoneinfo/{timezone}'
    if not path_exists(timezone_path):
      logger.debug('Timezone {timezone} does not seem to be installed on this system.')
      sys_exit()

    local_time_path = '/etc/localtime'
    if path_exists(local_time_path):
      delete_file(local_time_path)
    symlink(timezone_path, local_time_path)
    logger.info(f'Timezone {timezone} has been set sucessfully.')

if __name__ == "__main__":
  main()
