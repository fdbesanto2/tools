;+
; NAME:
;
;       LiDARToolsHelp_BCAL
;
; PURPOSE:
;
;       The purpose of this program is to display help file for the LiDAR Tools
;
; PRODUCTS:
;
;
; AUTHOR:
;
;       Rupesh Shrestha
;       Boise Center Aerospace Laboratory
;       Idaho State University
;       322 E. Front St., Ste. 240
;       Boise, ID  83702
;       http://bcal.geology.isu.edu/
;
; DEPENDENCIES:
;
;
; MODIFICATION HISTORY:
;
;       Written by Rupesh Shrestha, August 2010.
;       Changed online help from HTML to PDF for cross-platform compatibility
;           and easier maintenance.
;
;###########################################################################
;
; LICENSE
;
; This software is OSI Certified Open Source Software.
; OSI Certified is a certification mark of the Open Source Initiative.
;
; Copyright @ 2010 Rupesh Shrestha, Idaho State University.
;
; This software is provided "as-is", without any express or
; implied warranty. In no event will the authors be held liable
; for any damages arising from the use of this software.
;
; Permission is granted to anyone to use this software for any
; purpose, including commercial applications, and to alter it and
; redistribute it freely, subject to the following restrictions:
;
; 1. The origin of this software must not be misrepresented; you must
;    not claim you wrote the original software. If you use this software
;    in a product, an acknowledgment in the product documentation
;    would be appreciated, but is not required.
;
; 2. Altered source versions must be plainly marked as such, and must
;    not be misrepresented as being the original software.
;
; 3. This notice may not be removed or altered from any source distribution.
;
; For more information on Open Source Software, visit the Open Source
; web site: http://www.opensource.org.
;
;###########################################################################

    ; Begin main program
    
pro LiDARToolsHelp_BCAL, event  
compile_opt idl2
       
widget_control, event.id, get_uvalue=helpAbout


case helpAbout of

    'LiDARToolsHelp': begin
    
        oJavaDesktop = OBJ_NEW('IDLJavaObject$Static$JAVA_AWT_DESKTOP', $
                  'java.awt.Desktop') 
        
        oJavaURI = OBJ_NEW('IDLJavaObject$JAVA_NET_URI', 'java.net.URI', $
                  'http://code.google.com/p/bcal-lidar-tools/wiki/TableOfContents') 
        
        if (oJavaDesktop->isDesktopSupported()) then begin 
           
           oBrowser = oJavaDesktop->getDesktop()
           
           oBrowser->browse,oJavaURI 
           
           OBJ_DESTROY, oBrowser 
        
        endif 
        
        OBJ_DESTROY, oJavaURI, oJavaDesktop 
 
     end
     
     'LiDARToolsUpdates': begin
    
        oJavaDesktop = OBJ_NEW('IDLJavaObject$Static$JAVA_AWT_DESKTOP', $
                  'java.awt.Desktop') 
        
        oJavaURI = OBJ_NEW('IDLJavaObject$JAVA_NET_URI', 'java.net.URI', $
                  'http://code.google.com/p/bcal-lidar-tools/downloads') 
        
        if (oJavaDesktop->isDesktopSupported()) then begin 
           
           oBrowser = oJavaDesktop->getDesktop()
           
           oBrowser->browse,oJavaURI 
           
           OBJ_DESTROY, oBrowser 
        
        endif 
        
        OBJ_DESTROY, oJavaURI, oJavaDesktop 
 
     end

    'AboutLiDARTools': begin
    
      envi_center, xoff, yoff
      widget_control, event.top, get_uvalue = info

      aboutBase = widget_base(Title = 'About', /col, xoffset = xoff, $
                        yoffset = yoff, xsize=250)
    
      dummy = widget_label(aboutBase, value='', /align_center)                    
      dummy = widget_label(aboutBase, value='BCAL LiDAR Tools 1.5.3', /align_center)
      dummy = widget_label(aboutBase, value='Boise Center for Aerospace Laboratory', /align_center)
      dummy = widget_label(aboutBase, value='Idaho State University', /align_center)
      dummy = widget_label(aboutBase, value='322 E. Front Street Suite 240, Boise, Idaho', /align_center)
      dummy = widget_label(aboutBase, value='bcal@isu.edu', /align_center)
      dummy = widget_label(aboutBase, value='', /align_center) 
    
      widget_control, aboutBase, /realize
    
    end
    
endcase


end
