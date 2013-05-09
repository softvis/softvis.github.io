softvis.github.io
=================

Website for the Softvis Project. 

To make changes simply check out the master branch, modify files, and push back to Github. The page generator ([Jekyll][]) runs on Github's servers. So, pushing the "source" of the site to master is sufficient. In contrast to Octopress, no brances are needed.

	git clone git@github.com:softvis/softvis.github.io.git
	...
	git commit -m "Some changes"
	git push

To preview changes locally, switch to Ruby 1.9.3, then:

    gem install jekyll
    jekyll --auto --server


The CSS sheets are generated with [SASS][]. This does not run on Github's servers so changes need to be compiled locally:

	gem install sass
	gem install rb-fsevent
	sass --style compressed --watch _sass:assets/stylesheets

Note that both the source (in the __sass_ directory) and the resulting output are checked in on the same branch.


  [Jekyll]: http://jekyllrb.com/
  [SASS]: http://sass-lang.com/
  