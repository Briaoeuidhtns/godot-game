FROM circleci/python:3.8.0

ARG GODOT_VERSION=3.1.1
ARG GODOT_VARIANT=stable

WORKDIR "/home/circleci"

COPY requirements.txt requirements.txt
RUN sudo pip install -r requirements.txt && rm requirements.txt

RUN echo "ipv6" | sudo tee -a /etc/modules > /dev/null \
    && wget \
"http://download.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_linux_headless.64.zip" \
"http://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz" \
    && unzip Godot_v*_linux_headless.64.zip \
    && sudo mv Godot_v*_linux_headless.64 /bin/godot \
    && mkdir -p ~/.local/share/godot/templates \
    && unzip Godot_v*_export_templates.tpz \
    && mv templates/ ~/.local/share/godot/templates/${GODOT_VERSION}.${GODOT_VARIANT}/ \
    && rm -f *.zip *.tpz

RUN mkdir -p ~/.cache && mkdir -p ~/.config/godot