# MATLAB Digital Filter Design Script

This MATLAB script is designed to create and analyze digital filters using the Butterworth filter design method. It supports the design of four types of filters: Low-Pass (LP), High-Pass (HP), Band-Pass (BP), and Band-Stop (BS) filters. The script uses the `buttord`, `buttap`, `zp2tf`, `lp2lp`, `lp2hp`, `lp2bp`, and `bilinear` functions to design and transform the filters.

## Features
- **Low-Pass Filter (LP):** Designs a low-pass filter based on user-defined cutoff and passband frequencies, as well as passband and stopband attenuations.
- **High-Pass Filter (HP):** Designs a high-pass filter using similar user inputs.
- **Band-Pass Filter (BP):** Designs a band-pass filter with specified lower and upper stopband and passband frequencies.
- **Band-Stop Filter (BS):** Designs a band-stop (notch) filter with specified lower and upper stopband and passband frequencies.

## How to Use
1. **Clone or Download the Script:**
   - Ensure you have MATLAB installed on your system.
   - Download or clone this repository to your local machine.

2. **Run the Script:**
   - Open MATLAB and navigate to the directory containing the script.
   - Run the script by typing its name in the MATLAB command window.

3. **Input Parameters:**
   - The script will prompt you to enter the following parameters for each filter:
     - Normalized cutoff frequency (`ws`).
     - Normalized passband frequency (`wp`).
     - Passband attenuation (`Ap`).
     - Stopband attenuation (`As`).
   - For Band-Pass and Band-Stop filters, you will need to input lower and upper frequencies for both stopband and passband.

4. **View Results:**
   - The script will generate frequency response plots for the designed filters using `freqs` and `freqz` functions.
   - Each filter design will display two figures:
     - The analog filter response (`freqs`).
     - The digital filter response (`freqz`).

## Code Structure
- The script is divided into sections for each filter type:
  - **Low-Pass Filter (LP):** Designs and analyzes a low-pass filter.
  - **High-Pass Filter (HP):** Designs and analyzes a high-pass filter.
  - **Band-Pass Filter (BP):** Designs and analyzes a band-pass filter.
  - **Band-Stop Filter (BS):** Designs and analyzes a band-stop filter.
- Each section clears the workspace and command window (`clear all; clc;`) before starting.

## Dependencies
- MATLAB Signal Processing Toolbox (for functions like `buttord`, `buttap`, `zp2tf`, `lp2lp`, `lp2hp`, `lp2bp`, and `bilinear`).

## Example Inputs
- For a **Low-Pass Filter**:
  - `ws = 0.5` (normalized stopband frequency).
  - `wp = 0.3` (normalized passband frequency).
  - `Ap = 3` (passband attenuation in dB).
  - `As = 40` (stopband attenuation in dB).

- For a **Band-Pass Filter**:
  - `ws = [0.1, 0.9]` (lower and upper stopband frequencies).
  - `wp = [0.4, 0.6]` (lower and upper passband frequencies).
  - `Ap = 3` (passband attenuation in dB).
  - `As = 18` (stopband attenuation in dB).

## Output
- The script generates frequency response plots for both the analog and digital versions of the designed filters.

## Notes
- Ensure that the input frequencies are normalized (between 0 and 1, where 1 corresponds to half the sampling rate).
- The script uses the bilinear transform to convert analog filters to digital filters.


