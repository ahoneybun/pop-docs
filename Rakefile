####################################################################################           
# Rakefile for the Ubuntu Documentation Website
# Copyright (C) 2005-2006 Ubuntu Documentation Project (ubuntu-doc@lists.ubuntu.com)
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version. 
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#    On Debian based systems a copy of the GPL can be found 
#    at /usr/share/common-licenses/GPL
####################################################################################

require 'fileutils'
include FileUtils

XSLTPROC      = "/usr/bin/xsltproc"
NWDBXSL       = "/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl"
INDEXCHUNKXSL = "libs/index-html-chunk-cust.xsl"
BASE          = "build/"

[XSLTPROC,NWDBXSL,INDEXCHUNKXSL,BASE].each do |file| 
	raise "#{file} does not exist." unless FileTest.exists?(file)
end

def indexcommand(cc=false)
	"xsltproc --stringparam root.filename \"index#{'.cc' if cc}\" " +
	"-o #{BASE} #{INDEXCHUNKXSL} website-index/#{cc ? 'cc' : 'C'}" +
	"/website-index.xml"
end

def xmllint(*files)
	puts IO.popen("xmllint --noout --xinclude --noent --postvalid #{files.join(' ')}").readlines
end

task :default => [:website]

task :website => [:index] do
	puts "Building the Ubuntu Docs . . ."
	system("make -C ubuntu -f Makefile all pdf")
	puts "Building the Kubuntu Docs . . ."
	system("make -C kubuntu -f Makefile all pdf")
end

task :index do
	system(indexcommand)
	cp "libs/index.css", BASE
end

task :index_cc do
	system(indexcommand(true))
	cp "libs/index.css", BASE
end

task :validate do
	xmllint ARGV.size > 1 ? ARGV[1..-1] : "website-index/C/website-index.xml"
end
