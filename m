Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D5915B27DF
	for <lists+dm-devel@lfdr.de>; Sat, 14 Sep 2019 00:04:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEA383082E72;
	Fri, 13 Sep 2019 22:04:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46EB65D71C;
	Fri, 13 Sep 2019 22:04:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 602DA18005A0;
	Fri, 13 Sep 2019 22:04:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DM49Wc031633 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 18:04:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9AEC6092D; Fri, 13 Sep 2019 22:04:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5F560605;
	Fri, 13 Sep 2019 22:04:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8DM45Ux024022; 
	Fri, 13 Sep 2019 17:04:06 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8DM45D4024021;
	Fri, 13 Sep 2019 17:04:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 13 Sep 2019 17:04:00 -0500
Message-Id: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/4] misc multipath patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 13 Sep 2019 22:04:48 +0000 (UTC)

These are a couple of disconnected multipath patches.

Changes in v2:

0003: As Martin suggested, fail immediately on wrong number of prin
      actions.

0004: mp_init now is an optional symbol for checker DSOs, and is ignored
      if it's missing, again at Martin's suggestion.

Benjamin Marzinski (4):
  mpathpersist: remove broken/unused code
  libmultipath: EMC PowerMax NVMe device config
  mpathpersist: fix leaks
  libmultipath: fix mpcontext initialization

 libmpathpersist/mpath_persist.c      | 16 ++++----------
 libmultipath/checkers.c              | 27 +++++++++++++++++++++--
 libmultipath/checkers.h              |  1 +
 libmultipath/checkers/emc_clariion.c |  7 ++++++
 libmultipath/discovery.c             |  2 ++
 libmultipath/hwtable.c               |  6 +++++
 mpathpersist/main.c                  | 33 ++++++++++++++++++----------
 7 files changed, 67 insertions(+), 25 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
