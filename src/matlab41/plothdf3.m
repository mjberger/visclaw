%
% plotclaw3.m
%
% generic plotting routine for clawpack and amrclaw output in matlab
% R. J. LeVeque, 1999
%
% Various parameters are set in setplot3.m
% The default version in claw/matlab/setplot3.m can be copied to your
% directory and modified to set things up differently, or type 'k'
% at the prompt to get keyboard control and change a value.
%
%---------------------------------------------------------------------

clawdim = 3;

disp(' ')
disp('plotclaw3  plots 3d results from clawpack or amrclaw')

% set plotting parameters:
whichfile = which('setplot3');
if strcmp(whichfile,'')
    disp('*** No setplot3 file found')
  else
    inp = input(['Set default plotting parameters by executing'...
		' setplot3 (y if yes)? '],'s');
    if (strcmp(inp,'y'))
       setplot3
       disp(['Executing m-script ' whichfile])
       disp(' ')
       end
  end
disp(' ')

% the file setprob.m can be used to set up any necessary physical parameters
% or desired values of plotting parameters for this particular problem.

whichfile = which('setprob');
if strcmp(whichfile,'')
    %disp('*** No setprob file found')
  else
    disp(['Executing m-script ' whichfile])
    disp(' ')
    setprob
  end

%=============================================
% MAIN LOOP ON FRAMES:
%=============================================

Frame = -1;  % initialize frame counter
while Frame <= MaxFrames

    % pause for input from user to determine if we go to next frame,
    % look at data, or skip around.  This may reset Frame counter.

    queryframe

    % produce the plot:

    hdf_frame3   % routine claw/matlab/hdf_frame3.m reads data and
                 % does the plotting for this frame

    end % main loop on frames
