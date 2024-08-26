<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html
        lang="kr"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="${pageContext.request.contextPath}/resources/admin/assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8"/>
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>Member Tables</title>

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon"
        href="${pageContext.request.contextPath}/resources/admin/assets/img/favicon/favicon.ico"/>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/fonts/boxicons.css"/>

  <!-- Core CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/css/core.css"
        class="template-customizer-core-css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/vendor/css/theme-default.css"
        class="template-customizer-theme-css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/demo.css"/>

  <!-- Vendors CSS -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/js/helpers.js"></script>

  <script src="${pageContext.request.contextPath}/resources/admin/assets/js/config.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <!-- Menu -->

  <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
      <a href="home-01" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="">
      </a>

      <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
        <i class="bx bx-chevron-left bx-sm align-middle"></i>
      </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
      <!-- Dashboard -->
      <li class="menu-item">
        <a href="/admin/dash-board" class="menu-link">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div data-i18n="Analytics">Dashboard</div>
        </a>
      </li>

      <!-- Layouts -->
      <li class="menu-item">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-layout"></i>
          <div data-i18n="Layouts">Admin</div>
        </a>

        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/mgmt/member/list" class="menu-link">
              <div data-i18n="Without menu">회원관리</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/mgmt/course/courseList" class="menu-link">
              <div data-i18n="Without navbar">강의관리</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/mgmt/order/list" class="menu-link">
              <div data-i18n="Container">주문관리</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/mgmt/review/list" class="menu-link">
              <div data-i18n="Fluid">리뷰관리</div>
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </aside>
</div>