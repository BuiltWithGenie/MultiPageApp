FROM julia:latest
RUN useradd --create-home --shell /bin/bash genie
RUN mkdir /home/genie/app
COPY . /home/genie/app
WORKDIR /home/genie/app
RUN chown -R genie:genie /home/
USER genie
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate();"
EXPOSE 8000
EXPOSE 80
ENV JULIA_DEPOT_PATH "/home/genie/.julia"
ENV JULIA_REVISE = "off"
ENV GENIE_ENV "prod"
ENV GENIE_HOST "0.0.0.0"
ENV PORT "8000"
ENV WSPORT "8000"
ENV EARLYBIND "true"
ENTRYPOINT ["julia", "--project", "-e", "using GenieFramework; Genie.loadapp(); up(async=false);"]

# Compile sysimage
# RUN julia --project -e "\
# using Pkg;\
# Pkg.activate(\".\");\
# Pkg.add(\"PackageCompiler\");\
# using PackageCompiler;\
# packages = [ x for x in keys(Pkg.installed())] ;\
# PackageCompiler.create_sysimage(\
#     packages;\
#     sysimage_path=\"sysimg.so\",\
#     cpu_target=PackageCompiler.default_app_cpu_target()\
# );\
# "
# ENTRYPOINT ["julia", "--sysimage", "/home/genie/app/sysimg.so","--project", "-e", "using GenieFramework; Genie.loadapp(); up(async=false);"]
