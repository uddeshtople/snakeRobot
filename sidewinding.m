vrep=remApi('remoteApi');
 vrep.simxFinish(-1);

 clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);

if (clientID>-1)
        disp('Connected');
        
       %handle
        [returnCode,v1]=vrep.simxGetObjectHandle(clientID,'snake_joint_v1',vrep.simx_opmode_blocking );
        [returnCode,v2]=vrep.simxGetObjectHandle(clientID,'snake_joint_v2',vrep.simx_opmode_blocking );
        [returnCode,v3]=vrep.simxGetObjectHandle(clientID,'snake_joint_v3',vrep.simx_opmode_blocking );
        [returnCode,v4]=vrep.simxGetObjectHandle(clientID,'snake_joint_v4',vrep.simx_opmode_blocking );
        [returnCode,h1]=vrep.simxGetObjectHandle(clientID,'snake_joint_h1',vrep.simx_opmode_blocking );
        [returnCode,h2]=vrep.simxGetObjectHandle(clientID,'snake_joint_h2',vrep.simx_opmode_blocking );
        [returnCode,h3]=vrep.simxGetObjectHandle(clientID,'snake_joint_h3',vrep.simx_opmode_blocking );
        [returnCode,h4]=vrep.simxGetObjectHandle(clientID,'snake_joint_h4',vrep.simx_opmode_blocking );
        
        
        for t=1:100
        
        
        thh1=(pi/3)*sin((pi/6)*t+4*pi/3);
        thh2=(pi/3)*sin((pi/6)*t+8*pi/3);
        thh3=(pi/3)*sin((pi/6)*t+12*pi/3);
        thh4=(pi/3)*sin((pi/6)*t+16*pi/3);
       
        thv1=(pi/3)*sin((pi/6)*t+2*pi/3);
        thv2=(pi/3)*sin((pi/6)*t+6*pi/3);
        thv3=(pi/3)*sin((pi/6)*t+10*pi/3);
        thv4=(pi/3)*sin((pi/6)*t+14*pi/3);
        
        %code
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v1,thv1,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v2,thv2,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v3,thv3,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v4,thv4,vrep.simx_opmode_oneshot);
        
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_oneshot);

        
        
  %for i=1:2

     % [returnCode]=vrep.simxSetJointTargetPosition(clientID,v1,thv1,vrep.simx_opmode_buffer);  
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,v2,thv2,vrep.simx_opmode_buffer);
    %  [returnCode]=vrep.simxSetJointTargetPosition(clientID,v3,thv3,vrep.simx_opmode_buffer);
     % [returnCode]=vrep.simxSetJointTargetPosition(clientID,v4,thv4,vrep.simx_opmode_buffer);
        
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_buffer);  
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_buffer);
%pause(0.2);
  %end
  pause(0.5);
  end
  
        vrep.simxFinish(-1);
 end
     vrep.delete();