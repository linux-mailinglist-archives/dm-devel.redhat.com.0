Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 031362978C1
	for <lists+dm-devel@lfdr.de>; Fri, 23 Oct 2020 23:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603487795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=si7SdmbJTuuVLskZbqhbAJKQJNUiKt/QyThKvDF/Mhk=;
	b=WPT6RgJeYx0zTyUK0bze7Yrl06+MfC1thCkznfubcKwKnBDVseQbucdUppCrner1VuZ8Kh
	d8LHxfzu+ERRVzvfoxzH9eZ7BNL12HF+q4Ln0joPU3PE040eDJYsBLbvPX7XX8QbRUROB8
	Ul2TGjp/eMLOkxgdz5E0FvBiwQD1GHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-aKh7dqyWOaGWtytzKUfh7A-1; Fri, 23 Oct 2020 17:16:32 -0400
X-MC-Unique: aKh7dqyWOaGWtytzKUfh7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADCC5804B74;
	Fri, 23 Oct 2020 21:16:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259EB10013BD;
	Fri, 23 Oct 2020 21:16:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B71A180B65D;
	Fri, 23 Oct 2020 21:16:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NLFDIB027769 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 17:15:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5BB760E1C; Fri, 23 Oct 2020 21:15:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC37B60CCC;
	Fri, 23 Oct 2020 21:15:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09NLF8ES012585; 
	Fri, 23 Oct 2020 16:15:09 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09NLF8pm012584;
	Fri, 23 Oct 2020 16:15:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Oct 2020 16:15:03 -0500
Message-Id: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/5] Misc Multipath patches
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

Benjamin Marzinski (5):
  libmultipath: move fast_io_fail defines to structs.h
  libmultipath: add eh_deadline multipath.conf parameter
  multipathd: remove redundant vector_free() int configure
  libmultipath: only read 0xc9 vpd page for devices with rdac checker
  libmultipath: don't dlclose tur checker DSO

 libmultipath/checkers.c     | 10 +++++-
 libmultipath/checkers.h     |  1 +
 libmultipath/checkers/tur.c |  1 +
 libmultipath/config.c       |  2 ++
 libmultipath/config.h       | 10 ++----
 libmultipath/configure.c    |  1 +
 libmultipath/dict.c         | 40 +++++++++++++--------
 libmultipath/dict.h         |  2 +-
 libmultipath/discovery.c    | 70 +++++++++++++++++++++++++++++--------
 libmultipath/propsel.c      | 21 +++++++++--
 libmultipath/propsel.h      |  1 +
 libmultipath/structs.h      | 24 +++++++++++++
 multipath/multipath.conf.5  | 16 +++++++++
 multipathd/main.c           |  8 ++---
 14 files changed, 159 insertions(+), 48 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

