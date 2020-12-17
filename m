Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFDCA2DDB9C
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 23:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608245525;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bo5SUU70tO35CxH6vVtkN6YKifT0N3CynsRdDYDG54o=;
	b=CxmdeGvZtKdUkW5TDIsKtnoNq6h/FVbgqi8gZMnkXaMucvx3JVk55+8w6JwLlJXo2XURTD
	38BXdwsBxeoeZOAG3aO4bOn/P9HwlQhqeFP41MtcnVgYJzar0Lea14tE6HpiL4G247MBU/
	6PTQYbt4yfGfAF4DbZBO+kw96xilVCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-QKwwO1AyNW21WAklOaw1ag-1; Thu, 17 Dec 2020 17:51:36 -0500
X-MC-Unique: QKwwO1AyNW21WAklOaw1ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE1E180A087;
	Thu, 17 Dec 2020 22:51:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B805260C47;
	Thu, 17 Dec 2020 22:51:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15AFA4E590;
	Thu, 17 Dec 2020 22:51:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHMp9RG008306 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 17:51:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A43E32C8A6; Thu, 17 Dec 2020 22:51:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 402EB1ACC7;
	Thu, 17 Dec 2020 22:51:05 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BHMp4X1001789; 
	Thu, 17 Dec 2020 16:51:04 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BHMp4Kn001788;
	Thu, 17 Dec 2020 16:51:04 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 17 Dec 2020 16:50:58 -0600
Message-Id: <1608245463-1746-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/5] Misc Multipath patches
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a set of unrelated patches, based on top of my previous "add
library to check if device is a valid path" patchset. The first two
patches add a new config option, eh_deadline, that sets the scsi sysfs
value of the same name for scsi path devices. This has been requested by
multiple customers. Patch 0005 is a change to detecting rdac support
requested by Netapp.

Changes from v2 to v3:
0004: Add size parameter to fetch_vpd_page() instead of assuming 4096,
      as suggested by Martin
0005: I realized that fetch_vpd_page() already correctly checked the
      page number and size and warned about truncation, so there was no
      point in checking the size again in is_vpd_page_supported().
Dropped patch 0006 in favor or Martin's approach to solving the dlclose
      issue.

Changes from v1 to v2:
0002: multiple small fixes suggested by Martin
0004: New patch to setup for checking vpd page 0x00
0005 (was 0004): added checking for vpd page 0xc9 in vpd page 0x00, as
                 suggested by Martin
0006 (was 0005): Added version script update


Benjamin Marzinski (5):
  libmultipath: move fast_io_fail defines to structs.h
  libmultipath: add eh_deadline multipath.conf parameter
  multipathd: remove redundant vector_free() int configure
  libmultipath: factor out code to get vpd page data
  libmultipath: limit reading 0xc9 vpd page

 libmultipath/config.c      |   2 +
 libmultipath/config.h      |  10 +---
 libmultipath/configure.c   |   1 +
 libmultipath/dict.c        |  40 ++++++++------
 libmultipath/dict.h        |   2 +-
 libmultipath/discovery.c   | 104 +++++++++++++++++++++++++++++++------
 libmultipath/discovery.h   |   1 +
 libmultipath/propsel.c     |  29 +++++++++--
 libmultipath/propsel.h     |   1 +
 libmultipath/structs.h     |  24 +++++++++
 multipath/multipath.conf.5 |  16 ++++++
 multipathd/main.c          |   8 +--
 12 files changed, 188 insertions(+), 50 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

