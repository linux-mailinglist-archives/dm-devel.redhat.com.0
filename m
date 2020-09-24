Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9EE2772D8
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:44:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-xE2vbf_iNY2VC0q1U26z3Q-1; Thu, 24 Sep 2020 09:44:46 -0400
X-MC-Unique: xE2vbf_iNY2VC0q1U26z3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65046800493;
	Thu, 24 Sep 2020 13:44:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4227D5D9D3;
	Thu, 24 Sep 2020 13:44:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC9AC8C7A2;
	Thu, 24 Sep 2020 13:44:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjsE026814 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6E372028DCC; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC3BB2026F94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 069DF803528
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-177-OLCudpqrNlWoCS7riSH1Yw-1;
	Thu, 24 Sep 2020 09:41:38 -0400
X-MC-Unique: OLCudpqrNlWoCS7riSH1Yw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9D719AE44;
	Thu, 24 Sep 2020 13:41:36 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:31 +0200
Message-Id: <20200924134054.14632-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjsE026814
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/23] libmultipath: improve cleanup on exit
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben, hi lixiaokeng,

this series was inspired by lixiaokeng's recent posting "[QUESTION] memory
leak in main (multipath)". It implements my first idea, registering
cleanup handlers with atexit(). However it turned out to be quite
complex. In particular multipathd has a lot of things to clean up.

This series is based on the previous series "multipath-tools: shutdown, 
libdevmapper races, globals".

While the bulk of the series is the cleanup handling, it also contains
some bug fixes for issues that I found while working on this.

Regards
Martin

Martin Wilck (23):
  multipathd: uxlsnr: avoid deadlock on exit
  multipathd: Fix liburcu memory leak
  multipathd: move handling of io_err_stat_attr into libmultipath
  multipathd: move vecs desctruction into cleanup function
  multipathd: make some globals static
  multipathd: move threads destruction into separate function
  multipathd: move conf destruction into separate function
  multipathd: move pid destruction into separate function
  multipathd: close pidfile on exit
  multipathd: add helper for systemd notification at exit
  multipathd: child(): call cleanups in failure case, too
  multipathd: unwatch_all_dmevents: check if waiter is initialized
  multipathd: print error message if config can't be loaded
  libmultipath: add libmp_dm_exit()
  multipathd: fixup libdm deinitialization
  libmultipath: log_thread_stop(): check if logarea is initialized
  multipathd: add cleanup_child() exit handler
  libmultipath: fix log_thread startup and teardown
  multipathd: move cleanup_{prio,checkers,foreign} to libmultipath_exit
  multipath: use atexit() for cleanup handlers
  mpathpersist: use atexit() for cleanup handlers
  multipath: fix leaks in check_path_valid()
  multipath-tools: mpath-tools.supp: file with valgrind suppressions

 libmpathpersist/mpath_persist.c       |   2 -
 libmultipath/config.c                 |   5 +
 libmultipath/config.h                 |   2 +
 libmultipath/devmapper.c              |  10 +
 libmultipath/devmapper.h              |   1 +
 libmultipath/io_err_stat.c            |   7 +-
 libmultipath/libmultipath.version     |  26 +--
 libmultipath/log_pthread.c            |  60 +++--
 mpathpersist/main.c                   |   5 +-
 multipath/main.c                      |  94 +++++---
 multipathd/dmevents.c                 |   2 +
 multipathd/main.c                     | 305 +++++++++++++++++---------
 multipathd/uxlsnr.c                   |  17 +-
 third-party/valgrind/mpath-tools.supp |  33 +++
 14 files changed, 389 insertions(+), 180 deletions(-)
 create mode 100644 third-party/valgrind/mpath-tools.supp

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

