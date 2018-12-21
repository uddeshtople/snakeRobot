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
        
        
        for t=1:300
        
        
        thh1=(pi/6)*sin((pi/6)*t);
        thh2=(pi/6)*sin((pi/6)*t);
        thh3=(pi/6)*sin((pi/6)*t);
        thh4=(pi/6)*sin((pi/6)*t);
       
        thv1=(pi/6)*sin((pi/6)*t+pi/6);
        thv2=(pi/6)*sin((pi/6)*t+pi/6);
        thv3=(pi/6)*sin((pi/6)*t+pi/6);
        thv4=(pi/6)*sin((pi/6)*t+pi/6);
        
        %code
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v1,thv1,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v2,thv2,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v3,thv3,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,v4,thv4,vrep.simx_opmode_oneshot);
        
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_oneshot);

        
        
 % for i=1:2

      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,v1,thv1,vrep.simx_opmode_buffer);  
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,v2,thv2,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,v3,thv3,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,v4,thv4,vrep.simx_opmode_buffer);
        
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_buffer);  
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_buffer);
      %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_buffer);

      %  pause(0.1);
%  end
  pause(0.05);
  end
  
        vrep.simxFinish(-1);
 end
     vrep.delete();