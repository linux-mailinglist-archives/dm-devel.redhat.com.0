Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7AF153886
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PoN3SxRVEUWTthB/Lsh7aNr09Mw75ss3qZlpgYS1+tg=;
	b=H2AQcT/yMB9rC6VFpK4RNYBUxbLMsgmkwK4qjEzryoVDnM5+4RzlO5McbMJ6+mSJK7KVFi
	Y1QypBL3/3JlZqR5tQPIt2aR2A7WKTtC02r3Jalq4tR6WLD6+b2CXOpjCO5sAzzykvc0PR
	8jqCtaDLpU6OixVpBJGo79C3hAPsRoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-LGb_k48BNQyj1rEDrJTKmQ-1; Wed, 05 Feb 2020 13:58:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40614185734D;
	Wed,  5 Feb 2020 18:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6368DC13;
	Wed,  5 Feb 2020 18:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F9D41803C33;
	Wed,  5 Feb 2020 18:58:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwOVk019360 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E595E790CF; Wed,  5 Feb 2020 18:58:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C9B790C4;
	Wed,  5 Feb 2020 18:58:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwL50032612; 
	Wed, 5 Feb 2020 12:58:21 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwKhf032611;
	Wed, 5 Feb 2020 12:58:20 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:03 -0600
Message-Id: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/17] Multipath patch dump
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: LGb_k48BNQyj1rEDrJTKmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch set is has multiple parts.

patch 01 is just a resubmit of my previous patch, with Martin's
corrections added.

Patches 02 - 07 are miscellaneous fixes and cleanups

Patches 08 - 10 are related to adding a new format wildcard, at the
	request of HPE, that allows multipath to get and display
	information from the vendor specific VPD pages

Patches 11 - 17 are the part that needs the most review, patch 14
	especially. It turns out that on machines with a large number
	of cores, io_destroy(), which is used by the directio checker,
	can take a long time to complete. Talking to some kernel people
	at Red Hat, I was told that this isn't a bug. It's working as
	expected, and multipath shouldn't be issuing so many
	io_destroy() calls (1 per path, when multipath or multipathd
	stops). Cutting out the io_destroy calls involved a major change
	to the directio checker. It's pretty hard to test a lot of the
	corner cases on actual hardware, so I've written a bunch of
	unit tests for this (patches 16 & 17).

Changes is v2:
0001-multipathd-warn-when-configuration-has-been-changed.patch
	Minor changes, including using a structure instead of an
	array to hold the watch descriptors, as suggested by Martin
	Wilck.

0002-multipathd-staticify-uxlsnr-variables-functions.patch
	New patch

0008-libmultipath-fix-sgio_get_vpd-looping.patch
	Test has been changed to keep create_vpd83 the same, and
	overwrite the length in the actual test, as suggested by
	Martin Wilck

0010-libmultipath-add-code-to-get-vendor-specific-vpd-dat.patch
	The information to find the vpd page and how to decode it is
	now simply the index in a table of name -> page_nr mappings

0012-libmultipath-change-failed-path-prio-timeout.patch
	The timeout argument has been renamed to avoid confusion,
	as suggested by Martin Wilck

0015-libmultipath-make-directio-checker-share-io-contexts.patch
	Minor changes to print more useful messages, and avoid
	printing anything when we get a non-zero io_cancel()
	result, as suggested by Martin Wilck

0016-tests-add-directio-unit-tests.patch
	Minor change to improve readability, as suggested by
	Martin Wilck

0017-tests-make-directio-tests-able-to-work-on-a-real-dev.patch
	New patch. This adds the ability to set a testing device, so
	you can run the directio tests on an actual device

Benjamin Marzinski (17):
  multipathd: warn when configuration has been changed.
  multipathd: staticify uxlsnr variables/functions
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
  tests: make directio tests able to work on a real device

 libmpathpersist/mpath_persist.c  |   2 +-
 libmultipath/checkers.c          |  29 +-
 libmultipath/checkers.h          |   1 +
 libmultipath/checkers/directio.c | 336 ++++++++++---
 libmultipath/config.c            |  10 +
 libmultipath/config.h            |   2 +
 libmultipath/dict.c              |  38 ++
 libmultipath/discovery.c         |  80 ++-
 libmultipath/discovery.h         |   2 +-
 libmultipath/foreign.c           |  11 +-
 libmultipath/hwtable.c           |   1 +
 libmultipath/print.c             |  25 +
 libmultipath/prio.c              |   6 +-
 libmultipath/propsel.c           |  20 +-
 libmultipath/propsel.h           |   1 +
 libmultipath/structs.h           |  16 +-
 libmultipath/unaligned.h         |   4 +-
 mpathpersist/main.c              |   1 +
 multipath/main.c                 |   1 +
 multipath/multipath.conf.5       |  15 +-
 multipathd/main.c                |  18 +-
 multipathd/uxlsnr.c              | 150 +++++-
 tests/Makefile                   |  19 +-
 tests/directio.c                 | 812 +++++++++++++++++++++++++++++++
 tests/directio_test_dev          |   4 +
 tests/vpd.c                      |  87 ++--
 26 files changed, 1534 insertions(+), 157 deletions(-)
 create mode 100644 tests/directio.c
 create mode 100644 tests/directio_test_dev

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

