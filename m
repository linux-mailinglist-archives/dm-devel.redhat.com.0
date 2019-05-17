Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F322094
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF8BE307E051;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 814F610027C4;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A145206D2;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvUoh004797 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D40E620A3; Fri, 17 May 2019 22:57:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDAC61358;
	Fri, 17 May 2019 22:57:27 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C611A81F18;
	Fri, 17 May 2019 22:57:25 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:17 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:56:56 +0200
Message-Id: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Fri, 17 May 2019 22:57:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 17 May 2019 22:57:26 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 0/7] speeding up mpathpersist
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 17 May 2019 22:59:46 +0000 (UTC)

We've had reports that mpathpersist doesn't scale well in environments
with lots of IO devices. This patch set tries to address this problem
with a few optimizations:

 - instead of doing a full path discovery at startup, only look at
   paths that are part of the maps being worked on
 - allow multiple PR commands in a single run using "batch files",
   without re-discovering everything between PR commands
 - avoid looking at priorities

I've done some basic testing and it seems to work. It remains to be
seen what the effect on performance really is.

Regards
Martin

Martin Wilck (7):
  mpathpersist: call usage() just once on return
  mpathpersist: add option --batch-file (-f)
  mpathpersist: no need to treat error close() as fatal
  libmpathpersist: updatepaths: deal with missing pp->udev
  libmpathpersist: factor out initialization and teardown
  mpathpersist: initialize data structures only once
  libmpathpersist: don't bother with priorities

 libmpathpersist/mpath_persist.c | 250 +++++++++++++++-----------------
 libmpathpersist/mpath_persist.h |  40 +++++
 mpathpersist/main.c             | 218 +++++++++++++++++++++-------
 mpathpersist/main.h             |   1 +
 4 files changed, 320 insertions(+), 189 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
