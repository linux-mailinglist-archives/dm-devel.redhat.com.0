Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5F41919D07A
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 08:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585896688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SeKyAOiC070Od2HpVfS4rwtYE5oR6Be0Uo19D+xgD+U=;
	b=gSjs3FBwYQ4HkO7nqDBH4vEfk8vfSBHBa4TV+XGJk5DjPBgkbNSgk0zo77gY4Q2RMB9rPe
	/avea7473fTf0YD16xHqzzB8Eq5pVlmvuZYlnMdR13J80UbQftLbPb7eArtr0kHeuH1Ia2
	n/8vNsALtkxEjK/rn8NqgCAHnuJts0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-aP6b6j8LMTW9vLHlEaSQ-g-1; Fri, 03 Apr 2020 02:51:25 -0400
X-MC-Unique: aP6b6j8LMTW9vLHlEaSQ-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F9158017CE;
	Fri,  3 Apr 2020 06:51:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B1E10016E8;
	Fri,  3 Apr 2020 06:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C150B18089CE;
	Fri,  3 Apr 2020 06:50:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0336olRa028364 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 02:50:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25E6760BF4; Fri,  3 Apr 2020 06:50:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFC960BF3;
	Fri,  3 Apr 2020 06:50:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0336ohkJ022936; 
	Fri, 3 Apr 2020 01:50:43 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0336og9m022935;
	Fri, 3 Apr 2020 01:50:42 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  3 Apr 2020 01:50:38 -0500
Message-Id: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH v2 0/3] multipath: new path validation library
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

changes in v2:
0002: make sysfs_is_multipathed only read the sysfs file once, as
suggested by Martin.

0003: dm_is_mpath_uuid() is now dm_map_present_by_uuid(). The library
includes a new function mpath_get_mode(), to get the find_multipaths
mode, and the modes now include MPATH_FIND. mpath_is_path() now accepts
an array of mpath_infos, which the caller can use to pass the previous
path wwids. This allows mpath_is_path() to return MPATH_IS_VALID for
paths if there already is another path with that wwid.

However, mpath_is_path() still treats MPATH_SMART and MPATH_FIND the
same.  I tried to make them work differently, but I realized that I need
a way to signal that the MPATH_FIND path didn't fail because it was
blacklisted, but instead because it needed another paths. Otherwise the
caller won't know that it needs to save the wwid to check when later
paths appear. This is exactly what MPATH_IS_MAYBE_VALID means. In the
multipath -u code, the only difference between the find_multipaths "on"
and "smart" case is what to do when a path that needs another path
appears for the first time.  Dealing with this difference is the
responsiblity of the caller of the mpathvalid library. mpath_get_mode(),
will let it know what the configured find_multipaths mode is.

Benjamin Marzinski (3):
  libmultipath: make libmp_dm_init optional
  libmultipath: make sysfs_is_multipathed able to return wwid
  multipath: add libmpathvalid library

 Makefile                            |   1 +
 Makefile.inc                        |   1 +
 libmpathvalid/Makefile              |  38 ++++++
 libmpathvalid/libmpathvalid.version |   7 +
 libmpathvalid/mpath_valid.c         | 198 ++++++++++++++++++++++++++++
 libmpathvalid/mpath_valid.h         |  56 ++++++++
 libmultipath/Makefile               |   1 +
 libmultipath/devmapper.c            |  66 +++++++++-
 libmultipath/devmapper.h            |   4 +-
 libmultipath/sysfs.c                |  24 +++-
 libmultipath/sysfs.h                |   2 +-
 multipath/main.c                    |   7 +-
 12 files changed, 391 insertions(+), 14 deletions(-)
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

