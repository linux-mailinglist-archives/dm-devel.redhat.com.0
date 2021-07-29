Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1BE3DAE7B
	for <lists+dm-devel@lfdr.de>; Thu, 29 Jul 2021 23:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627595245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sLwSJMmHdxnuzksT2EmCzu+7Bk5a1Q3erhgL5HhJC7U=;
	b=YqjOG3Dq1kV/aBY6S2Fv1NKE2FufnRJTqwXVVrpavf2hXiVV89nCXNgf3ykiZ5zZiVy/Qf
	qdYQ9mcCZ8hImcxe9ConCkLlA0vGvs7ykyjXKxmbrBovzVS1A15YJeFctmkVdbLqI1FY2o
	OyZydO3c/RAFJCglWhWK8eOFtPwde0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-jGoWX9UzPVG67IScSD4JBw-1; Thu, 29 Jul 2021 17:47:23 -0400
X-MC-Unique: jGoWX9UzPVG67IScSD4JBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA298042DB;
	Thu, 29 Jul 2021 21:47:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1766E0B9;
	Thu, 29 Jul 2021 21:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40B56180BAB0;
	Thu, 29 Jul 2021 21:47:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TLkDiO030904 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 17:46:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 480195D9DD; Thu, 29 Jul 2021 21:46:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 547305D9CA;
	Thu, 29 Jul 2021 21:46:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16TLk6D5020018; 
	Thu, 29 Jul 2021 16:46:06 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16TLk5eI020017;
	Thu, 29 Jul 2021 16:46:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 29 Jul 2021 16:46:00 -0500
Message-Id: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/5] Mulitpath: miscellaneous patches
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here are a couple of unconnected patches. They (at least
libmultipath.version) are meant to be applied on top of
Martin's recent patchset.

Benjamin Marzinski (5):
  multipath.conf: fix typo in ghost_delay description
  mpathpersist: fail commands when no usable paths exist
  multipath: print warning if multipathd is not running.
  libmultipath: remove unneeded code in coalesce_paths
  libmultipath: deal with dynamic PTHREAD_STACK_MIN

 libmpathpersist/mpath_persist.c   |  8 ++++-
 libmultipath/configure.c          | 57 ++++++-------------------------
 libmultipath/configure.h          |  1 +
 libmultipath/libmultipath.version |  5 +++
 libmultipath/util.c               |  4 +--
 multipath/main.c                  |  5 +++
 multipath/multipath.conf.5        |  2 +-
 7 files changed, 31 insertions(+), 51 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

