FROM rocker/shiny:latest

# Install R packages required for the Shiny app
RUN R -e "install.packages('shiny', repos='https://cloud.r-project.org/')"

# Copy the Shiny app code to the image
COPY . /srv/shiny-server/

# Set environment variables
ENV PORT=3838

# Expose the port the app runs on
EXPOSE 3838

# Run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app.R', host = '0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
