Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 529562B5EE
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BA7C30C1AFE;
	Mon, 27 May 2019 13:01:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9CB6062A;
	Mon, 27 May 2019 13:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6099206D5;
	Mon, 27 May 2019 13:01:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0aua009861 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 670EB6A255; Mon, 27 May 2019 13:00:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FD926C350;
	Mon, 27 May 2019 13:00:34 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B47C89D4F2;
	Mon, 27 May 2019 13:00:21 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:10 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:33 +0200
Message-Id: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Mon, 27 May 2019 13:00:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 27 May 2019 13:00:30 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/9] speeding up mpathpersist
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 27 May 2019 13:01:53 +0000 (UTC)

We've had reports that mpathpersist doesn't scale well in environments
with lots of IO devices. This patch set tries to address this problem
with a few optimizations:

 - instead of doing a full path discovery at startup, only look at
   paths that are part of the maps being worked on
 - allow multiple PR commands in a single run using "batch files",
   without re-discovering everything between PR commands
 - avoid looking at priorities

I've done some basic testing and it seems to work. It remains to be
seen what the effect on performance really is, but the amount of system
calls to be performed for a given set of mpathpersist actions should
be substantially reduced in any case, especially when using batching.

---
v2:
 - avoid memory leak with --batch-file (Ben Marzinski)
 - add documentation to usage() output and mpathpersist man page
 - integrate "mpathpersist.8: fix examples in man page" which I'd sent
   separately before


Martin Wilck (9):
  mpathpersist: call usage() just once on return
  mpathpersist: add option --batch-file (-f)
  mpathpersist: no need to treat error close() as fatal
  libmpathpersist: updatepaths: deal with missing pp->udev
  libmpathpersist: factor out initialization and teardown
  mpathpersist: initialize data structures only once
  libmpathpersist: don't bother with priorities
  mpathpersist.8: fix examples in man page
  mpathpersist.8: add documentation for --batch-file (-f)

 libmpathpersist/mpath_persist.c | 250 +++++++++++++++-----------------
 libmpathpersist/mpath_persist.h |  40 +++++
 mpathpersist/main.c             | 227 ++++++++++++++++++++++-------
 mpathpersist/main.h             |   1 +
 mpathpersist/mpathpersist.8     | 121 ++++++++++++++--
 5 files changed, 440 insertions(+), 199 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
