
Deploying to GitHub Pages
=========================

Several OME repositories use GitHub Pages to host static apps that are pushed to
specific branches and `published from that branch <https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site>`_.

For example:

 - https://ome.github.io/ome2024-ngff-challenge/ from https://github.com/ome/ome-ngff-validator/tree/gh-pages
 - https://ome.github.io/ome-ngff-validator/ from https://github.com/ome/ome2024-ngff-challenge/tree/gh-pages
 - https://will-moore.github.io/figure/ from https://github.com/will-moore/figure/tree/gh-pages
 - https://will-moore.github.io/omero_search_engine_client/ from https://github.com/will-moore/omero_search_engine_client/tree/gh-pages
 - https://idr.github.io/ome-ngff-samples/ from https://github.com/IDR/ome-ngff-samples


In general, we want the `main` or `master` branch to be built and deployed to the `gh-pages` branch
when changes are pushed. 

Several steps are needed:

Build step
----------

We need a ``build`` command that generates the static files to be deployed e.g. for JavaScript
apps, this might be a `npm run build` command. We use `vite.js` for several apps. See
https://vite.dev/guide/static-deploy for their docs.

For OMERO.figure, we have a specific `ghpages` command in the `package.json` file (see below).
This generates the static output (`index.html` and `assets/` directory) into the top-level
`gh-pages` directory. The `--base` directory is set to all *relative* links from the
`index.html` to the sibling `/assets/` directory, to allow hosting the app under a sub-directory
at https://github.com/will-moore/figure/.

The build step includes running a script at `./deploy_ghpages.sh` that simply adds an empty
`.nojekyll` file to the `gh-pages` directory. This is needed to prevent GitHub Pages from
using Jekyll to publish the site (which will ignore the `/assets/` directory).

.. code-block:: javascript

    {
      "scripts": {
        "ghpages": "vite build --base=./ --outDir ../gh_pages && ./deploy_ghpages.sh",
      }
    }

An alternative to a relative `--base` is to configure `base` in the `vite.config.js` to
correspond to the deploy location, for example:

.. code-block:: javascript

    if (process.env.GITHUB_REPOSITORY_OWNER) {
        config.base = `https://${process.env.GITHUB_REPOSITORY_OWNER}.github.io/ome2024-ngff-challenge/`;
    }

Test the build step with `npm run ghpages` or `npm run build` and check the output directory.

GitHub Actions
--------------

We use GitHub Actions to automate the build and deploy steps. This is configured in a file
`.github/workflows/ghpages.yml` in the repository. This file specifies the build and deploy
steps. Make sure that the branch corresponds to the `main` or `master` branch used by the repository.
The `run:` section specifies the build steps e.g. (`npm run build` or `npm run ghpages`
as described above). The `FOLDER` corresponds to the `--outDir` above, which is `build`
by default for `vite.js` apps. The `BRANCH` is the branch to push the build to, which is `gh-pages`.

.. code-block:: yaml

  push:
    branches:
      - master
    ...
      - name: Install and Build 🔧
        run: |
          npm install
          npm run build
      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@v4.7.2
        with:
          TOKEN: ${{ secrets.GITHUB_TOKEN }}
          BRANCH: gh-pages
          FOLDER: gh_pages

Once this `ghpages.yml` is pushed to the specified `main` or `master` branch of your repo, you
can check the `Actions` tab of the repo, e.g. https://github.com/ome/ome2024-ngff-challenge/actions
to see if the action ran and was successful. If so, you can check the output that was
pushed to the `gh-pages` branch, including the presence of 

GitHub Pages
------------

Finally, you need to configure the GitHub Pages settings for the repo above and check the
deployed site to trouble-shoot any issues. Good luck!
