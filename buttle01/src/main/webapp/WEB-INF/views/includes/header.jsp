<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="직원검색">
    <meta name="author" content="최무회">

    <title>buttleSearchPeople</title>
    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="list">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">
                  		  부뜰정보시스템 
                    <!-- <sup>부서별 직원검색</sup> -->
                </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
              <a class="nav-link collapsed" href="#" 
              	data-toggle="collapse" data-target="#collapseOne" 
              	aria-expanded="true"   aria-controls="collapseTwo"> 
                <i class="fas fa-fw fa-cog"></i> 
                  <span>경영관리부</span>
              </a>
                <div id="collapseOne" class="collapse" 
                	aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="register">입사자 입력</a> 
                        <a class="collapse-item" href="cards.html">인사정보수정</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">부서명</div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
              <a class="nav-link collapsed" href="#" 
              	data-toggle="collapse" data-target="#collapseTwo" 
              	aria-expanded="true"   aria-controls="collapseTwo"> 
                <i class="fas fa-fw fa-cog"></i> 
                  <span>영업부</span>
              </a>
              
                <div id="collapseTwo" class="collapse" 
                	aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">TeamsNm:</h6>
                        <a class="collapse-item" href="buttons.html">영업1팀</a> 
                        <a class="collapse-item" href="cards.html">영업2팀</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
            	<a class="nav-link collapsed" href="#" 
            		data-toggle="collapse" data-target="#collapseUtilities" 
            		aria-expanded="true" aria-controls="collapseUtilities"> 
            		<i class="fas fa-fw fa-wrench"></i> 
            		<span>개발부</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">TeamsNm:</h6>
                        <a class="collapse-item" href="utilities-color.html">개발1팀</a>
                        <a class="collapse-item" href="utilities-border.html">개발2팀</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="/resources/vendor/jquery/jquery.min.js"></script> -->
