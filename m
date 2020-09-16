Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE7A26C45C
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:39:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-54D6KGtIP_u6kJGNHTpR3A-1; Wed, 16 Sep 2020 11:39:53 -0400
X-MC-Unique: 54D6KGtIP_u6kJGNHTpR3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B1B010BBEFE;
	Wed, 16 Sep 2020 15:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BDD75143;
	Wed, 16 Sep 2020 15:39:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F88944A6D;
	Wed, 16 Sep 2020 15:39:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdWQB024198 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50F9D202450E; Wed, 16 Sep 2020 15:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 484AC201F30A
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E10CB80121C
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-522-alNmadSNMpiMdKq-XpwDJw-1;
	Wed, 16 Sep 2020 11:39:24 -0400
X-MC-Unique: alNmadSNMpiMdKq-XpwDJw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DBE4EB34D;
	Wed, 16 Sep 2020 15:39:37 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:36:59 +0200
Message-Id: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdWQB024198
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/19] multipath-tools: shutdown,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

this series contains a number of patches I've wanted to do for some
time. As usual, it's based on my "upstream-queue" tree
(https://github.com/openSUSE/multipath-tools/tree/upstream-queue).

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

Regards,
Martin

Cc: lixiaokeng@huawei.com

Martin Wilck (19):
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
  mpathpersist: remove logsink and udev

 kpartx/kpartx.c                 |   1 -
 libmpathpersist/mpath_persist.c |  43 +++++-
 libmpathpersist/mpath_persist.h |  28 ++++
 libmultipath/config.c           |  95 +++++++++++--
 libmultipath/config.h           |  28 +++-
 libmultipath/configure.c        |   6 +
 libmultipath/debug.c            |   2 +
 libmultipath/devmapper.c        | 228 +++++++++++++++++++++-----------
 libmultipath/devmapper.h        |  13 +-
 libmultipath/discovery.c        |   3 +
 libmultipath/parser.c           |   9 +-
 libmultipath/parser.h           |   2 +-
 libmultipath/propsel.c          |  10 +-
 libmultipath/util.c             |  10 ++
 libmultipath/util.h             |   2 +
 mpathpersist/main.c             |  26 +---
 multipath/main.c                |  28 +---
 multipathd/cli_handlers.c       |   2 -
 multipathd/dmevents.c           |   4 +-
 multipathd/main.c               | 117 ++++++++--------
 multipathd/waiter.c             |   2 +-
 21 files changed, 441 insertions(+), 218 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

