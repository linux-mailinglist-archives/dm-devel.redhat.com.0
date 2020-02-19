Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0A72A163D4B
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095298;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dAT4sUys5Y4q/hR/Pp5kQ+WwZYDERavD9K4jjpBfzxk=;
	b=i9TDkUS60xHgay7ctsfAKNAlCOG6CIPHkniVGYDZ7TKheBUvNq2Mzjp3GmATkBkqQ9+ihV
	RrlN3267wbD1Mq1g0fqWj+e2VskvbJjtmdUCOyia+FuT2TVTROkbp9sNHHfqZqmUERP+Qw
	qXBZwBDK6idY9kozw3c/N5d/tDjWxMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-_NQY6QvLPQq7ioyE1yoUXA-1; Wed, 19 Feb 2020 01:54:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 727C413EA;
	Wed, 19 Feb 2020 06:54:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA90890526;
	Wed, 19 Feb 2020 06:54:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7814D1803C33;
	Wed, 19 Feb 2020 06:54:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6sbaW016772 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:54:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF70462660; Wed, 19 Feb 2020 06:54:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40875790CF;
	Wed, 19 Feb 2020 06:54:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6sXWt010317; 
	Wed, 19 Feb 2020 00:54:34 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6sXBd010316;
	Wed, 19 Feb 2020 00:54:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:54:28 -0600
Message-Id: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/5] Multipath Follow-up patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _NQY6QvLPQq7ioyE1yoUXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches resolve various minor issues that Martin had with my
previous patch set.

Benjamin Marzinski (5):
  multipath: fix issues found by compiling with gcc 10
  libmultipath: turn pp->vpd_data into a pointer
  libmultipath: change loading and resetting in directio
  libmultipath: change directio get_events() timeout handling
  libmultipath: cleanup old issues with directio checker

 kpartx/dasd.c                    |   6 +-
 libmultipath/checkers.c          |  26 ++---
 libmultipath/checkers.h          |   2 +-
 libmultipath/checkers/directio.c |  66 ++----------
 libmultipath/discovery.c         |  17 ++-
 libmultipath/print.c             |   7 +-
 libmultipath/structs.c           |   3 +
 libmultipath/structs.h           |   2 +-
 multipath/main.c                 |   2 +-
 tests/directio.c                 | 178 ++++++++++++-------------------
 tests/vpd.c                      |   3 +-
 11 files changed, 119 insertions(+), 193 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

