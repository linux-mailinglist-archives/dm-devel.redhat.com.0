Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17E422772A1
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:39:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-t5cFZNffPTqMUkiDWzZOFA-1; Thu, 24 Sep 2020 09:39:39 -0400
X-MC-Unique: t5cFZNffPTqMUkiDWzZOFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D51B081F030;
	Thu, 24 Sep 2020 13:39:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 824B21A4D7;
	Thu, 24 Sep 2020 13:39:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2C9B8C7A3;
	Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdTac025986 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93E92100619D; Thu, 24 Sep 2020 13:39:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6ED1006180
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1247185A78B
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:26 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-56-tVQMvk31PyuaDCMpZrLsbA-1;
	Thu, 24 Sep 2020 09:39:24 -0400
X-MC-Unique: tVQMvk31PyuaDCMpZrLsbA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9CF0BAD07;
	Thu, 24 Sep 2020 13:39:22 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:55 +0200
Message-Id: <20200924133716.14120-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdTac025986
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/21] multipath-tools: shutdown,
	libdevmapper races, globals
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

this series contains a number of patches I've wanted to do for some
time. It's based on my "upstream-queue" tree
(https://github.com/openSUSE/multipath-tools/tree/upstream-queue),
plus my previously submitted "multipath-tools:add linker version scripts"
series. The reason is that this series contains a number of ABI
changes, and is thus suitable for demonstrating how to work with
the libmultipath linker version scripts.

Patch 1-8 are related to multipathd shutdown and systemd notifcation.
Patch 1 and 8 have been part of my earlier series "multipath-tools: 
Fix remaining shutdown delay issues" from Jan, 2019. But this is so
long ago that I didn't mark this as a v2. I have tried to address
Ben's issues with #1 (size_mismatch_seen leak, and premature sd_notify)
(https://www.redhat.com/archives/dm-devel/2019-January/msg00097.html).
#8 is just resent, after the recent discussion
(https://www.redhat.com/archives/dm-devel/2020-August/msg00342.html).
Ben's remark about sd_notify() drove me to reexamine that feature,
and actually improve a little by informing systemd of shutdown and
reconfigure operations.

Patch 9-11 are an attempt to fix races in libdevmapper, as discussed
a while ago in the "fix fd leak when iscsi device logs in" thread
(https://www.redhat.com/archives/dm-devel/2020-July/msg00321.html and
references).

Patch 12ff. add definitions of the symbol get_multipath_config(),
put_multipath_config(), udev, and logsink to libmultipath. This way
callers won't have to bother with defining these global symbols any
more in the future (but they still can).

Changes v1 -> v2:

 - rebased on "version script" series. Some patches which modify the
   ABI (10, 11, 13, 14, 17) have the respective hunks added.
 - 10/21: Added fix for the hwtable unit test. added comments.
   avoid logging a version that couldn't be determined.
 - 11/21: renamed libmp_task_run -> libmp_dm_task_run
 - 13/21: get_multipath_config(): return NULL if not initialized
   zero out configuration in _uninit_config() (Ben)
 - 17/21: Changed initialization as discussed with Ben. Added documentation
   in config.h.
 - 19/21: This one is new, as suggested by Ben
 - 20/21: This was 19 before, simplified now as the real changes are
   in libmpathpersist.
 - 21/21: New, also remove the globals in multipathd.

Regards
Martin

Martin Wilck (21):
  multipathd: allow shutdown during configure()
  multipathd: avoid sending "READY=1" to systemd on early shutdown
  multipathd: send "STOPPING=1" to systemd on shutdown
  multipathd: send "RELOADING=1" to systemd on DAEMON_CONFIGURE state
  multipathd: use volatile qualifier for running_state
  multipathd: generalize and fix wait_for_state_change_if()
  multipathd: set_config_state(): avoid code duplication
  multipathd: cancel threads early during shutdown
  multipath-tools: don't call dm_lib_release() any more
  libmultipath: devmapper: refactor libdm version determination
  libmultipath: protect racy libdevmapper calls with a mutex
  libmultipath: constify file argument in config parser
  libmultipath: provide defaults for {get,put}_multipath_config
  libmpathpersist: allow using libmultipath {get,put}_multipath_config
  multipath: use {get_put}_multipath_config from libmultipath
  mpathpersist: use {get,put}_multipath_config() from libmultipath
  libmultipath: add udev and logsink symbols
  multipath: remove logsink and udev
  libmpathpersist: call libmultipath_{init,exit}()
  mpathpersist: remove logsink and udev
  multipathd: remove logsink and udev

 kpartx/kpartx.c                         |   1 -
 libmpathpersist/libmpathpersist.version |   6 +
 libmpathpersist/mpath_persist.c         |  50 ++++-
 libmpathpersist/mpath_persist.h         |  31 ++++
 libmultipath/config.c                   | 124 +++++++++++--
 libmultipath/config.h                   |  70 ++++++-
 libmultipath/configure.c                |   6 +
 libmultipath/debug.c                    |   2 +
 libmultipath/devmapper.c                | 233 ++++++++++++++++--------
 libmultipath/devmapper.h                |  13 +-
 libmultipath/discovery.c                |   3 +
 libmultipath/libmultipath.version       |  29 ++-
 libmultipath/parser.c                   |   9 +-
 libmultipath/parser.h                   |   2 +-
 libmultipath/propsel.c                  |  10 +-
 libmultipath/util.c                     |  10 +
 libmultipath/util.h                     |   2 +
 mpathpersist/main.c                     |  22 +--
 multipath/main.c                        |  28 +--
 multipathd/cli_handlers.c               |   2 -
 multipathd/dmevents.c                   |   4 +-
 multipathd/main.c                       | 126 ++++++-------
 multipathd/waiter.c                     |   2 +-
 tests/Makefile                          |   2 +-
 tests/hwtable.c                         |   3 -
 tests/test-lib.c                        |  13 ++
 26 files changed, 571 insertions(+), 232 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

