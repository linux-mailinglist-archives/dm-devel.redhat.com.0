Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4D81D9D8D
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 19:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589908211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BL5lL+sWe6aKc2qIw9DK5qLNCzRfdYVtb2UADWOtcgo=;
	b=f19SIwOS+1/kFcx0daCWgGGmH0eKgZdeyTdVRfCIRblX3AMyBRKmdkGII1hSceAYSlEsft
	h445sNdj4aS9DKklJTXIRsWh2Xm1cT8HmxGQSBd6ltA8gScNybiCwyZvS1Ob32ypdkUvSs
	JziVCNnKMI+uRabOOFOzvnoP5bvSutE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-AujkGYRQM_eAq0o14zo25Q-1; Tue, 19 May 2020 13:09:28 -0400
X-MC-Unique: AujkGYRQM_eAq0o14zo25Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F4B2BFC0;
	Tue, 19 May 2020 17:09:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F09A5D9CD;
	Tue, 19 May 2020 17:09:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D2FB4ED81;
	Tue, 19 May 2020 17:09:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JH8oLo011700 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 13:08:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E811E19451; Tue, 19 May 2020 17:08:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0CF16155F;
	Tue, 19 May 2020 17:08:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04JH8kdm007494; 
	Tue, 19 May 2020 12:08:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04JH8jUw007493;
	Tue, 19 May 2020 12:08:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 19 May 2020 12:08:39 -0500
Message-Id: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/6] multipath: path validation library prep
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Changes from v2:
rebased patches on top of Martin's previous patch sets

Benjamin Marzinski (5):
  libmultipath: make libmp_dm_init optional
  libmultipath: make sysfs_is_multipathed able to return wwid
  multipath: centralize validation code
  Unit tests for is_path_valid()
  libmultipath: simplify failed wwid code

Martin Wilck (1):
  libmultipath: use atomic linkat() in mark_failed_wwid()

 libmultipath/Makefile    |   2 +-
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
 12 files changed, 943 insertions(+), 285 deletions(-)
 create mode 100644 libmultipath/valid.c
 create mode 100644 libmultipath/valid.h
 create mode 100644 tests/valid.c

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

