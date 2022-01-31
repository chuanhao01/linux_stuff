# Arch Linux

## Xorg
As I understand it, running hardware accerlation requires the driver be installed.
[Main Ref](https://wiki.archlinux.org/title/Hardware_video_acceleration)

There are 3 different kinds:
- VAAPI/VA-API
    - Mainly Intel supported
- VDAPU
    - Open Sourced and Backed up Nvidia
- Nvidia/NVDECODE/NVENCODE
    - Nvidia Prop

Now Based on the table shown, the proper API has to be used by the GPU and application.
So in my case, the Nvidia GPU has to be able to run the API and the app need to be able to use the API to be hardware accerlerated.

### Translation Layers

My idea is that the backend, is what is the needed API and the driver is what it is converting it into.
For example:
- libvdpau-va-gl, VDPAU driver with OpenGL/VAAPI backend
    - This means that given the OpenGL/VAAPI installed, you can use this translation layer to run vdpau APIs


### Nvidia
In my case of Nvidia GPUs, assuming we use the `nvidia` driver and `nvidia-utils`
This provides support for:
- VDPAU
- NVENCODE
- NVDECODE

You can then read the specific sections for those in the arch linux article

#### nvidia-vaapi-driver
[Repo](https://github.com/elFarto/nvidia-vaapi-driver/)
[Main Chrome Issue](https://github.com/elFarto/nvidia-vaapi-driver/issues/5)

So very recent and exciting development
Using NVENCODE/NVDECODE backend, run VAAPI drivers
Allowing hardware accerleration for more apps, mainly browsers and electron

For more context and big brain stuff, look at the [original forum post](https://forums.developer.nvidia.com/t/whats-the-situation-with-vdpau-vaapi-nvdec/61031).
[Release Nvidia Forum Issue](https://forums.developer.nvidia.com/t/nvidia-va-api-implementation-v0-0-1-release/199437)

Reading more into it:
- Using hardware decoding might use more power and system resources
    - This is due to the GPU not using the correct power settings and such
- VDPAU might result in lower power usage, but overall just use software decoding

#### Chrome specific
[Arch Chrome Page](https://wiki.archlinux.org/title/Chromium#Hardware_video_acceleration)
[Arch Issue Tracking this]()

Since I am using the default, `google-chrome-stable` need to do it myself
So I am using 
