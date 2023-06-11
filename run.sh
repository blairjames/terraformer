#!/usr/bin/env bash

# Return half the total number of CPUs
get_cpus() {
  local total_cpus
  local half_cpus
  total_cpus=$(grep -c processor /proc/cpuinfo)
  half_cpus=$(( "${total_cpus}" / 2 ))
  echo "${half_cpus}"
}

# Return one twentieth of the total memory
get_mem() {
  local total_mem
  local fraction_of_mem
  local megabytes
  total_mem=$(echo $(for x in $(head -n1 /proc/meminfo); do echo $x ; done) | cut -d " " -f 2)
  fraction_of_mem=$(( "${total_mem}" / 20 ))
  megabytes=$(( "${fraction_of_mem}" / 1024 ))
  echo "${megabytes}"MB
}

run() {
  local cpus
  local mem
  local cmd
  local image
  image="terraformer:latest"
  cpus="${1}"
  mem="${2}"
  echo Running Terraformer with "${mem}" memory and "${cpus}" cpus. 
  cmd="sudo docker run --rm -it --memory "${mem}" --cpus="${cpus}" \
	  --name terraformer --hostname terraformer "${image}""
  bash -c "${cmd}"
}

main() {
  local cpus
  local mem
  cpus=$(get_cpus)
  mem=$(get_mem)
  run "${cpus}" "${mem}"
}

main

