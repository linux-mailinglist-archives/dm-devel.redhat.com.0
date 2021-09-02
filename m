Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE4D3FF6D1
	for <lists+dm-devel@lfdr.de>; Fri,  3 Sep 2021 00:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630620266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sgZwKRPr0do+5Iqy03yEXzpsg5g2XoYD9gqpxkwseQc=;
	b=XBCUGbotYyBvMLP9YE+pynfqDe0hQy0TO1+sKFg7joUq3gemUL5oQaJ8BkhjixWZ0pAZuZ
	BjkLqpCycrAMD6h29xX3uwKUWd1jUxvKs6tVQQ1qlVkrN0Uo4LjKBkoWPFTCXwWvzwUbU3
	LKr6woH/wdQqgerVAfObaSXrpLFXw68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-EjDvwCclM5qUmOUI1d_fhg-1; Thu, 02 Sep 2021 18:04:24 -0400
X-MC-Unique: EjDvwCclM5qUmOUI1d_fhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5071883520;
	Thu,  2 Sep 2021 22:04:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70BD019C46;
	Thu,  2 Sep 2021 22:04:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 690DF1809C98;
	Thu,  2 Sep 2021 22:04:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182Lvu5C013322 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 17:57:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1FC66608B; Thu,  2 Sep 2021 21:57:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB5960853;
	Thu,  2 Sep 2021 21:57:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 182LvoeN012291; 
	Thu, 2 Sep 2021 16:57:50 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 182LvoUS012290;
	Thu, 2 Sep 2021 16:57:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Sep 2021 16:57:43 -0500
Message-Id: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/6] Mulitpath: miscellaneous patches
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here are a couple of unconnected patches. They (at least
libmultipath.version) are meant to be applied on top of
Martin's recent patchset.

Changes from v1:

3/6: Reworked this to keep the logic in multipath, and prefix the output
     with "Warning" as suggested by Martin Wilck.
6/6: New patch to simplify code that I noticed while reworking patch
     3/6.

Benjamin Marzinski (6):
  multipath.conf: fix typo in ghost_delay description
  mpathpersist: fail commands when no usable paths exist
  multipath: print warning if multipathd is not running.
  libmultipath: remove unneeded code in coalesce_paths
  libmultipath: deal with dynamic PTHREAD_STACK_MIN
  libmultipath: drop unnecessary parameter from remove_map()

 libmpathpersist/mpath_persist.c   | 10 ++++-
 libmultipath/configure.c          | 62 ++++---------------------------
 libmultipath/configure.h          |  1 +
 libmultipath/libmultipath.version |  5 +++
 libmultipath/structs_vec.c        | 12 +++---
 libmultipath/structs_vec.h        | 11 +-----
 libmultipath/util.c               |  4 +-
 multipath/main.c                  | 18 +++++++--
 multipath/multipath.conf.5        |  2 +-
 multipathd/dmevents.c             |  2 +-
 multipathd/main.c                 | 12 +++---
 11 files changed, 54 insertions(+), 85 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

