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

       
  for t=1:200
      
        thh2=30*sin((5*pi/3)*t+2*pi/3);
        thh4=30*sin((5*pi/3)*t+4*pi/3);
        thh1=30*sin((5*pi/3)*t+pi/3);
        thh3=30*sin((5*pi/3)*t+3*pi/3);

        
        %code
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_oneshot);
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_oneshot)
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_oneshot)
        [returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_oneshot)

        
        
 % for i=1:2
      
        %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h2,thh2,vrep.simx_opmode_buffer);
        %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h4,thh4,vrep.simx_opmode_buffer)
        %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h3,thh3,vrep.simx_opmode_buffer)
        %[returnCode]=vrep.simxSetJointTargetPosition(clientID,h1,thh1,vrep.simx_opmode_buffer)

  %      pause(0.051);
  %end
  pause(0.1);
  end
  
        vrep.simxFinish(-1);
 end
     vrep.delete();
        