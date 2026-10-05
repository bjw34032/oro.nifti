##
## Copyright (c) 2009, 2010, 2011, 2012, 2013 Brandon Whitcher and Volker Schmid
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are
## met:
##
##     * Redistributions of source code must retain the above copyright
##       notice, this list of conditions and the following disclaimer.
##     * Redistributions in binary form must reproduce the above
##       copyright notice, this list of conditions and the following
##       disclaimer in the documentation and/or other materials provided
##       with the distribution.
##     * The names of the authors may not be used to endorse or promote
##       products derived from this software without specific prior
##       written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
## "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
## LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
## A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
## HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
## SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
## LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
## DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
## THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##
## $Id: $
##

.onLoad <- function(lib, pkg) {
  options("niftiAuditTrail" = FALSE)
}

rule <- function(pad = "-", gap = 2L) {
  paste0(rep(pad, getOption("width") - gap), collapse = "")
}

.onAttach <- function(lib, pkg) {
  txt <- paste(pkg, utils::packageDescription(pkg, lib)[["Version"]])
  packageStartupMessage(txt)
  setHook(packageEvent("RNifti", "attach"), function(...) {
    packageStartupMessage(rule())
    packageStartupMessage(
      "You have loaded RNifti after oro.nifti ", 
      "(either directly or from another package) - this is likely ",
      "to cause problems with certain functions.\n", 
      "If you need functions from both RNifti and oro.nifti, ",
      "please load RNifti first, then oro.nifti:\n", 
      "library(RNifti); library(oro.nifti)"
    )
    packageStartupMessage(rule())

  })
}



.onDetach <- function(libpath) {
  setHook(packageEvent("RNifti", "attach"), NULL, "replace")
}
