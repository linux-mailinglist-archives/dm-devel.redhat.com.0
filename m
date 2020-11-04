Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F239A2A5E6A
	for <lists+dm-devel@lfdr.de>; Wed,  4 Nov 2020 07:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604473060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=50yp2CsdKIwSkocpOSTyu1DO8/MppyIQ2HjUet3G2HI=;
	b=jQT84FWDRsB0E49ghlz8K4bY4i/oUkCIjo7GgrgzcA+RclpI2Y5W57FvXaM5a4SAitIzKu
	oZBUG1WkDJLiZhGi9leq6KaoShyTnCE9eZa4ZPLGzZzCn/w11cQwPq/k7eennU0TnHRW02
	OCKR4yLVf3sQJLdOWZxgNpWi/Co7j80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-8sC1fFagMtmM49G0MShZBQ-1; Wed, 04 Nov 2020 01:57:37 -0500
X-MC-Unique: 8sC1fFagMtmM49G0MShZBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAF887951C;
	Wed,  4 Nov 2020 06:57:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05B071007506;
	Wed,  4 Nov 2020 06:57:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFA47180B658;
	Wed,  4 Nov 2020 06:57:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A46sFkd017282 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 01:54:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A22935C26C; Wed,  4 Nov 2020 06:54:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 984E25C1D0;
	Wed,  4 Nov 2020 06:54:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A46sBKu022460; 
	Wed, 4 Nov 2020 00:54:11 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A46sA4M022459;
	Wed, 4 Nov 2020 00:54:10 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  4 Nov 2020 00:54:03 -0600
Message-Id: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/6] Misc Multipath patches
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

This is a set of unrelated patches, based on top of my previous "add
library to check if device is a valid path" patchset. The first two
patches add a new config option, eh_deadline, that sets the scsi sysfs
value of the same name for scsi path devices. This has been requested by
multiple customers. Patch 0004 is a change to detecting rdac support
requested by Netapp.

Patch 0005 fixes a rare segfault during shutdown, that happens when the
tur DSO is unloaded while the tur thread is still running. The issue is
that unless we make the tur_checker thread joinable, there is no way to
be sure that it isn't still running when the DSO is unloaded. I tried to
fix this in a way that allowed the DSO to get cleaned up. But without
redoing the tur_thread, that was impossible. Even if the cleanup
happened when the tur_thread was running a cleanup handler function from
libmultipath (not the DSO), while in pthread_exit(), which doesn't
return back to the calling fuction, it would segfault.

I realize that there has just been a lot of work done to make sure that
multipathd is cleaning up before exitting that this code is going
against that, but I'm not sure that the cost of redoing the tur_thread
is worth the benefit of being able to unload the DSO. If people feel
strongly that we should always unload the DSO, I can redo this and make
the tur_thread joinable with pthread_tryjoin_np(), and add code to the
checkerloop or uxlsnrloop to join with orphaned tur_threads.  That
should work.

Changes from v1 to v2:
0002: multiple small fixes suggested by Martin
0004: New patch to setup for checking vpd page 0x00. Just refactoring code,
      with not functional changes.
0005 (was 0004): added checking for vpd page 0xc9 in vpd page 0x00, as
                 suggested by Martin
0006 (was 0005): Added version script update


Benjamin Marzinski (6):
  libmultipath: move fast_io_fail defines to structs.h
  libmultipath: add eh_deadline multipath.conf parameter
  multipathd: remove redundant vector_free() int configure
  libmultipath: factor out code to get vpd page data
  libmultipath: limit reading 0xc9 vpd page
  libmultipath: don't dlclose tur checker DSO

 libmultipath/checkers.c           |  10 ++-
 libmultipath/checkers.h           |   1 +
 libmultipath/checkers/tur.c       |   1 +
 libmultipath/config.c             |   2 +
 libmultipath/config.h             |  10 +--
 libmultipath/configure.c          |   1 +
 libmultipath/dict.c               |  40 +++++++-----
 libmultipath/dict.h               |   2 +-
 libmultipath/discovery.c          | 104 ++++++++++++++++++++++++++----
 libmultipath/discovery.h          |   1 +
 libmultipath/libmultipath.version |   5 ++
 libmultipath/propsel.c            |  29 +++++++--
 libmultipath/propsel.h            |   1 +
 libmultipath/structs.h            |  24 +++++++
 multipath/multipath.conf.5        |  16 +++++
 multipathd/main.c                 |   8 +--
 16 files changed, 208 insertions(+), 47 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

