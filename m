Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EBFE229545D
	for <lists+dm-devel@lfdr.de>; Wed, 21 Oct 2020 23:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603316517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UsAOG1V4vlYu06rewNf9G8zvVtpOyjwrVskIWKkU7v0=;
	b=SIY3hwQLDI71eQ1PRKoXmE2q6R77NBnm+BIDT1BETnCyettP6Tusd8eIvDU42x2Pz5BU9G
	jWDNI2lU0R2qD8nuGKopuOaVHGMpsnL1saLBzS5hdPtnj1gSijrvCPIqzYew1x6FoKmej8
	HsCm1jU9ZmFn4A1ZocD9ZFvD5jWa2xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-c6UXYHlgPmaHk2wdw13dfA-1; Wed, 21 Oct 2020 17:41:55 -0400
X-MC-Unique: c6UXYHlgPmaHk2wdw13dfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B42B1019625;
	Wed, 21 Oct 2020 21:41:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A85AD5D9DD;
	Wed, 21 Oct 2020 21:41:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00656181A050;
	Wed, 21 Oct 2020 21:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LLdVk5008755 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 17:39:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 610A355760; Wed, 21 Oct 2020 21:39:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 758A055773;
	Wed, 21 Oct 2020 21:39:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09LLdQcO028775; 
	Wed, 21 Oct 2020 16:39:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09LLdQV3028774;
	Wed, 21 Oct 2020 16:39:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 21 Oct 2020 16:39:22 -0500
Message-Id: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/4] add library to check if device is a valid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

The seconds patch adds unit tests for this library. The third patch adds
get_uid fallback code for dasd devices. The fourth patch just changes
the get_uid log level for devices configured with uid_attribute "". This
is because it is currently necessary to configure multipath with

overrides {
        uid_attribute ""
}

to claim multipath devices with SID (instead of using multipath.rules),
since SID doesn't currently get the UID information itself, and it is
called by udev before this information is added to the udev database.

changes from v1 to v2
---------------------
0001: This patch is now rebased on top of, and makes use of Martin's
patches that provide a default *_multipath_config, udev, and logsink.
Because of this, mpathvalid_init() now has a parameter used to set
logsink. There is also a new API function, mpathvalid_reload_config().

0003: This is completely new, since Martin pointed out that adding a new
config option to always use the fallback getuid code was unnecessary. It
just makes a uid_attribute of "" log at normal levels.

changes from v2 to v3
---------------------
0001:   rebased on top of Martin's latest patches, fixed some small bugs
        and added documentation to mpath_valid.h
0002:   New
0004:   was 0003. Untangled the logic, at Martin's suggestion.

Benjamin Marzinski (4):
  multipath: add libmpathvalid library
  multipath-tools tests: and unit tests for libmpathvalid
  libmultipath: add uid failback for dasd devices
  libmultipath: change log level for null uid_attribute

 Makefile                            |   3 +-
 Makefile.inc                        |   1 +
 libmpathvalid/Makefile              |  39 +++
 libmpathvalid/libmpathvalid.version |  10 +
 libmpathvalid/mpath_valid.c         | 202 ++++++++++++
 libmpathvalid/mpath_valid.h         | 155 +++++++++
 libmultipath/defaults.h             |   1 +
 libmultipath/discovery.c            |  45 ++-
 libmultipath/libmultipath.version   |   6 +
 tests/Makefile                      |   5 +-
 tests/mpathvalid.c                  | 467 ++++++++++++++++++++++++++++
 11 files changed, 929 insertions(+), 5 deletions(-)
 create mode 100644 libmpathvalid/Makefile
 create mode 100644 libmpathvalid/libmpathvalid.version
 create mode 100644 libmpathvalid/mpath_valid.c
 create mode 100644 libmpathvalid/mpath_valid.h
 create mode 100644 tests/mpathvalid.c

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

