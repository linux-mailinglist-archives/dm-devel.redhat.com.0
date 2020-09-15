Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDFA26AFD4
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 23:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600206338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vb0T159WLWO/N2M3ImrUouCxGUanCbZPhq0+GXvj/xs=;
	b=DPUMxrAJbWxJL9qUWVvltEp5PZ6xd8OaO6WGFYrqHcjAaarFbk078PbFfR62n7MKzHYVvb
	AKDFXX7Kza6KqUUfMOu4ulf0HdCSsm4/+owdKmjj9l1FxLjbBL9n1uslK6C2WV90SWq3Sc
	HaYtB6Dr4D7M4vbrvl1ZFfPKVCMZzq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-GrrTbv85PYGy9nwnPVkp4g-1; Tue, 15 Sep 2020 17:45:35 -0400
X-MC-Unique: GrrTbv85PYGy9nwnPVkp4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA936801AE3;
	Tue, 15 Sep 2020 21:45:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C185E19D61;
	Tue, 15 Sep 2020 21:45:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2680344A64;
	Tue, 15 Sep 2020 21:45:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FLjIcK031391 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 17:45:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 805EA5FC16; Tue, 15 Sep 2020 21:45:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A7BD1C4;
	Tue, 15 Sep 2020 21:45:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08FLjDZu006537; 
	Tue, 15 Sep 2020 16:45:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08FLjDCs006536;
	Tue, 15 Sep 2020 16:45:13 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 15 Sep 2020 16:45:09 -0500
Message-Id: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/3] add library to check if device is a valid
	path
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The main part of the this patchset is the first patch, which adds a
new library interface to check whether devices are valid paths. This
was designed for use in the Storage Instantiation Daemon (SID).

https://github.com/sid-project

Hopefully, I've removed all the controvertial bits from the last time I
proposed this library.

The second patch adds get_uid fallback code for dasd devices. The third
patch adds a config option to force multpath to get the device uid from
the fallback methods. This is currently necessary for claiming multipath
devices with SID (instead of using multipath.rules), since SID doesn't
currently get the UID information itself, and it is called by udev
before this information is added to the udev database.

I would like to have this patch included in upstream, since it will make
it easier for people to try out SID, without having to recompile
multipath. However, I understand that there's not much reason to set
this outside of SID. I have a git branch that is Martin's upstream-queue
branch with these patches added, that I people can use if this patch
isn't acceptable.

https://github.com/bmarzins/rh-multipath-tools/tree/sid-patches

Benjamin Marzinski (3):
  multipath: add libmpathvalid library
  libmultipath: add uid failback for dasd devices
  libmultipath: add ignore_udev_uid option

 Makefile                            |   3 +-
 libmpathvalid/Makefile              |  38 +++++++
 libmpathvalid/libmpathvalid.version |  10 ++
 libmpathvalid/mpath_valid.c         | 168 ++++++++++++++++++++++++++++
 libmpathvalid/mpath_valid.h         |  57 ++++++++++
 libmultipath/config.h               |   1 +
 libmultipath/defaults.h             |   1 +
 libmultipath/dict.c                 |   4 +
 libmultipath/discovery.c            |  54 +++++++--
 libmultipath/discovery.h            |   8 +-
 libmultipath/uevent.c               |   2 +-
 multipath/multipath.conf.5          |  13 +++
 multipathd/main.c                   |   7 +-
 13 files changed, 355 insertions(+), 11 deletions(-)
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

