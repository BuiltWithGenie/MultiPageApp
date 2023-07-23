# pull latest julia image
FROM julia:latest
# create dedicated user
RUN useradd --create-home --shell /bin/bash genie
# set up the app
RUN mkdir -p /home/genie/MultiPageapp
COPY . /home/genie/
WORKDIR /home/genie/

# configure permissions
RUN chown -R genie:genie /home/genie
# switch user
USER genie
# instantiate Julia packages
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile();"
run cd /home/genie/app/EDA/
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile();"
run cd /home/genie/app/ML/
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile();"
run cd /home/genie/app/API/
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile();"

# ports
EXPOSE 8000
EXPOSE 80
# set up app environment
ENV JULIA_DEPOT_PATH "/workspaces/.julia"
ENV JULIA_REVISE = "off"
ENV GENIE_ENV "prod"
ENV GENIE_HOST "0.0.0.0"
ENV PORT "8000"
ENV WSPORT "8000"
# ENV EARLYBIND=true
ENV EARLYBIND "true"
# run app
# CMD ["bin/server"]
# ENTRYPOINT ["julia", "--project", "-e", "using GenieFramework; Genie.loadapp(); up(async=false);"]
