Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41DAF2FC
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 00:40:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 307E687638;
	Tue, 10 Sep 2019 22:40:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 332D65C21E;
	Tue, 10 Sep 2019 22:40:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BCBD180221E;
	Tue, 10 Sep 2019 22:39:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8AMdQmu030066 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Sep 2019 18:39:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 672436012C; Tue, 10 Sep 2019 22:39:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC9F8600F8;
	Tue, 10 Sep 2019 22:39:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8AMdM5M009381; 
	Tue, 10 Sep 2019 17:39:22 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8AMdL8B009380;
	Tue, 10 Sep 2019 17:39:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 10 Sep 2019 17:39:17 -0500
Message-Id: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] misc multipath patches
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 10 Sep 2019 22:40:11 +0000 (UTC)

These are a couple of disconnected multipath patches.

Benjamin Marzinski (4):
  mpathpersist: remove broken/unused code
  libmultipath: EMC PowerMax NVMe device config
  mpathpersist: fix leaks
  libmultipath: fix mpcontext initialization

 libmpathpersist/mpath_persist.c      | 16 ++++----------
 libmultipath/checkers.c              | 29 ++++++++++++++++++++++++--
 libmultipath/checkers.h              |  1 +
 libmultipath/checkers/cciss_tur.c    |  5 +++++
 libmultipath/checkers/directio.c     |  5 +++++
 libmultipath/checkers/emc_clariion.c |  7 +++++++
 libmultipath/checkers/hp_sw.c        |  5 +++++
 libmultipath/checkers/rdac.c         |  5 +++++
 libmultipath/checkers/readsector0.c  |  5 +++++
 libmultipath/checkers/tur.c          |  5 +++++
 libmultipath/discovery.c             |  2 ++
 libmultipath/hwtable.c               |  6 ++++++
 mpathpersist/main.c                  | 31 ++++++++++++++++++----------
 13 files changed, 97 insertions(+), 25 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
