#!/usr/bin/env python

import rospy
import moveit_msgs.srv
import geometry_msgs.msg
import hsrb_arm_kinematics.ik


def callback(request):
    print "Got request %s"%(request)

    response = moveit_msgs.srv.GetPositionIKResponse()

    end_effector_link = request.ik_request.ik_link_name
    print "end_effector_link:" + str(end_effector_link)

    pose_stamped = request.ik_request.pose_stamped
    transform_stamped = geometry_msgs.msg.TransformStamped
    transform_stamped.header = pose_stamped.header
    transform_stamped.child_frame_id = end_effector_link
    transform_stamped.transform = geometry_msgs.msg.Transform
    transform_stamped.transform.translation = geometry_msgs.msg.Vector3
    transform_stamped.transform.translation.x = pose_stamped.pose.position.x
    transform_stamped.transform.translation.y = pose_stamped.pose.position.y
    transform_stamped.transform.translation.z = pose_stamped.pose.position.z
    transform_stamped.transform.rotation = pose_stamped.pose.orientation

    base_link = transform_stamped.header.frame_id
    print "base_link:" + str(base_link)
    joint_state = request.ik_request.robot_state.joint_state
    print "joint_state" + str(joint_state.position)
    timeout = request.ik_request.timeout
    response.solution.joint_state = joint_state
    new_joint_state_vector, success = hsrb_arm_kinematics.ik.calculate_ik(base_link, end_effector_link, joint_state.position, transform_stamped)

    response.solution.joint_state.position = new_joint_state_vector

    if success:
        response.error_code.val = response.error_code.SUCCESS
        print "if>>>>>>>>>>>>>>"
    else:
        response.error_code.val = response.error_code.NO_IK_SOLUTION
        print "else>>>>>>>>>>>>"
    return response


def server_main():
    rospy.init_node('hsrb_arm_kinematics')
    server = rospy.Service('~get_ik', moveit_msgs.srv.GetPositionIK, callback)
    print "IK server ready."
    rospy.spin()

if __name__ == "__main__":
    server_main()
