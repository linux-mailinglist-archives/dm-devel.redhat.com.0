Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E29C21D8EEB
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 06:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589864255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/u51caCT3HedceBRm7drOc3U6FLrliKJ/s7VGGXhh0M=;
	b=ibXt2DlzaylC2FxY/2DUyO/I74FKn7sYBqOg9tJyepXsQetbuBc/YZBOoa583pw72X4p2Z
	+7BfHhT7qzWi38TK/cEWUTOIWlRRxIzNAjacXPCBFqNq6pZLuiuMsPiMrt/U4DsO8wW2Pk
	WaBkJE7YEYZdAqTzlseh2GBx2lw+c4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-TmJhHUpTMKulX-tTQCisXA-1; Tue, 19 May 2020 00:57:33 -0400
X-MC-Unique: TmJhHUpTMKulX-tTQCisXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED1B1009441;
	Tue, 19 May 2020 04:57:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D46DD60BF3;
	Tue, 19 May 2020 04:57:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2D851809547;
	Tue, 19 May 2020 04:57:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J4vDmH019129 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 00:57:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71CF45D9E2; Tue, 19 May 2020 04:57:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A685D9DD;
	Tue, 19 May 2020 04:57:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04J4v9ct001401; 
	Mon, 18 May 2020 23:57:09 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04J4v8OY001400;
	Mon, 18 May 2020 23:57:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 18 May 2020 23:57:02 -0500
Message-Id: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/6] multipath: path validation library prep
	work
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I've been playing around with the SID code more and I've decided to hold
off on submitting the library until I have it working with the SID
multipath module better. Instead, I've pulled out the common code that
multipath -u/-c and the library can use, and put it into libmultipath.

I've also removed some of the ordering differences between the existing
code and my new code.  Right now, the only difference is that if a path
is currently multipathed, it will always be claimed as a valid path.

Patches 0001 & 0002 are the same as in my "RFC PATCH v2" set, and patch
0005 is the same as my "libmultipath: simplify failed wwid code" patch.

Only patches 0003 and 0004 haven't been posted before.

Changes from v1:
0003: Minor fixes suggested by Martin Wilck
0004: Fixed typo, added tests for filter_property() and switched some
      tests to pass the check_multipathd code in various ways, instead
      of skipping it, as suggested by Martin Wilck

Benjamin Marzinski (5):
  libmultipath: make libmp_dm_init optional
  libmultipath: make sysfs_is_multipathed able to return wwid
  multipath: centralize validation code
  Unit tests for is_path_valid()
  libmultipath: simplify failed wwid code

Martin Wilck (1):
  libmultipath: use atomic linkat() in mark_failed_wwid()

 libmultipath/Makefile    |   3 +-
 libmultipath/devmapper.c |  62 ++++-
 libmultipath/devmapper.h |   4 +-
 libmultipath/structs.h   |  24 +-
 libmultipath/sysfs.c     |  24 +-
 libmultipath/sysfs.h     |   2 +-
 libmultipath/valid.c     | 118 ++++++++++
 libmultipath/valid.h     |  42 ++++
 libmultipath/wwids.c     | 165 +++++++------
 multipath/main.c         | 295 ++++++++++--------------
 tests/Makefile           |   4 +-
 tests/valid.c            | 486 +++++++++++++++++++++++++++++++++++++++
 12 files changed, 944 insertions(+), 285 deletions(-)
 create mode 100644 libmultipath/valid.c
 create mode 100644 libmultipath/valid.h
 create mode 100644 tests/valid.c

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

