FROM openjdk:17

ADD target/static-0.0.1-SNAPSHOT.jar static-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java" , "-jar" , "static-0.0.1-SNAPSHOT.jar"]


# Use Ubuntu as the base image
#FROM ubuntu:20.04
#
## Update the package lists and install OpenJDK 17
#RUN apt-get update && \
#    apt-get install -y openjdk-17-jre-headless
#
## Create a directory for your application
#RUN mkdir /app
#
## Copy your JAR file into the container
#COPY target/static-0.0.1-SNAPSHOT.jar /app/static-0.0.1-SNAPSHOT.jar
#
## Set the working directory
#WORKDIR /app
#
## Define the entry point to run your Java application
#CMD ["java", "-jar", "static-0.0.1-SNAPSHOT.jar"]


#FROM ubuntu:20.04
#
### Update the package lists and install OpenJDK 17
#RUN apt-get update && \
#    apt-get install -y openjdk-17-jre-headless
#
#
#ARG TERRAFORM_VERSION=1.5.7
#
#RUN \
#	# Update
#	apt-get update -y && \
#	# Install dependencies
#	apt-get install unzip wget -y
#
################################
## Install Terraform
################################
#
## Download terraform for linux
#RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#
#RUN \
#	# Unzip
#	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
#	# Move to local bin
#	mv terraform /usr/local/bin/ && \
#	# Make it executable
#	chmod +x /usr/local/bin/terraform && \
#	# Check that it's installed
#	terraform --version
#
#CMD ["terraform", "--version"]
#CMD ["maven" , "--version"]



#FROM ubuntu:20.04
#
#
#RUN apt-get update  \
#    && apt-get install unzip wget -y \
#    && apt-get install -y apt-transport-https \
#    && apt-get install -y gnupg software-properties-common \
#    && wget -O- https://apt.releases.hashicorp.com/gpg | \
#       gpg --dearmor | \
#       tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#    && gpg --no-default-keyring \
#       --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#       --fingerprint \
#    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
#       https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
#       tee /etc/apt/sources.list.d/hashicorp.list \
#    && apt update \
#    && apt-get install terraform
#
#CMD ["terraform", "--version"]


## Use a base image with the necessary tools
#FROM ubuntu:20.04
#
## Update the package lists and install essential tools
#RUN apt-get update \
#    && apt-get install -y unzip wget apt-transport-https gnupg software-properties-common
#
## Download HashiCorp GPG key and add HashiCorp repository
#RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
#    gpg --dearmor | \
#    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#    && gpg --no-default-keyring \
#       --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#       --fingerprint \
#    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
#       https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
#       tee /etc/apt/sources.list.d/hashicorp.list \
#    # Update the package lists with the new repository
#    && apt-get update \
#    ## Install Terraform
#    && apt-get install -y terraform \
#    ## Create a script to install autocomplete (if needed)
#    && echo "terraform -install-autocomplete" > /usr/local/bin/install-autocomplete && \
#           chmod +x /usr/local/bin/install-autocomplete
#
## Set the default command to start a bash shell
#CMD ["/bin/bash"]
#CMD ["terraform" , "--version"]
#

# Update the package lists with the new repository
#RUN apt-get update
#
## Install Terraform
#RUN apt-get install -y terraform
#
## Create a script to install autocomplete (if needed)
#RUN echo "terraform -install-autocomplete" > /usr/local/bin/install-autocomplete && \
#    chmod +x /usr/local/bin/install-autocomplete




