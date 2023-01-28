function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
H = [];
a = zeros(8,9);
for i = 1:4
    x1 = video_pts(i,1);
    x2 = video_pts(i,2);
    x1p = logo_pts(i,1);
    x2p = logo_pts(i,2);
    append = zeros(2,9);
    append(1,1) = -x1;
    append(1,2) = -x2;
    append(1,3) = -1;
    append(1,7) = x1*x1p;
    append(1,8) = x2*x1p;
    append(1,9) = x1p;
    append(2,4) = -x1;
    append(2,5) = -x2;
    append(2,6) = -1;
    append(2,7) = x1*x2p;
    append(2,8) = x2*x2p;
    append(2,9) = x2p;
    a(((2*i)-1):(2*i),:) = append;
end
[U,S,V] =svd(a);
H = reshape(V(:,end),[3,3]);
H = H';
end

