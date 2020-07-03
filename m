Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E27C0213059
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593734868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WhDIzdj/aajIJfGbLerGwk7WGd00phgl03mzpcwjcCA=;
	b=OhcYcFaHatqp9c4Kh9QR/lhiyPrx6i/FIlDzVx33KlIMcJVvdk3dOTbOuOwjkQxyqIGKrN
	Ry1PWkPbonf2gXY0cNeaT2KV3gAfq7mHBAD+dzVuo1msxiPwKjwvBVt9+5jkNLA5NNRrb/
	sLsZemZOBLjEI5BFEiF3fkATO3gP3sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-dibQ92qaP52Z3suKJF7WpQ-1; Thu, 02 Jul 2020 20:07:46 -0400
X-MC-Unique: dibQ92qaP52Z3suKJF7WpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6CC8015FA;
	Fri,  3 Jul 2020 00:07:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDF7C10027AC;
	Fri,  3 Jul 2020 00:07:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EF6618095FF;
	Fri,  3 Jul 2020 00:07:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06307CHM014350 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F38CA79252; Fri,  3 Jul 2020 00:07:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A767BEBE;
	Fri,  3 Jul 2020 00:07:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 063077fs014097; 
	Thu, 2 Jul 2020 19:07:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 063076ZG014096;
	Thu, 2 Jul 2020 19:07:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:06:59 -0500
Message-Id: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/7] Fix muitpath/multipathd flush issue
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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

Changes from v2 (all are Martin's suggestions):
0001:	Using dm_task_get_errno() and changed the names and values of
	the symbolic returns.

0002:	Changed symbolic return names, and improved some logging.

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
 multipathd/main.c          | 57 ++++++++++++++++------------------
 multipathd/main.h          |  1 +
 12 files changed, 160 insertions(+), 90 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

