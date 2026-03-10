terraform {
  required_version = ">= 1.14.0"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.7"
    }
  }
}

provider "libvirt" {
<<<<<<< ours
  uri = var.libvirt_uri
}
=======
  uri = "qemu+ssh://terraform@100.110.30.13/system?keyfile=/home/github-runner/.ssh/github_vds"
<<<<<<< ours
}
>>>>>>> theirs
=======
}
>>>>>>> theirs
