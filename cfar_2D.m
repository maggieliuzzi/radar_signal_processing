% 2D CA-CFAR

%{
Determine number of training cells and guard cells for each dimension Tr, Td, Gr and Gd.
Slide the Cell Under Test (CUT) across the complete cell matrix
Select the grid that includes the training, guard and test cells. Grid Size = (2Tr+2Gr+1)(2Td+2Gd+1).
The total number of cells in the guard region and cell under test. (2Gr+1)(2Gd+1).
This gives the Training Cells : (2Tr+2Gr+1)(2Td+2Gd+1) - (2Gr+1)(2Gd+1)
Measure and average the noise across all the training cells. This gives the threshold
Add the offset (if in signal strength in dB) to the threshold to keep the false alarm to the minimum.
Determine the signal level at the Cell Under Test.
If the CUT signal level is greater than the Threshold, assign a value of 1, else equate it to zero.
Since the cell under test are not located at the edges, due to the training cells occupying the edges, we suppress the edges to zero. Any cell value that is neither 1 nor a 0, assign it a zero.
%}

%{

tr = 1, td = 1, tr = 1, tg = 1
r r r r r
r g g g r
r g T g r
r g g g r
r r r r r
Ttotal = (2+2+1)(2+2+1) - (2+1)(2+1) = 5*5 - 3*3 = 25 - 9 = 16


Determine the total number of training cells for 2D CFAR process given the following:
Remember that training cells surround the CUT and guard cells in both dimensions.

Size of training band in range dimension = 8
Size of guard band in range dimension = 4
Size of training band in doppler dimension = 4
Size of guard band in the doppler dimension = 2

Tr = 8
Td = 4
Gr = 4
Gd = 2

Grid = (2Tr+2Gr+1)(2Td+2Gd+1)
Grid = (16+8+1)*(8+4+1) = 25*13 = 325

Ttotal = (2Tr+2Gr+1)(2Td+2Gd+1) - (2Gr+1)(2Gd+1)
Ttotal = (2*8 + 2*4 + 1) * (2*4 + 2*2 + 1) - (2*4 + 1) * (2*4 + 1)
Ttotal = (16 + 8 + 1) * (8 + 4 + 1) - (8 + 1) * (8 + 1)
Ttotal = 25*13 - 9*9
Ttotal = 325 - 81
Ttotal = 244
%}