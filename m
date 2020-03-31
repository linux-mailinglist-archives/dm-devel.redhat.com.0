Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id BCC531989C1
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 04:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585620095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y32yPiBqh215z+8PBUK8BDak/7o9n8bozvMtiIqsxtc=;
	b=aBvfoz9gP1LeGE8KngS+ufLoXpF85Q7AEgEWc6UCoFCE98tBStSv7ADvB9NMup8s5POoSD
	1v6HgfOJDN+itKMJRI8YwsWHJb1NErLzSEaiWv1WZVpT3JL6Yooja+rvQYG17Ww0s9ePMB
	vcLNrgeLbCbdTTtdqJ3ZevkZyYcbWlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-lz_dlcEkNEq17KUn2YUiiA-1; Mon, 30 Mar 2020 22:01:32 -0400
X-MC-Unique: lz_dlcEkNEq17KUn2YUiiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2721B8017CC;
	Tue, 31 Mar 2020 02:01:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1B919C58;
	Tue, 31 Mar 2020 02:01:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7067786BF1;
	Tue, 31 Mar 2020 02:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V210Hn032309 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 22:01:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31783100EBB3; Tue, 31 Mar 2020 02:01:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DEA41001DC2;
	Tue, 31 Mar 2020 02:00:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02V20uq2027152; 
	Mon, 30 Mar 2020 21:00:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02V20tGu027151;
	Mon, 30 Mar 2020 21:00:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 30 Mar 2020 21:00:52 -0500
Message-Id: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC Patch 0/3] multipath: new path validation library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset is for a new library that programs can use to determine
if a device belongs to multipath.  The primary user that this is
intended for is SID, the Storage Instantiation Daemon

https://github.com/sid-project

Right now, this doesn't change our existing code to determine path
ownership, and it doesn't do the exact same steps, although it is very
close.  In the future, it would be possible to pull most of this code
entirely into libmultipath, except for some wrappers, and use it for
both methods.  Obviously, this still needs man pages, and there are some
helper functions for things like controlling multipath's logging that
are missing, but I want to see if anyone has strong feelings about what
this looks like.

I also have two more changes that I want to make to the multipath code,
to make path validation do less unnecessary work, which aren't in this
patchset.

1. I want to remove the lock file from the failed wwids code. I don't
see how it actually stops any races, and it means that simply reading
a file, can trigger delays and writes (albeit to a memory base fs).

2. I want to deprecate getuid_callout.  Once this is gone, you will be
able to call pathinfo and get a path's WWID, without ever needing to
open the path.

Benjamin Marzinski (3):
  libmultipath: make libmp_dm_init optional
  libmultipath: make sysfs_is_multipathed able to return wwid
  multipath: add libmpathvalid library

 Makefile                            |   1 +
 Makefile.inc                        |   1 +
 libmpathvalid/Makefile              |  38 +++++++
 libmpathvalid/libmpathvalid.version |   6 +
 libmpathvalid/mpath_valid.c         | 171 ++++++++++++++++++++++++++++
 libmpathvalid/mpath_valid.h         |  53 +++++++++
 libmultipath/Makefile               |   1 +
 libmultipath/devmapper.c            |  66 ++++++++++-
 libmultipath/devmapper.h            |   4 +-
 libmultipath/sysfs.c                |  22 +++-
 libmultipath/sysfs.h                |   2 +-
 multipath/main.c                    |   7 +-
 12 files changed, 360 insertions(+), 12 deletions(-)
 create mode 100644 libmpathvalid/Makefile
 create mode 100644 libmpathvalid/libmpathvalid.version
 create mode 100644 libmpathvalid/mpath_valid.c
 create mode 100644 libmpathvalid/mpath_valid.h

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

