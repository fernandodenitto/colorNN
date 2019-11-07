function plot2spectra (spectra1,spectra2,wavelength)
   
    plot(wavelength,spectra1,'b-')
    hold on
    plot(wavelength,spectra2,'r-')
    xlabel('Wavelength of Visible Spectra')
    xlabel('Wavelength of Visible Spectra (nm)')
    ylabel('% of Reflection (normalization)')
    legend('Master','Interpolated Master')
    

end