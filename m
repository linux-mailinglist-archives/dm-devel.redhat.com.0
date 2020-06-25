Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF5C620A6F5
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dg4A/2fFtf510rjBv6KDZ3lroYLhPknjHQ0hPrAaU3A=;
	b=AkxnjdKgtymFxKARV9SdTi81Yl0FaveKUVCYkyBPErskZVNkNwJ1FBn03r0kEE4gmvUoS6
	rzwdRr3tL8nGtFSb6dThvLC8z1Hv7cxUFY5BSLAeVoY67nbmqIvlxDlX+bY2p2Y47fYCJb
	61NBwaXej0QX0DTusjF7jUmTOfaXi3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-MvBgwpapMPaXaCtJk7MqDg-1; Thu, 25 Jun 2020 16:42:42 -0400
X-MC-Unique: MvBgwpapMPaXaCtJk7MqDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8E0800597;
	Thu, 25 Jun 2020 20:42:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D0CD7554F;
	Thu, 25 Jun 2020 20:42:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 504BB1809547;
	Thu, 25 Jun 2020 20:42:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgSPP014012 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF3A52B4BF; Thu, 25 Jun 2020 20:42:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D88C2B47C;
	Thu, 25 Jun 2020 20:42:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgMpx028788; 
	Thu, 25 Jun 2020 15:42:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgL3D028787;
	Thu, 25 Jun 2020 15:42:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:14 -0500
Message-Id: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/7] Fix muitpath/multipathd flush issue
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

Changes from v1:
0001:	This is completely different. I've change how patch 0002 detects
	when a multipath device has disappeared. Instead of do_get_info,
	I need more return values on dm_get_map/status, and the
	update_multipath_* functions. I have used symbolic return
	values, which was the objection to the previous patch. I tried
	to picked generic enough names that they could be used for other
	devmapper.c functions as well.

0002:	At Martin's suggestion, multipath now differentiates between dm
	failures and a missing multipath device in
	update_multipath_strings(). So there is no need to recheck if
	the device is missing.

0006:	Added some man page info that was previously in patch 0007

0007:	Removed mentions of the -D option in the man page and usage
	output.

I did not change anything about suspending the device on remove.  It was
not obvious how to break that up between multipath and multipathd, and
there are likely still some conversations to be had about what we need
to do to remove a device in multipath, and in what order.  So, for now,
I just kept all those functions the same, and just added the code
necessary to make multpathd work with them correctly, as is.

Benjamin Marzinski (7):
  libmultipath: make dm_get_map/status return codes symbolic
  multipathd: fix check_path errors with removed map
  libmultipath: make dm_flush_maps only return 0 on success
  multipathd: add "del maps" multipathd command
  multipath: make flushing maps work like other commands
  multipath: delegate flushing maps to multipathd
  multipath: add option to skip multipathd delegation

 libmultipath/config.h      |  4 ++-
 libmultipath/configure.h   |  3 --
 libmultipath/devmapper.c   | 63 +++++++++++++++++++++++++-------------
 libmultipath/devmapper.h   |  8 ++++-
 libmultipath/structs_vec.c | 45 +++++++++++++++------------
 multipath/main.c           | 44 ++++++++++++++++++--------
 multipath/multipath.8      |  4 +--
 multipathd/cli.c           |  1 +
 multipathd/cli_handlers.c  | 19 ++++++++++++
 multipathd/cli_handlers.h  |  1 +
 multipathd/main.c          | 50 +++++++++++++-----------------
 multipathd/main.h          |  1 +
 12 files changed, 155 insertions(+), 88 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

