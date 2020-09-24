Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6042276810
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 07:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600923606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7x9kxijcdwvPDalKtfNpwniT8jryilMn/SEm6ci8Z2c=;
	b=TwUhE1TTIrARpkq53IhVvO5LiGkUBOe9gbYbX1iLvSAr3zvk6+ztkrNwRmiE/Dk/sXyXHX
	U2dOqNsj9p26GH4fVin9fET+KQOt+lFZ+f0qLVfiNPcki5XmIMm5ZpT3KKWbN920ZHzTKH
	DxX3SFJ3i0KEXPNjwjQ3RyXY/lIWcLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-3SBVVzOnNb6if7zEon8tyQ-1; Thu, 24 Sep 2020 01:00:03 -0400
X-MC-Unique: 3SBVVzOnNb6if7zEon8tyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECCA393B5;
	Thu, 24 Sep 2020 04:59:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29BEC2634D;
	Thu, 24 Sep 2020 04:59:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 908AA44A6A;
	Thu, 24 Sep 2020 04:59:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O4xZM3024594 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 00:59:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AC713782; Thu, 24 Sep 2020 04:59:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 272F75576C;
	Thu, 24 Sep 2020 04:59:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08O4xUxN017450; 
	Wed, 23 Sep 2020 23:59:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08O4xUxV017449;
	Wed, 23 Sep 2020 23:59:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 23 Sep 2020 23:59:26 -0500
Message-Id: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is a
	valid path
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
X-Mimecast-Spam-Score: 0
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
patch just changes the get_uid log level for devices configured with
uid_attribute "". This is because it is currently necessary to configure
multipath with

overrides {
        uid_attribute ""
}

to claim multipath devices with SID (instead of using multipath.rules),
since SID doesn't currently get the UID information itself, and it is
called by udev before this information is added to the udev database.

I'm resubmitting this as a RFC patchset. Assuming they are ACKed, I will
resend these patches again, along with a man page, and unit tests, on
top of Martin's revised version of his "multipath-tools: shutdown,
libdevmapper races, globals" patchset.

changes from v1
---------------

0001: This patch is now rebased on top of, and makes use of Martin's
patches that provide a default *_multipath_config, udev, and logsink.
Because of this, mpathvalid_init() now has a parameter used to set
logsink. There is also a new API function, mpathvalid_reload_config().

0003: This is completely new, since Martin pointed out that adding a new
config option to always use the fallback getuid code was unnecessary. It
just makes a uid_attribute of "" log at normal levels.

Benjamin Marzinski (3):
  multipath: add libmpathvalid library
  libmultipath: add uid failback for dasd devices
  libmultipath: change log level for null uid_attribute

 Makefile                            |   3 +-
 libmpathvalid/Makefile              |  38 ++++++
 libmpathvalid/libmpathvalid.version |  10 ++
 libmpathvalid/mpath_valid.c         | 199 ++++++++++++++++++++++++++++
 libmpathvalid/mpath_valid.h         |  61 +++++++++
 libmultipath/defaults.h             |   1 +
 libmultipath/discovery.c            |  40 +++++-
 7 files changed, 349 insertions(+), 3 deletions(-)
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

