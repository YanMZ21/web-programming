/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : managesystem

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 20/06/2020 08:52:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账户密码',
  `aSID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员员工号',
  PRIMARY KEY (`userName`) USING BTREE,
  UNIQUE INDEX `aSID`(`aSID`) USING BTREE,
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`aSID`) REFERENCES `staff` (`sID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门编号',
  `dName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`dID`) USING BTREE,
  UNIQUE INDEX `dName`(`dName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for employ
-- ----------------------------
DROP TABLE IF EXISTS `employ`;
CREATE TABLE `employ`  (
  `eID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人员编号',
  `eName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人员姓名',
  `eSex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人员性别',
  `eDID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人员希望加入部门',
  PRIMARY KEY (`eID`) USING BTREE,
  INDEX `eDID`(`eDID`) USING BTREE,
  CONSTRAINT `employ_ibfk_1` FOREIGN KEY (`eDID`) REFERENCES `department` (`dID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rp
-- ----------------------------
DROP TABLE IF EXISTS `rp`;
CREATE TABLE `rp`  (
  `rpID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖惩记录编号',
  `rpSID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '奖惩人员',
  `rpSalary` float(8, 2) NOT NULL COMMENT '奖惩金额',
  PRIMARY KEY (`rpID`) USING BTREE,
  INDEX `rpSID`(`rpSID`) USING BTREE,
  CONSTRAINT `rp_ibfk_1` FOREIGN KEY (`rpSID`) REFERENCES `staff` (`sID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `sID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工号',
  `sName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `sSex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工性别',
  `sDID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工所在部门编号',
  `sSalary` float(8, 2) NOT NULL COMMENT '员工薪资',
  PRIMARY KEY (`sID`) USING BTREE,
  INDEX `sDID`(`sDID`) USING BTREE,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`sDID`) REFERENCES `department` (`dID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
