Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F44D1FDA2A
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qz96H06beitwzFeuQ698ypMGK3ZomsMRQzHPuL0GgCo=;
	b=BQRbPSsnehTl7ZduOMecai2dzuKx5IvkiGNFTSXKFMAgEkYBTtmeg7jl1a3cZJ0/FHIRJw
	sF1WyE3kZeBy0TIrWZBQOwMcrLlhSZKHSvx1qbRaCpA7De6OI2UEuvLKM4P/fH5N/hqmCS
	+Rqd4GhgpdzxdE0X8/CZQlWbejQrc94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-Dy9e8h7dNNmndgGpMm-ZpQ-1; Wed, 17 Jun 2020 20:25:06 -0400
X-MC-Unique: Dy9e8h7dNNmndgGpMm-ZpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79AC3A0C01;
	Thu, 18 Jun 2020 00:25:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E1819931;
	Thu, 18 Jun 2020 00:24:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F4CF833B1;
	Thu, 18 Jun 2020 00:24:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0OXWJ026481 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 005B95D9E8; Thu, 18 Jun 2020 00:24:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D7A5D9D3;
	Thu, 18 Jun 2020 00:24:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OStS018465; 
	Wed, 17 Jun 2020 19:24:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OSI5018464;
	Wed, 17 Jun 2020 19:24:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:20 -0500
Message-Id: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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

If a multipath device is removed, and check_path() checks one of its
paths before multipathd processes either the uevent or the dm event from
removing it, multipathd will recreate the removed device. This happens
because check_path() will continute to check the removed device's former
paths until an event arrives removing the device.  A missing multpath
device will cause the update_multipath_strings() call to fail, setting
pp->dmstate to PSTATE_UNDEF.  If the path is up, this dmstate will cause
reinstate_path() to be called, which will also fail, because the
multipath device doesn't exist.  This will trigger a reload, restoring
the recently removed device.

This patchset handles this is two ways. The first two patches directly
fix these issues in check_path(), so that a missing multipath device
will no longer get recreated when checking one of its former paths. 

The other 5 patches add a "multipathd del maps" command, and make the
mutipath command delegate flush operations to multipathd so multipathd's
state remains in sync with the kernel's, while doing removes.

One source of complexity in these patches is that multipath suspends the
device with flushing before removing it, while multipathd doesn't.  It
does seem possible that the suspend could hang for a while, so I can
understand multipathd not using it.  However, that would take the
multipath device getting opened and IO being issued, between the time
when _dm_flush_map() verifies that the device isn't opened, and when it
suspends the device.  But more importantly, I don't understand how
suspending the device is useful.  If the device were to be opened
between when _dm_flush_map() checks the usage, and when it tries to
delete the device, device-mapper would simply fail the remove.  And if
the device isn't in use, there can't be any outstanding IO to flush.
When this code was added in commit 9a4ff93, there was no check if the
device was in use, and disabling queue_if_no_path could cause anything
that had the device open to error out and close it. But now that
multipath checks first if the device is open, I don't see the benefit to
doing this anymore. Removing it would allow multipathd and multipath to
use the same code to remove maps. Any thoughts?

Benjamin Marzinski (7):
  libmultipath: change do_get_info returns
  multipathd: fix check_path errors with removed map
  libmultipath: make dm_flush_maps only return 0 on success
  multipathd: add "del maps" multipathd command
  multipath: make flushing maps work like other commands
  multipath: delegate flushing maps to multipathd
  multipath: add option to skip multipathd delegation

 libmultipath/config.h     |  4 ++-
 libmultipath/configure.h  |  3 ---
 libmultipath/devmapper.c  | 41 ++++++++++++++++++-------------
 libmultipath/devmapper.h  |  3 ++-
 multipath/main.c          | 51 +++++++++++++++++++++++++++------------
 multipath/multipath.8     | 16 ++++++++----
 multipathd/cli.c          |  1 +
 multipathd/cli_handlers.c | 19 +++++++++++++++
 multipathd/cli_handlers.h |  1 +
 multipathd/main.c         | 39 ++++++++++++------------------
 multipathd/main.h         |  1 +
 11 files changed, 114 insertions(+), 65 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

