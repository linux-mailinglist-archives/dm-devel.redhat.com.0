Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1941401C0
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UD+W7fA18ieR6joLaAB+kv0J+yOJASla2c4L4nM49gc=;
	b=CAdsfzlteeLh+84H3fmO8WpFatbeO8bpE8B2UzpzkOZowZPb2ClWdlP5UqTm7OvtN5mlt+
	yQIj/nLYP/3kXGC6XHaH0q8B5tIUSczvD0N9xNX9jPiAM6snGupwNQoftay9Ir53gPgaUv
	7LAXcgPLEACmHFEu/TLl1bfN8NHg4Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-gli6J5H_MBeetb2VTpBwUw-1; Thu, 16 Jan 2020 21:18:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 699AA800EBF;
	Fri, 17 Jan 2020 02:18:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B630119C5B;
	Fri, 17 Jan 2020 02:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17BE6845FE;
	Fri, 17 Jan 2020 02:18:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IPLu030574 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22FF960C87; Fri, 17 Jan 2020 02:18:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E7E60C84;
	Fri, 17 Jan 2020 02:18:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2ILcW017236; 
	Thu, 16 Jan 2020 20:18:21 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IKeh017235;
	Thu, 16 Jan 2020 20:18:20 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:05 -0600
Message-Id: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 00/15] Multipath patch dump
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
X-MC-Unique: gli6J5H_MBeetb2VTpBwUw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch set is has multiple parts.

patch 01 is just a resubmit of my previous patch, with Martin's
corrections added.

Patches 02 - 06 are miscellaneous fixes and cleanups

Patches 07 - 09 are related to adding a new format wildcard, at the
        request of HPE, that allows multipath to get and display
        information from the vendor specific VPD pages

Patches 10 - 15 are the part that needs the most review, patch 14
        especially. It turns out that on machines with a large number
        of cores, io_destroy(), which is used by the directio checker,
        can take a long time to complete. Talking to some kernel people
        at Red Hat, I was told that this isn't a bug. It's working as
        expected, and multipath shouldn't be issuing so many
        io_destroy() calls (1 per path, when multipath or multipathd
        stops). Cutting out the io_destroy calls involved a major change
        to the directio checker. It's pretty hard to test a lot of the
        corner cases on actual hardware, so I've written a bunch of
        unit tests for this (patch 15).

Benjamin Marzinski (15):
  multipathd: warn when configuration has been changed.
  libmultipath: fix leak in foreign code
  Fix leak in mpathpersist
  libmultipath: remove unused path->prio_args
  libmultipath: constify get_unaligned_be*
  libmultipath: add missing hwe mpe variable merges
  libmultipath: fix sgio_get_vpd looping
  libmultipath: add vend_id to get_vpd_sgio
  libmultipath: add code to get vendor specific vpd data
  libmultipath: change how the checker async is set
  libmultipath: change failed path prio timeout
  multipathd: add new paths under vecs lock
  libmultipath: add new checker class functions
  libmultipath: make directio checker share io contexts
  tests: add directio unit tests

 libmpathpersist/mpath_persist.c  |   2 +-
 libmultipath/checkers.c          |  29 +-
 libmultipath/checkers.h          |   1 +
 libmultipath/checkers/directio.c | 337 ++++++++++++---
 libmultipath/config.c            |  12 +
 libmultipath/config.h            |   3 +
 libmultipath/dict.c              |  34 ++
 libmultipath/discovery.c         |  74 +++-
 libmultipath/discovery.h         |   2 +-
 libmultipath/foreign.c           |  11 +-
 libmultipath/hwtable.c           |   2 +
 libmultipath/print.c             |  27 ++
 libmultipath/prio.c              |   2 +-
 libmultipath/propsel.c           |  26 +-
 libmultipath/propsel.h           |   2 +
 libmultipath/structs.h           |  10 +-
 libmultipath/unaligned.h         |   4 +-
 mpathpersist/main.c              |   1 +
 multipath/main.c                 |   1 +
 multipath/multipath.conf.5       |   8 +
 multipathd/main.c                |  18 +-
 multipathd/uxlsnr.c              | 134 +++++-
 tests/Makefile                   |   3 +-
 tests/directio.c                 | 704 +++++++++++++++++++++++++++++++
 tests/vpd.c                      |  94 +++--
 25 files changed, 1394 insertions(+), 147 deletions(-)
 create mode 100644 tests/directio.c

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

