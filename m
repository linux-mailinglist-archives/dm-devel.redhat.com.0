Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F62DEBD4
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608332829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SlS2aGfbeRvMcVsWDa1fvAfPq1Wt7Qa/rEjO6iYIiBI=;
	b=hKGB4ZRVHk/e8zHp//wEMb0R5gw1aJcTGgxihhg2DDqOxSrL8zBP9qLCtB80WnETdZuVjY
	RW4OtRgqP8UdfvmSFjlD7kCuIf4eUrrMRgHJhOBTie2SmbBBfoyKnjInD0+vGsFTxKpGwT
	lqE2HoY9TGuxubXPRqv2WfCEpgl/AeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-4cVZLV2_O-q2Vg8wnOfiHQ-1; Fri, 18 Dec 2020 18:07:07 -0500
X-MC-Unique: 4cVZLV2_O-q2Vg8wnOfiHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F168049C6;
	Fri, 18 Dec 2020 23:07:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A6B2999F;
	Fri, 18 Dec 2020 23:07:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B863D1809CA1;
	Fri, 18 Dec 2020 23:06:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIN6lth026950 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:06:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 560515D9E4; Fri, 18 Dec 2020 23:06:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 579E55D9E8;
	Fri, 18 Dec 2020 23:06:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIN6h4R009758; 
	Fri, 18 Dec 2020 17:06:43 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIN6g4B009757;
	Fri, 18 Dec 2020 17:06:42 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 18 Dec 2020 17:06:36 -0600
Message-Id: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/6] More misc multipath patches
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first two patches fix issues with mpathpersist. The second two deal
with minor configuration file issues. The fifth patch deals with a
problem with multipathd.service the could cause multipathd to not get
stopped until after final.target was reached, causing shutdown errors.
The last patch is just a doc clarification, inspired by customer
questions.

Benjamin Marzinski (6):
  mpathpersist: Fix Register and Ignore with 0x00 SARK
  mpathpersist: update prkeys file on changing registrations
  libmultipath: warn about missing braces at end of multipath.conf
  libmultipath: ignore multipaths sections without wwid option
  multipathd: Fix multipathd stopping on shutdown
  multipath.conf.5: Improve checker_timeout description

 libmpathpersist/mpath_persist.c | 10 ++++++----
 libmultipath/config.c           |  7 +++++++
 libmultipath/parser.c           |  5 +++--
 multipath/multipath.conf.5      |  9 +++++++--
 multipathd/multipathd.service   |  2 +-
 5 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

