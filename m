Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB62C3969
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 17:48:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBE30307D931;
	Tue,  1 Oct 2019 15:48:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B97F5C219;
	Tue,  1 Oct 2019 15:48:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D58D94E58B;
	Tue,  1 Oct 2019 15:48:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91Fm2uK002130 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 11:48:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 336345D713; Tue,  1 Oct 2019 15:48:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-201.ams2.redhat.com [10.36.117.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ABB95D712;
	Tue,  1 Oct 2019 15:47:56 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: heinzm@redhat.com, dm-devel@redhat.com, snitzer@redhat.com
Date: Tue,  1 Oct 2019 17:47:51 +0200
Message-Id: <cover.1569888100.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/4] dm raid: fix raid set extensions not being
	synchronized
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 01 Oct 2019 15:48:12 +0000 (UTC)

This patch series fixes flaws causing raid set extensions not to be
synchronized in case a grown MD bitmap has to allocate additional pages.

When a raid set's grown, additional pages in the MD write-intent bitmap
may have to be allocated as a result.  Because so far no md_bitmap_resize()
occurs in that process, additional new regions (aka MD bitmap chunks) aren't
set dirty during creation, thus they fail to be synchronized.  Solve by
using md_bitmap_resize() in raid set size extensions to ensure dirtying
of additional, new regions.

Also address another flaw causing new regions not to be synchronized
after a raid set size reduction followed by an extension and streamline
recovery setup and progress status functions.  

Passes all lvm2 test suite RAID tests.


Heinz Mauelshagen (4):
  dm raid: change rs_set_dev_and_array_sectors API and callers
  dm raid: to ensure resynchronization, perform raid set grow in preresume
  dm raid: simplify rs_setup_recovery call chain
  dm raid: streamline rs_get_progress() and its raid_status() caller side

 .../admin-guide/device-mapper/dm-raid.rst     |   2 +
 drivers/md/dm-raid.c                          | 168 ++++++++++--------
 2 files changed, 91 insertions(+), 79 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
