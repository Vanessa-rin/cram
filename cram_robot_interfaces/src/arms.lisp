;;; Copyright (c) 2012, Lorenz Moesenlechner <moesenle@in.tum.de>
;;; All rights reserved.
;;; 
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;; 
;;;     * Redistributions of source code must retain the above copyright
;;;       notice, this list of conditions and the following disclaimer.
;;;     * Redistributions in binary form must reproduce the above copyright
;;;       notice, this list of conditions and the following disclaimer in the
;;;       documentation and/or other materials provided with the distribution.
;;;     * Neither the name of the Intelligent Autonomous Systems Group/
;;;       Technische Universitaet Muenchen nor the names of its contributors 
;;;       may be used to endorse or promote products derived from this software 
;;;       without specific prior written permission.
;;; 
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(in-package :cram-robot-interfaces)

(def-fact-group arms (arm arm-joints arm-links required-arms available-arms end-effector-link
                          robot-tool-frame
                          gripper-joint gripper-link
                          robot-arms-parking-joint-states end-effector-parking-pose
                          robot-pre-grasp-joint-states planning-group)
  ;; Unifies ?side with the name of an arm that is present on the ?robot.
  (<- (arm ?robot ?arm)
    (fail))

  ;; Unifies ?arm with the list of joints for that arm.
  (<- (arm-joints ?robot ?arm ?joints)
    (fail))

  ;; Unifies ?arm with a list of links for that arm (includes gripper links).
  (<- (arm-links ?robot ?arm ?links)
    (fail))

  ;; ?sides is unified with the list of arms that are required to
  ;; manipulate the object indicated by the object designator ?object.
  (<- (required-arms ?object-designator ?arms)
    (fail))

  ;; Similar to REQUIRED-ARMS but only unifies with currently unused
  ;; arms.
  (<- (available-arms ?object-designator ?arms)
    (fail))

  ;; Defines end-effector links for arms.
  (<- (end-effector-link ?robot ?arm ?link-name)
    (fail))

  ;; Unifies ?arm with a list of links for the hand of that arm.
  (<- (hand-links ?robot ?arm ?links)
    (fail))

  ;; Defines tool frames for arms.
  (<- (robot-tool-frame ?robot ?arm ?frame)
    (fail))

  ;; Defines links of the grippers of the robot
  (<- (gripper-link ?robot ?arm ?link)
    (fail))

  ;; Defines joints of robot's grippers
  (<- (gripper-joint ?robot ?arm ?joint)
    (fail))

  (<- (planning-group ?robot ?arms ?group-name)
    (fail))

  (<- (robot-arms-parking-joint-states ?robot ?joint-states)
    (fail))
  (<- (robot-arms-parking-joint-states ?robot ?joint-states ?arm)
    (fail))

  (<- (end-effector-parking-pose ?robot ?pose ?arm)
    (fail))

  (<- (robot-pre-grasp-joint-states ?robot ?joint-states)
    (fail)))
