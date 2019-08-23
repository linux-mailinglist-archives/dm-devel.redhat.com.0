Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477D9B5C0
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B35B51801597;
	Fri, 23 Aug 2019 17:49:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5818D5C28F;
	Fri, 23 Aug 2019 17:49:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D98F6180221D;
	Fri, 23 Aug 2019 17:49:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHn4Hf010150 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BADCF608C2; Fri, 23 Aug 2019 17:49:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC66060872;
	Fri, 23 Aug 2019 17:49:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHmxbr006020; 
	Fri, 23 Aug 2019 12:48:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHmwFG006019;
	Fri, 23 Aug 2019 12:48:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:44 -0500
Message-Id: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/14] multipath marginal pathgroups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Fri, 23 Aug 2019 17:49:26 +0000 (UTC)

The first patch in this series is simply a resend of my previous patch
to fix vector_foreach_slot_backwards(). The rest of the patches are
related to adding support for an alternative way to deal with marginal
paths. Instead of delaying their reinstatement, which can cause problems
if multipath isn't set to queue IO when there are no usable paths, this
patchset adds a marginal_pathgroups option. If this is set, marginal
paths will be reinstated, but added to seperate marginal pathgroups.
They will remain there until the time when they would normally be
reinstated, at which point they will be returned to their regular
pathgroups. Marginal pathgroups will have a priority lower than all
regular pathgroups. This has the advantage of continuing to track
marginal paths, even if all the other paths go down temporarily, so that
multipath can switch back to the normal paths as soon as they come back
up.  This code also allows users to manually move paths between marginal
and regular pathgroups. This is especially important for Broadcom's
Fiber Channel Transport Daemon, since it doesn't use the multipathd
marginal path detectors, and thus will not automatically reinstate
marginal paths when all other paths have failed.

https://www.mail-archive.com/dm-devel@redhat.com/msg12956.html

Changes in v2:
- patch 04/14 is a combination of the old 04/16, 06/16, and 07/16
  patches, based on Martin's suggestion. Since all the code is the same
  as the previous patches, I have kept Martin's Reviewed-by

- old patch 09/16 has been moved up to 05/14 based on Martin's
  suggestion. There are no code changes

- patch 09/14 (old patch 11/16) moves path_group_prio_update()
  earlier in select_path_group() to make sure the pgp->marginal check
  uses a current value.

- patch 12/14 (old patch 14/16) changes how delay_checks is selected,
  to ignore the delay_checks values if any san_path_err options are
  set, based on Martin's suggestions. It also changes the man page
  wording.

Benjamin Marzinski (14):
  libmultipath: make vector_foreach_slot_backwards work as expected
  libmultipath: add marginal paths and groups infrastructure
  tests: add path grouping policy unit tests.
  libmultipath: add wrapper function around pgpolicyfn
  tests: update pgpolicy tests to work with group_paths()
  libmultipath: fix double free in pgpolicyfn error paths
  libmultipath: consolidate group_by_* functions
  libmultipath: make pgpolicyfn take a paths vector
  libmultipath: make group_paths handle marginal paths
  tests: add tests for grouping marginal paths.
  libmultipath: add marginal_pathgroups config option
  libmutipath: deprecate delay_*_checks
  multipathd: use marginal_pathgroups
  multipath: update man pages

 libmultipath/config.h      |    1 +
 libmultipath/configure.c   |   23 +-
 libmultipath/dict.c        |    3 +
 libmultipath/pgpolicies.c  |  346 +++++-------
 libmultipath/pgpolicies.h  |   12 +-
 libmultipath/print.c       |   18 +
 libmultipath/print.h       |    6 +-
 libmultipath/propsel.c     |   89 +++-
 libmultipath/propsel.h     |    3 +-
 libmultipath/structs.c     |   16 +-
 libmultipath/structs.h     |   15 +-
 libmultipath/switchgroup.c |   15 +-
 libmultipath/vector.h      |    2 +-
 multipath/multipath.conf.5 |   74 ++-
 multipathd/cli.c           |    5 +
 multipathd/cli.h           |    4 +
 multipathd/cli_handlers.c  |   91 ++++
 multipathd/cli_handlers.h  |    3 +
 multipathd/main.c          |   90 ++--
 multipathd/multipathd.8    |   19 +
 tests/Makefile             |    2 +-
 tests/pgpolicy.c           | 1036 ++++++++++++++++++++++++++++++++++++
 22 files changed, 1523 insertions(+), 350 deletions(-)
 create mode 100644 tests/pgpolicy.c

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
